# About Project : Fare and Duration Prediction for NYC Yellow Cabs

- This Project is for course IST 718: Big Data Analytics @ Syracuse University
- Professor: Daniel Acuna <deacuna@syr.edu>

# Members: 
- Apurva Sharma 
- Shama Kamat
- Shivanshi Bajpai
- Sanaman Yadav

- (all members contributed in the concept, end-to-end project code, bug free code implementation and documentation)

## Requirements:
- Python 3.7.0.
- Pandas
- Numpy
- Pyspark 2.4.0
- Spark 2.4.0
- xgboost 
- sklearn
- matplotlib.pyplot
- seaborn
- RandomForestRegressor
- GBTRegressor
- RegressionEvaluator
- VectorAssembler
- ascii_letters
- datetime
- StandardScaler
- MinMaxScaler
- Vector

## Installation: 
pip install pyspark

Project Code : In addition to the requirements, we need to Change these lines to read files locally :

```py
fulldata = pd.read_csv("/Users/.../IST718 Dropbox/IST 718 Project/Taxi Data/2015-01_100k.csv")
weatherdata = pd.read_excel("/Users/.../IST718 Dropbox/IST 718 Project/Weather Data/2015_weather.xlsx")
holidaysdata = pd.read_excel("/Users/.../IST718 Dropbox/IST 718 Project/Holiday Data/holidays.xlsx")
```

into these lines :

```py
fulldata = pd.read_csv(os.environ.get("TAXI_DATA"))
weatherdata = pd.read_excel(os.environ.get("WEATHER_DATA"))
holidaysdata = pd.read_excel(os.environ.get("HOLIDAY_DATA"))

### Setup the environment variables for Data Path

Append these lines into this file `~/.bash_profile` 
CAUTION: Do not overwrite bash profile, just add these lines to it !

The contents of this file should look like this :

```bash
export TAXI_DATA="/Users//IST718 Dropbox/IST 718 Project/Taxi Data/2015-01_100k.csv"
export WEATHER_DATA="/Users//IST718 Dropbox/IST 718 Project/Weather Data/2015_weather.xlsx"
export HOLIDAY_DATA="/Users//IST718 Dropbox/IST 718 Project/Holiday Data/holidays.xlsx"
```

### How to launch the anaconda navigator

From a new command line terminal, run anaconda-navigator everytime.

```console
$ anaconda-navigator
```

### Instructions for Github

Please push changes ONLY to your respective notebooks to avoid github conflicts in ipynb files
- For final code, please refer only to IST 718_Apurva_Spark_Final_Submit.ipynb

### How to compare two notebooks

install xcode-select like this:

```console
$ xcode-select --install
```

and then, install [nbdiff](https://github.com/jupyter/nbdime#installation) 

and then, run like following from command line :


```diff
Apurvas-MacBook-Pro:ProjectCode apsharma$ nbdiff IST\ 718_Apurva.ipynb IST\ 718_Shivanshi.ipynb 
nbdiff IST 718_Apurva.ipynb IST 718_Shivanshi.ipynb

--- IST 718_Apurva.ipynb  2018-10-28 10:16:25.199350
+++ IST 718_Shivanshi.ipynb  2018-10-28 10:21:35.103231
## deleted /cells/2:
-  code cell:
-    execution_count: 7
-    metadata (known keys):
-      collapsed: True
-    source:
-      #import pandas as pd
-      #fulldata=pd.read_csv("C:/Users/SHIVANSHI/IST718 Dropbox/IST 718 Project/Taxi Data/2015-01_100k.csv")
-      #weatherdata = pd.read_excel("C:/Users/SHIVANSHI/IST718 Dropbox/IST 718 Project/Weather Data/2015_weather.xlsx")
-      #holidaysdata = pd.read_excel("C:/Users/SHIVANSHI/IST718 Dropbox/IST 718 Project/Holiday Data/holidays.xlsx")

## modified /cells/3/source:
@@ -1,4 +1,4 @@
 #import pandas as pd
-#fulldata=pd.read_csv("C:/Users/SHAMA/IST718 Dropbox/IST 718 Project/Taxi Data/2015-01_100k.csv")
-#weatherdata = pd.read_excel("C:/Users/SHAMA/IST718 Dropbox/IST 718 Project/Weather Data/2015_weather.xlsx")
-#holidaysdata = pd.read_excel("C:/Users/SHAMA/IST718 Dropbox/IST 718 Project/Holiday Data/holidays.xlsx")
+#fulldata=pd.read_csv("C:/Users//IST718 Dropbox/IST 718 Project/Taxi Data/2015-01_100k.csv")
+#weatherdata = pd.read_excel("C:/Users//IST718 Dropbox/IST 718 Project/Weather Data/2015_weather.xlsx")
+#holidaysdata = pd.read_excel("C:/Users//IST718 Dropbox/IST 718 Project/Holiday Data/holidays.xlsx")
```

and to view these changes in browser instead , run like following :
```
$ nbdiff-web IST\ 718_Apurva.ipynb IST\ 718_Shivanshi.ipynb 
```

For more on nbdiff and merging conflicts in ipython notebooks, refer:  [nbdiff documentation](https://nbdime.readthedocs.io/en/latest/cli.html)

All other installation procedures are mentioned in project code as and when required.
