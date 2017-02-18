
S = ('r','v')
out = open('xom-facsimiles.html','w')
out.write('<!DOCTYPE html>\n')
out.write('<html>\n\t<head>\n\t\t<title>XOM Folio Images</title>\n')
out.write('\t<style>.facs{display: inline-block;}</style>\n')
out.write('\t</head>\n\t<body>')
for f in range(1,57):
     for s in (1,2):
         facs = 'Page {}{}'.format(f,S[s-1])
         image_url="https://library.osu.edu/projects/popolwuj/folio_images/150AyerMS1515pvfl_{}_{}.jpg".format(f,S[s-1])
         out.write('<div class="facs" style="text-align:center; width:120px; padding:.5rem; margin:.5rem;">\n')
         out.write('<a href="{0}" target="_blank"><img src="{0}" width="100"/></a>\n'.format(image_url))
         out.write('<div style="font-size:10pt;font-family:sans-serif;">{}</div>\n'.format(facs))
         out.write('</div>\n')
out.write('\n\t</body>\n</html>')
out.close()