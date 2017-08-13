def rfi(soup):
    # for the link: http://www.rfi.fr/afrique/
    links[]
    for section in soup2.findAll("div", {"class" : "thumbNtitle"}):
        for link in section.findAll("a"):
             links.append (link.get("href"))
    return links

def jeuneAfrique(soup):
    # for the link: http://www.jeuneafrique.com/pays/rd-congo
    links[]
    for link in soup3.findAll("a"):
        if numbers in link:   #
            links.append(link.get("href"))
# sites with published date in full link such as wordpress sites. radiookapi.net is an example of this.
def wordpress(html, date):
    links = []
    for i in re.findall('''href=["'](.[^"']+)["']''', html, re.I):
        full_link = root_url + i
        if date_published in full_link:
            links.append(full_link)
    return links
