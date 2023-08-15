# -*- coding: utf-8 -*-

# Creates a transifex configuration from pot files that are found in i18n/pot
# Will be automatically run and committed via github actions

from pathlib import Path

organization = "qwat"
project = "qwat-doc"

with open(".tx/config", "w") as f:
    config = "[main]\n"
    config += "host = https://app.transifex.com\n\n"

    for pot in Path("i18n/pot/").rglob("*.pot"):
        rel_pot = pot.relative_to("i18n/pot/")
        full_stem = rel_pot.parent.joinpath(rel_pot.stem)
        resource_slug = str(full_stem).replace("_", "-").replace("/", "-")
        config += f"[o:{organization}:p:{project}:r:{resource_slug}]\n"
        config += f"file_filter = i18n/<lang>/{full_stem}.po\n"
        config += f"source_file = {pot}\n"
        config += "source_lang = en\n"
        config += "type = PO\n\n"

    f.write(config)
    f.write("\n")
    print(f"*create_tx_conf.py*: Config updated to: \n---\n{config}")
