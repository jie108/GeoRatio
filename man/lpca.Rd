% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lpca.R
\name{lpca}
\alias{lpca}
\title{Perform local PCA on each cluster of the data}
\usage{
lpca(indicator, X, d)
}
\arguments{
\item{X}{Data.}

\item{d}{intrinsic dimension}

\item{indicatr}{cluster membership or number of clusters for pam() clustering
if a single positive interger is provided}
}
\value{
a list of representation of data (X.rep), mean normalized reconstruction error (mean_error),
normalized reconstruction error for all data (all_error), cluster membership (cluster_id),
mean normalized reconstruction error in each cluster (each_error), cluster size (cluster_size),
variance explained by each PC in each cluster (variance_proportion),
d/number of PCs needed to explaine more than d of the variance in each cluster (num_ev).
}
\description{
Takes in indicator of cluter membership, data, and intrinsic dimension
}
\examples{

############################## example I: Open box
## package for 3d plot
library(rgl)
## package for pam() kmeans clustering
library(cluster)

## load data
data(OpenBox)

## intrinsic dimension of the data
trueDim = 2

## number of clusters
K = 6

indi = pam(OpenBox,K)$clustering

temp = lpca(indi,OpenBox,trueDim)
OpenBox_rep = temp[[1]]
error_rep = temp[[2]]

open3d()
plot3d(OpenBox,col=indi,xlim=c(0,2),ylim=c(0,2),zlim=c(0,2))
open3d()
plot3d(OpenBox_rep,col=indi,xlim=c(0,2),ylim=c(0,2),zlim=c(0,2))



############################## example II: Swiss roll
## package for 3d plot
library(rgl)
## package for pam() kmeans clustering
library(cluster)

## load data
data(SwissRoll)

## intrinsic dimension of the data
trueDim = 2

## number of clusters
K = 8

indi = pam(SwissRoll,K)$clustering

temp = lpca(indi,SwissRoll,trueDim)
SwissRoll_rep = temp[[1]]
error_rep = temp[[2]]

open3d()
plot3d(SwissRoll,col=indi,xlim=c(0,2),ylim=c(0,2),zlim=c(0,2))
open3d()
plot3d(SwissRoll_rep,col=indi,xlim=c(0,2),ylim=c(0,2),zlim=c(0,2))


############################## example III: M-shape
## package for pam() kmeans clustering
library(cluster)

## load data
data(M_shape)

## intrinsic dimension of the data
trueDim = 1

## number of clusters
K = 4

indi = pam(M_shape,K)$clustering

temp = lpca(indi,M_shape,trueDim)
M_shape_rep = temp[[1]]
error_rep = temp[[2]]

indi_true = rep(1:4,each=nrow(M_shape)/4)
temp_true = lpca(indi_true,M_shape,trueDim)
M_shape_rep_true = temp_true[[1]]

par(mfrow=c(1,3))
plot(M_shape,col=indi)
plot(M_shape_rep,col=indi)
plot(M_shape_rep_true,col=indi_true)
}

