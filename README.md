# P1_Probstat_E_5025201220

Nama : Davian Benito
Nrp : 5025201220

## Soal 1
Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan
seseorang yang menghadiri acara vaksinasi sebelumnya
### a
Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi
sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?
(distribusi Geometrik)
``` R
dgeom(x = 3, prob = 0.2)
```
>Menggunakan fungsi bawaan dari R untuk menghitung value of the geometric probability density

### b
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi
geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
``` R
mean(rgeom(n = 10000, prob = 0.3) == 3)
```
>Menggunakan fungsi bawaan dari R untuk mendapatkan vector of geometric distributed random variables yang kemudian kita mean kan

### c
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
> Hasil dari kedua output akan bernilai mirip karena probabilitasnya sama yaitu 0.2

### d
Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
``` R
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = 0.2)) %>%
  mutate(Failures = ifelse(x == 3, 3, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.5),
    size = 2,
    vjust = 0
  ) +
  labs(title = "Histogram Distribusi Geometrik,Peluang X = 3 gagal Sebelum Sukses Pertama",
       subtitle = "Geometric(.2)",
       x = "Kegagalan sebelum sukses yang pertama (x)",
       y = "Peluang") 
```
-gambar

### e
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik
``` R
miu <- 1/0.2
print(paste("Rataan :", miu))
varian <- (1-p)/ p^2
print(paste("varian adalah:", varian))
```
>Kita dapat menghitung nilai miu dan varian dengan data yang didapatkan

## Soal 2
Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
### a
Peluang terdapat 4 pasien yang sembuh.
``` R
dbinom(4, 20, 0.2)
```
>Menggunakan fungsi bawaan dari R untuk mencari density

### b
Gambarkan grafik histogram berdasarkan kasus tersebut.
``` R
peluang <- dbinom(1:20, 20, 0.2)
data = data.frame(y=c(peluang), x=c(1:20))
barplot(data$y, names.arg=data$x, ylab="Peluang", xlab="Jumlah pasien sembuh")
```
-gambar
1. Pertama kita cari dahulu peluang dari setiap kejadian x pasien sembuh\n
2. Lalu kita masukkan ke data frame untuk x adalah jumlah pasien sembuh dan y adalah peluangnya\n
3. Terakhir kita plotkan ke dalam histogram memakai barplot

### c
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
``` R
rataan=20*0.2
varian=20*0.2*0.8
cat("2C. Rataan :", rataan,"dan varian :", varian,"\n")
```
>Rataan adalah jumlah pasien * peluang sukses, sedangkan varian adalah jumlah pasien * peluang sukses * peluang gagal

## Soal 3
Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis
4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
### a
Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
``` R
dpois(6, 4.5)
```
>Kita dapat gunakan fungsi bawaaan R dpois untuk probability mass

### b
simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama
setahun (n = 365)
``` R
peluang = dpois(6,4.5)
data = data.frame(y=c(peluang), x=c(1:365))
barplot(data$y, names.arg=data$x, ylab="peluang", xlab="hari ke-", ylim=0:1)
```
-gambar
1. Pertama kita cari peluang untuk kejadian 6 bayi lahir
2. Lalu kita masukkan ke data frame, x untuk n hari dan y untuk peluangnya
3. Terakhir kita plotkan data tersebut ke histogram

### c
dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
>Nilai distribusi poison hanya dipengaruhi oleh nilai x dan meannya sehingga nilai peluangnya dalam 1 tahun akan bernilai sama terus

### d
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
``` R
mean <- 4.5
varian <- 4.5
print(paste("mean : ", mean, "dan varian : ", varian))
```
>kita mendapatkan nilai mean dan varian sama

## Soal 4
Diketahui nilai x = 2 dan v = 10. Tentukan:
### a
Fungsi Probabilitas dari Distribusi Chi-Square
``` R
dchisq(x, v)
```
>Dapat menggunakan fungsi bawaan r untuk mengcari chi square density for a vector of elements

### b
Histogram dari Distribusi Chi-Square dengan 100 data random
``` R
output = rchisq(100, v)
hist(output)
```
>kita masukkan output ke dalam fungsi histogram

### c
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square
``` R
rataan <- v
varian <- 2 * v
print(paste("rataan : ", rataan, "dan varian : ", varian))
```
>Memakai rataan yaitu v dan varian yaitu 2 * v

## Soal 5
### a
Fungsi Probabilitas dari Distribusi Exponensial
``` R
lambda = 3
dexp(lambda)
```
>kita dapat memakai fungsi bawaan R untuk probability density for value x

### b
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
``` R
set.seed(1)
hist(rexp(10))

set.seed(1)
hist(rexp(100))

set.seed(1)
hist(rexp(1000))

set.seed(1)
hist(rexp(10000))
```
>kita set kan seed(1), lalu kita masukkan ke fungsi histogram dengan nilai yang diminta

### c
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
``` R
rataan = lambda
varian = lambda*lambda
print(paste("rataan:", rataan, "dan varian:", varian))
```
>rataan merupakan lambda dengan varian yaitu rataan * rataan

## Soal 6
Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
### a
Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot
data generate randomnya dalam bentuk grafik.
``` R
n <- 100
mean <- 50
sd <- 8
#set.seed(1)
nums<-rnorm(n,mean,sd)
X1=-2147483647
X2=2147483647
z_scores <- (nums-mean(nums))/sd(nums)
rata_rata=mean(nums)
for(i in 1:n){
  #Cari nilai X1 & X2
  if(nums[i]>X1 && nums[i]<rata_rata)X1=nums[i]
  if(nums[i]<X2 && nums[i]>rata_rata)X2=nums[i]
}
P_ans=pnorm(X2,mean(nums),sd(nums),lower.tail=TRUE)-pnorm(X1,mean(nums),sd(nums),lower.tail=TRUE)
cat("Peluang dari",X1,"< x <",X2,"adalah:",P_ans)
plot(nums,z_scores,ylab="Z-score",xlab="Data Nilai")
```
>sesuai petunjuk, kita dapat menggunakan fungsi plot untuk memplotkan data ke dalam grafik

### b
Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
``` R
nums=rnorm(100,50,8)
hist(nums,breaks=50,main="5025201220_Davian Benito_Probstat_E_DNHistogram")
```
>kita dapat menggunakan rnorm untuk mendapatkan distribusi peluang lalu kita masukkan ke fungsi histogram

### c
Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal
``` R
varian = 8*8
print(paste("varian adalah", varian))
```
>varian didapatkan dari perkalian sd * sd
