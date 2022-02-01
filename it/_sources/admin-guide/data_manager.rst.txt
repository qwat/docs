Data manager
============

How to import and export data, backup and restore, etc

It is generally prefered to load QWAT data trough the views and not the tables, given the complexity of object model, and the business intelligence located in the edit triggers. (e.g. node and topology handling). 

A [nice alternative technique](git@github.com:nliaudat/qwat-import-sample.git) is proposed by Nicolas Liaudat, that uses directly QGIS and expressions to load datasets. Please contribute to it if you find enhancements of issues. 

Import data from Topobase
-------------------------

* describe the process and tools
* describe the automated and manual checks to do
* mention specific point of attention

Export data to SIRE
-------------------

* describe the process and tools
* describe the automated and manual checks to do
* mention specific point of attention

Backup the data
---------------

* Use PostgreSQL backups
* points of attention (PG versions…)

Restoring the data
------------------

* Use PostgreSQL backups
* points of attention

QWAT analysis tools
-------------------

* Where to find data analysis scripts
* How to use them
