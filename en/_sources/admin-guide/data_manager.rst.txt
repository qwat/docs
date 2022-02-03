Data manager
============

Import data to QWAT
-------------------------

It is generally prefered to load QWAT data trough the views and not the tables, given the complexity of object model, and the business intelligence located in the edit triggers. (e.g. node and topology handling). 

A [nice alternative technique](git@github.com:nliaudat/qwat-import-sample.git) is proposed by Nicolas Liaudat, that uses directly QGIS and expressions to load datasets. Please contribute to it if you find enhancements of issues. 

Import data from Topobase
-------------------------

* describe the process and tools
* describe the automated and manual checks to do
* mention specific point of attention

Export data to INTERLIS SIA 405 format
-------------------

Exporting a QWAT database to the Interlis Exchange Format (.xtf) is possible using the dedicated
tool `qgepqwat2ili <https://github.com/QGEP/qgepqwat2ili>`_ developped as part of an NGDI project.

Usage
^^^^^

Qgepqwat2ili requires Java (JRE 1.6 or above) and python (3.6 or above).

Then, it can be installed like any other python library:

.. code-block::

    pip install --upgrade qgepqwat2ili

A simple export is done like this (assuming you have a pgservice defined named `qwat`):

.. code-block::

    python -m qgepqwat2ili qwat export desktop/my_export.xtf

Full usage:

.. code-block::

    usage: python -m qgepqwat2ili qwat [-h] [--recreate_schema] [--skip_validation] [--pgservice PGSERVICE] [--log] [--include_hydraulics] export path

    positional arguments:
    {import,export}       import is currently not supported
    path                  path to the input/output .xtf file

    optional arguments:
    -h, --help            show this help message and exit
    --recreate_schema     drops schema and reruns ili2pg importschema (default: False)
    --skip_validation     skips running ilivalidator on input/output xtf (required to import invalid files, invalid outputs are still generated)
                            (default: False)
    --include_hydraulics  if provided, exports will include hydraulischer_strang and hydraulischer_node classes (these are currently likely to make the export invalid due to issues with the current ili model) (default: False)
    --pgservice PGSERVICE
                            name of the pgservice to use to connect to the database (default: qwat)
    --log                 saves a log file next to the input/output file (default: False)

Further documentation as well as an issue tracker can be found on the `qgepqwat2ili repository <https://github.com/QGEP/qgepqwat2ili>`_.

Limitations
^^^^^^^^^^^

The tool is currently experimental. Please be aware of the following limitations:

- The tool has not yet been tested much with actual data.

- The QWAT datamodel and the SIA 405 datamodel have some important differences. Thus, not all classes or properties
  can be matched precisely.

- By default, the tool does not export hydraulic classes. An option must explicitely be added to do so, but this will
  result to invalid files, due to differences mentionned above.

- The tool is currently only available as a command line tool. It will at some point be embedded in the QWAT plugin,
  similarly to what was done for QGEP.

- The tool currently supports only export. Supporting imports is planned, but this require larger changes to bring the
  QWAT datamodel closer to the SIA405 norm.

Make sure that you carefully review the resulting data, and ensure you are getting expected results before distributing
your files. Also please report any error or inconsistencies that you are getting on the
`qgepqwat2ili issue tracker <https://github.com/QGEP/qgepqwat2ili/issues>`_ to help improving the tool.

Export data to SIRE
-------------------

* describe the process and tools
* describe the automated and manual checks to do
* mention specific point of attention

Backup data
---------------

* Use PostgreSQL backups
* points of attention (PG versions…)

Restoring data
------------------

* Use PostgreSQL backups
* points of attention

QWAT analysis tools
-------------------

* Where to find data analysis scripts
* How to use them
