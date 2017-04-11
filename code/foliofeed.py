#! /usr/bin/env python3

import re, glob

files = '/Users/rca2t/Dropbox/Courses/SPAN/POPULVUH/facsimiles/OSU/150*.jpg'
pat = re.compile(r'^150AyerMS1515_?(\w+)_(\w+)_(r|v)\.jpg$')

print('file','title','scheme',sep='|')
for file in glob.glob(files):
	f = file.split('/')[-1]
	m = pat.search(f)
	title = f
	if m:
		section = m.group(1)
		if section == 'pvfl': section = 'Popol Vuh'
		folio = m.group(2)
		side = m.group(3) 
		if side == 'r': side = 'recto'
		else: side = 'verso'
		title = '{}, Folio {}, {}'.format(section,folio,side)
	scheme = 'public://images/pv/{}'.format(f)
	print(f,title,scheme,sep='|')