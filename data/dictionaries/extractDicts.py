import pandas as pd
import re
import os

varilexData = pd.read_csv("datosVARILEX.csv", on_bad_lines='warn', sep=";")

langs = [
#"ad",
"ar",
"bo",
"cl",
"co",
"cr",
"cu",
"do",
"ec",
"es",
"gq",
"gt",
"hn",
"mx",
"ni",
"pa",
"pe",
#"ph",
"pr",
"py",
"sv",
#"us",
"uy",
"ve"]


# useful functions
def removeContentBrackets(text):
    return re.sub(r'\[.*?\]', '', str(text))
def removeContentParenthesis(text):
    return re.sub(r'\(.*?\)', '', str(text))
def extractUStext(text):
    match = re.search(r'\(US:([^)]*)\)', str(text))
    if match:
        return match.group(1)
    else:
        return text   
def removeArticle(text):
    words = text.split()
    if len(words) == 2:
        # Check if the first word is an article and remove it
        if words[0].lower() in ['el', 'la']:
            return ' '.join(words[1:])
    return text    
    
   
# main loop    
for lan in langs:
   
   # Fesh start
   fileNameAll = 'dict.en-es_'+lan+'.txt'
   fileName1word = 'dict.en-es_'+lan+'.word.txt'
   try:
      os.remove(fileNameAll)
      os.remove(fileName1word)
   except OSError:
      pass

   # Extract the entries for the current language variant
   df = varilexData.loc[varilexData[lan] == '+', ['Ingles','Forma']]
   # remove annotations [phonetics] 
   df = df.applymap(removeContentBrackets)
   # we keep the American version for English in case there are two
   df['Ingles'] = df['Ingles'].apply(extractUStext)
   # remove specifications
   df = df.applymap(removeContentParenthesis)

   # phrase dictionary ready
   df['Ingles']=df['Ingles'].str.strip().str.lower()
   df['Forma']=df['Forma'].str.strip()
   df.to_csv(fileNameAll, header=None, index=None, sep=' ', mode='a')

   # single word dictionary
   df['Forma']=df['Forma'].apply(removeArticle)
   df = df.drop_duplicates().reset_index(drop=True)
   maskSPA=df['Forma'].str.strip().str.split(' ').str.len().eq(1)
   dfSPA1=df[maskSPA]
   maskENG=dfSPA1['Ingles'].str.strip().str.split(' ').str.len().eq(1)
   df11=dfSPA1[maskENG]
   df11 = df11.copy()
   df11.loc[:, 'Ingles'] = df11['Ingles'].str.strip().str.lower()
   df11.to_csv(fileName1word, header=None, index=None, sep=' ', mode='a')

