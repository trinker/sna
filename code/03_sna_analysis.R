sapply(dats[3:4], centralization, degree, cmode="indegree")
lapply(dats[3:4], component.dist, connected="weak")
sapply(dats[3:4], connectedness)
lapply(dats[3:4], degree, cmode="indegree")
sapply(dats[3:4], efficiency)
gcor(dats[[3]], dats[[4]])
sapply(dats[3:4], gden) ## will be identical

lapply(dats[3:4], is.isolate, ego=1:12) #isolates
sapply(dats[3:4], mutuality)
netcancor(dats[[3]], dats[[4]])
lapply(dats[3:4], prestige)

g <- array(dim=c(2,12,12))
g[1,,] <- dats[[3]]
g[2,,] <- dats[[4]]

out <- qaptest(g, gcor, g1=1, g2=2)
out 
summary(out)

lapply(dats[3:4], structure.statistics)

plot.sociomatrix(dats[[3]])
plot.sociomatrix(dats[[4]])

clique.census(dats[[3]])
#clique.census(dats[[4]])


