#install packages
install.packages("RandomFields")
install.packages("geostatsp")



#library
library('geostatsp')
library('Matrix')
library('raster')

#set wd (please change the path to exactly where the downloaded files are stored)
getwd()
setwd("D:/Dropbox/jinshi_backup/Final publication file/3 replication package/similuation_variables_for_table_a1/simu_tif3")

#simulation loop: 500 times
for (time in c (1:500)){
  model<-c(var=1.2223,range=3,shape=1)
  myraster=raster(nrows=40,ncols=64,xmn=72,ymn=15,xmx=136,ymx=55,crs="+init=epsg:4326")
  set.seed(time)
  simu<-RFsimulate(model,x=myraster,n=1)
  plot(simu)
  simufiles<-paste0("simu_",time,".tif")
  writeRaster(simu, simufiles, overwrite=TRUE)
}




#set wd
getwd()
setwd("D:/Dropbox/jinshi_backup/Final publication file/3 replication package/similuation_variables_for_table_a1/simu_tif4")

#simulation loop: 500 times
for (time in c (1:500)){
  model<-c(var=1.2223,range=4,shape=1)
  myraster=raster(nrows=40,ncols=64,xmn=72,ymn=15,xmx=136,ymx=55,crs="+init=epsg:4326")
  set.seed(time)
  simu<-RFsimulate(model,x=myraster,n=1)
  plot(simu)
  simufiles<-paste0("simu_",time,".tif")
  writeRaster(simu, simufiles, overwrite=TRUE)
}



#set wd
getwd()
setwd("D:/Dropbox/jinshi_backup/Final publication file/3 replication package/similuation_variables_for_table_a1/simu_tif5")

#simulation loop: 500 times
for (time in c (1:500)){
  model<-c(var=1.2223,range=5,shape=1)
  myraster=raster(nrows=40,ncols=64,xmn=72,ymn=15,xmx=136,ymx=55,crs="+init=epsg:4326")
  set.seed(time)
  simu<-RFsimulate(model,x=myraster,n=1)
  plot(simu)
  simufiles<-paste0("simu_",time,".tif")
  writeRaster(simu, simufiles, overwrite=TRUE)
}







