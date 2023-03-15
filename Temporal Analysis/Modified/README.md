<h1>Benchmark earthquake dataset</h1>

> This data set was collected as part of the WRC "Application of machine learning methods to the problem of earthquake prediction" (St. Petersburg State University, 2019).


<h2>What is this?</h2>

This repository contains earthquake data from 1968-2018. in various seismic zones:
* *Southern California, USA* (32-36.5°N, 114.75-121°W.)
* *Central Chile* (32.5-36°S, 70-72.5°W)
* *Hindukush, Pakistan* (35-39°N, 69-74.6°E)
* *Central Japan* (34-39°N, 136.5-142°E)
* *O. Sicily, Italy* (36-39°N, 12-16°E)

In addition, it also contains functions for calculating two sets of seismic indicators - parameters that can be used to build models of seismic activity in the region. At the moment, two sets of indicators have been implemented: the first was proposed in [1] (*Adeli & Panakkat*), the second - in [2] (*Reyes et al.*). Most likely, in the future the set will be replenished :)

___


<h2>Data Sources</h2>

Earthquake data for Southern California, Central Japan, Chile, and the Hindu Kush are from the [USGS] catalog (https://earthquake.usgs.gov/earthquakes/search/).

Data on about. Sicily, due to the incompleteness of the previous source for this region, are taken from the database of the [National Institute of Geophysics and Volcanology of Italy (INGV)] (http://cnt.rm.ingv.it/en) (important: it contains data only starting from 01/01/1985, however, even taking this into account, the USGS catalog is less complete than the INGV national database)

___


<h2>Description of data</h2>

| *Region* | Sicily, Italy | Central Japan | Central Chile | Hindu Kush, Pakistan | Southern California, USA |
| :--------------------: | :--------------------: | :--------------------: | :--------------------: | :--------------------: | :--------------------: |
| ***Geographic coordinates*** | 36-39°N, 12-16°E | 34-39°N, 136.5-142°E | 32.5-36°S, 70-72.5°W | 35-39°N, 69-74.6°E | 32-36.5° N, 114.75-121° W. |
|***Number of events in the directory*** | 7619 | 4604 | 7080 | 6611 | 14457|
| ***Minimal (cut-off) magnitude*** | 2.5 | 4.5 | 3.5 | 4.0 | 3.0 |
| ***Maximum magnitude*** | 5.8 | 7.9 | 8.0 | 7.5 | 7.3 |
| ***Average magnitude*** | 2.82 | 4.849 | 4.05 | 4.46 | 3.408 |
| ***Time span*** | 01/01/1985 - 12/31/2018 | 01/01/1968 – 12/31/2018 | 01/01/1968 – 12/31/2018 | 01/01/1968 – 12/31/2018 | 01/01/1968 – 12/31/2018 |
| ***Data source*** | INGV | USGS | USGS | USGS | USGS |

<h3>Graphs of magnitude distribution</h3>

![Sicily_dist](https://github.com/abrickman/benchmark-earthquake-dataset/blob/5b31ede79a50fde89d2a00939dd7d21921aab8ce/img/sicily.png)
![Japan_dist](https://github.com/abrickman/benchmark-earthquake-dataset/blob/5b31ede79a50fde89d2a00939dd7d21921aab8ce/img/japan.png)
![Chile_dist](https://github.com/abrickman/benchmark-earthquake-dataset/blob/5b31ede79a50fde89d2a00939dd7d21921aab8ce/img/chile.png)
![Hindukush_dist](https://github.com/abrickman/benchmark-earthquake-dataset/blob/5b31ede79a50fde89d2a00939dd7d21921aab8ce/img/hindukush.png)
![Cali_dist](https://github.com/abrickman/benchmark-earthquake-dataset/blob/5b31ede79a50fde89d2a00939dd7d21921aab8ce/img/cali.png)

___


<h2>Data structure</h2>
All data is in '.csv' format. The following are descriptions of the semantics of the table columns in each of the folders:


<h3>Raw data</h3>

> The "Raw data" folder contains raw data about earthquakes in the regions.

* **Data taken from the USGS catalog:**
A description of the full list of attributes can be found at: https://earthquake.usgs.gov/data/comcat/data-eventterms.php.
The descriptions of the main event attributes are listed below:

| *Attribute* | *Semantics* |
| :--------------------: | :--------------------: |
| **time** | Event occurrence time |
| **latitude** | Geographic latitude of the epicenter |
| **length** | Geographic longitude of the epicenter |
| **depth** | Depth of the hypocenter |
| **mag** | The value of the magnitude (the value characterizes the "strength" or "power" of the earthquake) |
| **magType** | Type (scale) used to calculate magnitude |
| **id** | Unique event identifier |
| **place** | Line characterizing the remoteness of the epicenter location from populated areas |


* **Data taken from the INGV database:**

| *Attribute* | *Semantics* |
| :--------------------: | :--------------------: |
| **eventID** | Unique event identifier |
| **time** | Event occurrence time |
| **latitude** | Geographic latitude of the epicenter |
| **length** | Geographic longitude of the epicenter |
| **depth** | Depth of the hypocenter |
| **author** | Event data source name |
| **magType** | Type (scale) used to calculate magnitude |
| **mag** | The value of the magnitude (the value characterizes the "strength" or "power" of the earthquake) |
| **eventLocationName** | Line characterizing the remoteness of the epicenter location from populated areas |


<h3>Adeli and Panakkat seismicity indicators</h3>

> Folder "Adeli and Panakkat seismicit