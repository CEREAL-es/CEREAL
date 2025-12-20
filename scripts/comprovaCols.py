#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
    Check format
    Date: 12.01.2025
    Author: cristinae
'''

import sys, os
import argparse

def get_parser():
    '''
    Creates a new argument parser.
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--iFile',
                    required=True,
                    type=str,
                    metavar="<inputFile>",
                    help="File with the corpus" )
    return parser


def main(args=None):

    parser = get_parser()
    args = parser.parse_args(args)

    INfile = args.iFile
    OUTfile = INfile+'.clean'
    lineNum = 1
    num_cols = 4
    with open(INfile, 'r') as file, open(OUTfile, 'w') as output:
        while True:
        #for line in file:
         try:
          line = file.readline()
          columns = line.split('\t')
         except UnicodeDecodeError as e:
          print(e)
          next
         if(line==''):
             break
         columns = line.split('\t')
         if(len(columns) != num_cols):
              print('Format error in datafile, line',lineNum)
              print(columns)
              #break
         else:
              #lineCl=line.encode('utf-8','ignore').decode("utf-8")
              output.write(line)
         lineNum=lineNum+1
        
if __name__ == "__main__":
   main()

