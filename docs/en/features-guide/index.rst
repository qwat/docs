QWAT / TEKSI drinking water module
==================================

TEKSI drinking water module (project name: QWAT) is a selection of tools and a database implementation that allows you to:

* manage and map the data of your drinking water network with all its components such as pipes, valves, pumps, tanks, etc.
* indicate the characteristics of network objects in the form of attributes such as diameter, material, installation depth, leaks, date of installation, etc.
* produce plans and extract statistics from the database such as network value, total length of pipes, identification of future interventions, etc.
* export geodata in compliance with the requirements of Swiss standards


TEKSI drinking water module is a complete open source module based on a PostgreSQL - PostGIS data model almost compatible with the swiss norm SIA405. The data are accessed and edited with a dedicated QGIS project.
The project is maintained by the `TEKSI community <https://www.teksi.ch>`_.

Main features
-------------

Network objects
^^^^^^^^^^^^^^^^
The data model contains all the objects of a drinking water network and their attributes:

* Pipe
* Tank
* Valve
* Chamber
* Cover
* Treatment
* Pump
* Pressure control
* Source
* Meter
* Hydrant
* Subscriber
* Sampling point
* Leaks

The altitude of these objects is handled directly in their geometries which can be modified by the native QGIS tools.

The data model is almost compatible with the SIA405.
The model is comprehensive and provide all the common objects and attributes.
However, there is the possibility to customize attributes or objects and suggest modifications to the community.


Viewing and editing
^^^^^^^^^^^^^^^^^^^^
A preconfigured QGIS project is provided. The network objects are shown with a standard symbology. 

The editing can be done directly from QGIS, each object has a corresponding form that eases the edition of attributes.


`Edition documentation <https://qwat.github.io/docs/master/en/html/user-guide/create.html>`_

Printing
^^^^^^^^

Pre-configured layouts are provided in the QGIS project. The pipes geometries and labels are optimized to the layouts scale.

`Printing documentation <https://qwat.github.io/docs/master/en/html/user-guide/print.html>`_

Export
^^^^^^
A `Python library <https://github.com/QGEP/qgepqwat2ili>`_ is provided to export the network to SIA405 interlis.

Some extensions are developped for other standards:

* SIRE (Canton de Vaud)
* AquaFri (Canton de Fribourg)
* RAEPA - COVADIS (France)


History viewer
^^^^^^^^^^^^^^
The `plugin PG History Viewer <https://plugins.qgis.org/plugins/pg_history_viewer/>`_ can be configured for QWAT. 
This plugin tracks the changes applied to the data. Unwanted changes can be selected and reversed.

`History viewer documentation <https://qwat.github.io/docs/master/en/html/user-guide/history.html#>`_
