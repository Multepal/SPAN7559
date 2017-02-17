#! /users/rca2t/anaconda/bin/python3

'''
This file generates "stubs" of all the pages of each of the editions associated
with our project. Note that running it will overwrite the files, so it's best
not to run this in a directory with files that have been edited.s
'''

from jinja2 import Template

def generate_xom_pages():
    folios = range(1,57)
    sides = (1,2)
    t = Template(open('templates/xom-page-template.xml','r').read())
    xincludes = []
    for f in folios:
        if int(f) < 10: f = '0{}'.format(f)
        for s in sides:
            page_id = "xom-f{}-s{}".format(f,s)
            fname = 'xom-folio-{}-side-{}.xml'.format(f,s)
            xincludes.append('<xi:include href="{}" parse="xml" xpointer="{}" />'.format(fname,page_id))
            out = open(fname,'w')
            out.write(t.render(fn=f,sn=s,page_id=page_id))
            out.close()
    
    t2 = Template(open('templates/xom-all-template.xml').read())
    out = open('xom-all.xml','w')
    xinclude_frag = '\n'.join(xincludes)
    out.write(t2.render(xincludes=xinclude_frag))
    out.close()
        
def generate_clp_pages():
    pass

def generate_rst_pages():
    pass

if __name__ == '__main__':
    generate_xom_pages()
    print("DONE")