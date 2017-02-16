#! /usr/bin/env python3

'''
This file generates "stubs" of all the folio pages associated with the Ximenez manuscript. 
It should only be run once in a directory, or it will blow away the files.
'''

from jinja2 import Template

folios = range(1,57)
sides = (1,2)
template = '''<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE TEI SYSTEM  "http://www.tei-c.org/release/xml/tei/custom/schema/dtd/tei_lite.dtd">
<TEI xmlns="http://www.tei-c.org/ns/1.0"> 
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Ximénez, Folio {{fn}}, Side {{sn}}</title>
            </titleStmt>
            <publicationStmt>
                <p>Publication information</p>
            </publicationStmt>
            <sourceDesc>
                <p>Information about the source</p>
            </sourceDesc>
        </fileDesc>
    </teiHeader>
    <text>
        <body>
            <div type="folio" n="{{fn}}">
                <div type="side" n="{{sn}}">
                    <div type="col" n="1" xml:lang="quc">
                    </div>
                    <div type="col" n="2" xml:lang="spa">
                    </div>
                </div>
            </div>
        </body>
    </text>
</TEI>'''

t = Template(template)

for f in folios:
    if int(f) < 10: f = '0{}'.format(f)
    for s in sides:
        fname = 'xom-folio-{}-page-{}.xml'.format(f,s)
        out = open(fname,'w')
        out.write(t.render(fn=f,sn=s))
        out.close()
