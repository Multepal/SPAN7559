#!/usr/bin/env python3

import glob, re
import lxml.etree as ET

xslt = ET.parse('xslt/xom-default.xsl')
pages = '../layers/00-ximenez/xom-folio-*.xml'
for page in glob.glob(pages):
    m = re.search(r'folio-(\d+)-side-(\d+)', page)
    (f, s) = m.groups()
    my_xml = open(page,'r')
    try:
        dom = ET.parse(my_xml)
    except:
        print('Problems with',f,s)
