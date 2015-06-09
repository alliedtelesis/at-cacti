AT-CACTI
########

About
-----

Cacti_ is a complete network graphing solution designed to harness the power of RRDTool_'s data storage and graphing functionality. Cacti provides a fast poller, advanced graph templating, multiple data acquisition methods, and user management features out of the box. All of this is wrapped in an intuitive, easy to use interface that makes sense for LAN-sized installations up to complex networks with hundreds of devices.

AT-CACTI is a project which provides templates for adding support to Cacti for Allied Telesis devices.

.. _Cacti: http://www.cacti.net/

.. _RRDTool: http://oss.oetiker.ch/rrdtool/

Supported Devices
-----------------

- Alliedware plus based devices (x210, x510, x600 and etc)

   - CPU Usage

   - Free Memory and Buffers

   - Fan Speeds

   - Temperatures

- ATS based devices (8000S) - Under Developemnt

Install
-------

.. note::

    Tested on Cacti version 0.8.8b

- Enable SNMP on the device you want to monitor

- Copy Data Query XML file into Cacti snmp_queries directory. This directory is linux distribution dependent. For example on Centos 7::

    cp snmp_queries/*.xml /usr/share/cacti/resource/snmp_queries/

- Import host templates (located in templates directory) from Cacti Console>Import/Export>Import Templates.


License
-------

Apache 2.0

Sample Graphs
-------------

Overview on x210 switch

.. image:: https://github.com/alliedtelesis/at-cacti/blob/master/sample_graphs/x210%20overview.png

Fan speed with alarm threshold

.. image:: https://github.com/alliedtelesis/at-cacti/blob/master/sample_graphs/x600%20fan%20with%20threshold.png

Overview on x600 switch

.. image:: https://github.com/alliedtelesis/at-cacti/blob/master/sample_graphs/x600%20overview.png

Temperature ambient sensor of an x600 with alarm threshold

.. image:: https://github.com/alliedtelesis/at-cacti/blob/master/sample_graphs/x600%20temperature%20with%20threshold.png
