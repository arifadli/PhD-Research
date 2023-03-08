# Time Series Analysis
1. File: **EQ Pred - CatBoost Regressor.ipynb**
   Pada bagian ini dilakukan prediksi gempa berdasarkan pada data tabular (metadata) yang diperoleh dari website United States Geological Survey (USGS).
   Metadata ini memuat beberapa hal diantaranya yaitu time, latitude, longitude, depth, mag, magType.
   magnitude gempa dibuat kelas menjadi : 'Disastrous', 'Major', 'Strong', 'Moderate'
   Model prediksi dibangun menggunakan: **CatBoostRegressor**
   Basic Model: Menghasilkan Akurasi <br> 
   - Akurasi Model: 0.83 <br>
   - Nilai Mean Absolute Error: 0.34 <br>
   - Nilai Root Mean Squared Error: 0.47 <br>  