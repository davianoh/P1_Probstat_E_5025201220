#Nomor 1a
n <- 3
p <- 0.20
dgeom(x = 3, prob = 0.2)
#1b
mean(rgeom(n = 10000, prob = 0.3) == 3)
#1c
#Hasil dari perhitungan a dan b tidak terlalu jauh, bedanya kalau a itu nilainya tetap
#sedangkan kalau b itu hasilnya random, besar kecil nilainya ditentukan oleh X

#1d
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

#1e
miu <- 1/0.2
print(paste("Rataan :", miu))
varian <- (1-p)/ p^2
print(paste("varian adalah:", varian))



#2a
dbinom(4, 20, 0.2)

#2b
peluang <- dbinom(1:20, 20, 0.2)
data = data.frame(y=c(peluang), x=c(1:20))
barplot(data$y, names.arg=data$x, ylab="Peluang", xlab="Jumlah pasien sembuh")

#Nomor 2c
rataan=20*0.2
varian=20*0.2*0.8
cat("2C. Rataan :", rataan,"dan varian :", varian,"\n")


#3a
dpois(6, 4.5)

#3b
peluang = dpois(6,4.5)
data = data.frame(y=c(peluang), x=c(1:365))
barplot(data$y, names.arg=data$x, ylab="peluang", xlab="hari ke-", ylim=0:1)

#3c
# Dari Perhitungan yang diperoleh, didapatkan bahwa nilai distribusi poisson tidak berubah dari hari pertama hingga hari terakhir.

#3d
lambda <- 4.5
varian <- 4.5
print(paste("lambda : ", lambda, "dan varian : ", varian))


x = 2
v = 10
#4a
dchisq(x, v)

#4b
output = rchisq(100, v)
hist(output)

#4c
rataan <- v
varian <- 2 * v
print(paste("rataan : ", rataan, "dan varian : ", varian))



#5a
lambda = 3
dexp(lambda)

#5b
set.seed(1)
hist(rexp(10))

set.seed(1)
hist(rexp(100))

set.seed(1)
hist(rexp(1000))

set.seed(1)
hist(rexp(10000))

#5c
rataan = lambda
varian = lambda*lambda
print(paste("rataan:", rataan, "dan varian:", varian))


# 6a
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


#6b
nums=rnorm(100,50,8)
hist(nums,breaks=50,main="5025201220_Davian Benito_Probstat_E_DNHistogram")

#6c
varian = 8*8
print(paste("varian adalah", varian))
