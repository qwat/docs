# -*- coding: utf-8 -*-

# Creates a transifex configuration from pot files that are found in i18n/pot
# Will be automatically run and committed via github actions

from pathlib import Path
import os
import tempfile

repo_slug = 'qwat-doc'

with open('.tx/config', 'w') as f:
    f.write('[main]\n')
    f.write('host = https://www.transifex.com\n\n')

    for pot in Path('i18n/pot/').rglob('*.pot'):
        rel_pot = pot.relative_to('i18n/pot/')
        full_stem = rel_pot.parent.joinpath(rel_pot.stem)
        normalized_name = str(full_stem).replace('_', '-').replace('/', '-')
        f.write(f'[{repo_slug}.{normalized_name}]\n')
        f.write(f'file_filter = i18n/<lang>/{full_stem}.po\n')
        f.write(f'source_file = {pot}\n')
        f.write('source_lang = en\n')
        f.write('type = PO\n\n')


