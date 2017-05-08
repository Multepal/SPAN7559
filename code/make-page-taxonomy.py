#! /usr/bin/env python3

import glob, re
#from lxml import etree

base = '/Users/rca2t/Dropbox/Courses/SPAN/POPULVUH/GITREPO/layers/00-ximenez'
files = base + '/xom-folio-*.xml'
pat = re.compile(r'xom-folio-(\w+)-side-(\d+)\.xml')

colpat = re.compile(r'type="col"\s+n="([^"]+)"')
linepat = re.compile(r'<lb\s+[^>]*n\s*=\s*"([^"]+)"')

for file in glob.glob(files):
    f = file.split('/')[-1]
    m = pat.search(f)
    if (m):
        folio = m.group(1)
        side = m.group(2)
        if int(side) == 1: side = 'recto'
        else: side = 'verso'
    #print('Folio {} {}'.format(folio,side))
    page_label = 'Folio {} {}'.format(folio,side)
    with open('{}/{}'.format(base,f),'r') as infile:
        cn = 0
        ln = 0
        column_label = ''
        for line in infile.readlines():
            m1 = colpat.search(line)
            m2 = linepat.search(line)
            if m1:
                cn = m1.group(1).split('.')[-1]
                if int(cn) == 1: cn = 'A'
                else: cn = 'B'
                #print('-Column '+cn)
                column_label = 'Column {}'.format(cn)
            if m2:
                ln = m2.group(1)
                if int(ln) < 10: ln = '0'+ln
                line_label = 'Line {}'.format(ln)
                #print('--Line '+ln)
                print(','.join((page_label,column_label,line_label)))
