# sites with published date in full link such as wordpress sites. radiookapi.net is an example of this.
def wordpress(html, date):
    links = []
    for i in re.findall('''href=["'](.[^"']+)["']''', html, re.I):
        full_link = root_url + i
        if date_published in full_link:
            links.append(full_link)
    return links
