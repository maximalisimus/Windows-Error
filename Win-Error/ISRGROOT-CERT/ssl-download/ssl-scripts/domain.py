#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import pathlib
import sys

def main():
	domain_files = pathlib.Path(sys.argv[0]).parent.parent.joinpath("domain.txt").resolve()
	with open(domain_files, "r") as f:
		lines = f.read()
	onsearch1 = '://'
	onsearch2 = '/'
	fname = ''
	outname = ''
	onstart = ""
	onstart = re.search(onsearch1, lines)
	if onstart != None:
		onstart = re.search(onsearch1, lines).end()
	
	if onstart != None:
		outname = str(lines[onstart:]).replace(onsearch1,'').replace('\n','')
	else:
		outname = lines[:]
	onstart = re.search(onsearch2, outname)
	if onstart != None:
		onstart = re.search(onsearch2, outname).end()
	if onstart != None:
		fname = str(outname[:onstart]).replace(onsearch2,'')
	else:
		fname = outname[:]
	
	print(fname)
	

if __name__ == '__main__':
	main()
