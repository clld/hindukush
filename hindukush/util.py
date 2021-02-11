import re
import itertools

from bs4 import BeautifulSoup as bs
from markdown import markdown


def fix_description(html, req):
    counter = itertools.count(0)

    def number(m):
        # Workaround for ordered lists with a number formatting that isn't understood by
        # markdown.
        if int(m.group('number')) == 1:
            return '({}) '.format(int(m.group('number')) + next(counter))
        return '({}) '.format(int(m.group('number')))

    s = re.sub(r'\*-\*\*(?P<bold>[a-z]+)\*\*\*', lambda m: '***-{}***'.format(m.group('bold')), html)
    s = re.sub(r'^\((?P<number>[0-9]+)\)\s+', number, s, flags=re.MULTILINE)
    html = markdown(s, extensions=['tables', 'fenced_code'])
    html = re.sub(
        r'\[(?P<lid>[a-z()]+)]',
        lambda m: '<a href="{}">[{}]</a>'.format(
            req.route_url('language', id=m.group('lid').replace('(', '_').replace(')', '')),
            m.group('lid')),
        html,
    )

    html = html.replace('<table>', '<table class="table table-nonfluid">')
    html = re.sub(r'</thead>\s+<tbody>', '', html, flags=re.MULTILINE).replace('<thead>', '<tbody>')
    html = html.replace('<th>', '<td>').replace('</th>', '</td>')
    text = bs(html, features='html5lib')
    for tr in text.find_all('tr'):
        #
        # FIXME: first row of IGT in italics!
        #
        # preprocessing of IGT tables:
        # - If td content startswith ‘ it should span as many columns as empty tds follow.
        translation = None
        for td in tr.find_all('td'):
            if td.text.startswith('‘'):
                translation = td
                translation['colspan'] = 1
            if translation and not td.text:
                translation['colspan'] += 1
                td.extract()
    return str(text)