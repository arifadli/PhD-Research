# Perhitungan Indikator Temporal Seismik

Dalam bagian ini, dilakukan perhitungan indikator seismik berbasis temporal yang mengacu pada penelitian
[1] A. Panakkat, and H. Adeli, “Neural network models for earthquake magnitude prediction using multiple seismicity indicators,” International Journal of Neural Systems, vol. 17(1), pp. 13–33, 2007.
[2] F. Martínez-Álvarez, A. Morales-Esteban, and J. Reyes, “Neural networks to predict earthquakes in Chile,” Applied Soft Computing, vol. 13, pp. 1314-1328, 2013.

**a-b_value seismic indicator.ipynb**
1. Menghitung nilai b-Value (Parameter tektonik)
2. Menghitung nilai a-Value (parameter seismitas)

**Hukum Gutenberg–Richter.ipynb**
Plot grafik persamaan GR dari kejadian gempa

**plot a-b_map.ipynb**
Wilayah dengan nilai-b yang rendah berkorelasi dengan akumulasi stress yang tinggi, sedangkan nilai-b yang tinggi berlaku sebaliknya. Maka jika pada wilayah yang memiliki nilai-b rendah dapat di identifikasikan bahwa wilayah tersebut menyimpan stress tinggi yang sewaktu-waktu dapat dilepaskan dalam bentuk gelombang seismik berukuran besar
Selain itu nilai-b yang rendah berkorelasi dengan tingkat kerapuhan batuan yang tinggi, hal ini menyebabkan wilayah tersebut memiliki nilai-a yang rendah. Karena wilayah yang berada pada zona aktif gempa
namun memiliki nilai-a yang rendah menunjukkan bahwa di wilayah tersebut terjadi peningkatan akumulasi energi berupa stress.

Folder **Adeli, Panakkat dan Reyyes**
Berisi prediksi gempa bumi menggunakan Machine Learning berdasarkan indikator: Adeli, Panakkat dan Reyyes

Folder **Khawaja M. Asim et al**
Berisi Seismicity analysis and machine learning models for short-term low magnitude seismic activity predictions in Cyprus

Folder **Modified**
Berisi Modifikasi dari beberapa model yang digunakan pada penelitian prediksi gempa berbasis fitur temporal