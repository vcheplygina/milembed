library(ggplot2)
library(R.matlab)
library(RColorBrewer)

dataD <- read.csv("dataD.csv", header=FALSE)
dataNames <- read.csv("dataNames.csv", sep=";")

allD <- readMat("allD_dxdwith155.mat")
u<-allD$u
D<-allD$Droc
perf<-apply(allD$perf, c(1,2), mean)

infoD <- read.csv("dataDetails.csv", header=FALSE, sep=",")


n<-list()
clasfNames <- list()

for (i in 1:length(dataNames$names)){
  
  
  n[[ as.character(dataNames$names[i]) ]]<-i
  
  
  
}

for (i in 1:length(u)) {
  u1 <- u[i]
  clasfNames[unlist(u1[1])] <- i
}



