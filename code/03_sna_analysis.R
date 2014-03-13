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
lapply(dats[3:4], bonpow)

g <- array(dim=c(2,12,12))
g[1,,] <- dats[[3]]
g[2,,] <- dats[[4]]

out <- qaptest(g, gcor, g1=1, g2=2)
out 
summary(out)

lapply(dats[3:4], structure.statistics)
sapply(list(Time_1=t1, Time_2=t2) , function(x) modularity(walktrap.community(x)))
(mods <- lapply(list(Time_1=t1, Time_2=t2), mod.matrix, 1:12))
qheat(mods[[1]], diag.na=TRUE, diag.value="", by.column=NULL, values = TRUE)
qheat(mods[[2]], diag.na=TRUE, diag.value="", by.column=NULL, values = TRUE)

graph.isomorphic(t1, t2)

plot(str(simplify(t1)))

gc <- graph.compose(t1, t2)
plot(str(gc))
plot(str(simplify(gc)))
plot(graph.difference(t1, t2, byname = "auto"))
plot(graph.difference(t2, t1, byname = "auto"))
plot(graph.intersection(t2, t1))
graph.intersection 


E(t1)$weight <- 1
E(t2)$weight <- 1
graph.diversity(t1)



clique.census(zero_diag(dats[[3]]))
clique.census(zero_diag(dats[[4]]))


diag(dats[[3]])  ## degree distribution
diag(dats[[4]])
plot(t1)

table(diag(dats[[3]]))/length(diag(dats[[3]]) )
table(diag(dats[[4]]))/length(diag(dats[[4]]) )

hist_dat <- data.frame(Time_1 = diag(dats[[3]]), Time_2 = diag(dats[[4]]))
hist_dat2 <- melt(hist_dat, value.name="Count", variable.name="Time")

ggplot(hist_dat2, aes(fill=Time, group=Time, x=factor(Count))) + 
	geom_histogram() + facet_grid(Time~.)

plotdat <- list(Time1 = data.frame(table(diag(dats[[3]]))/length(diag(dats[[3]]))),
Time2 = data.frame(table(diag(dats[[4]]))/length(diag(dats[[4]]))))

plotdat3 <- list(Time1 = data.frame(table(diag(dats[[3]]))),
Time2 = data.frame(table(diag(dats[[4]]))))

ggplot(list_df2df(plotdat, "Time"), aes(x=factor(Var1))) + 
	geom_histogram(aes(weight=Freq), width=1) + facet_grid(Time~.)


plotdat2 <- tbl_df(list_df2df(plotdat, "Time")) %.% 
	group_by(Time) %.% mutate(P_k = rev(cumsum(rev(Freq))))

plotdat2[, "Count"] <- list_df2df(plotdat3, "Time")[, 3]


ggplot(plotdat2, aes(x=P_k, colour=Time)) + 
	geom_step(aes(y=rev(..y..)),stat="ecdf", size=2, alpha=.4) + 
	guides(colour = guide_legend(override.aes = list(alpha = 1))) + 
    scale_x_continuous(breaks=seq(0, 1, by=.1))
	

plotdat4 <- plotdat2 %.% arrange(Time, -P_k) %.% 
	mutate(Rank=unlist(tapply(Time, Time, function(x) 1:length(x))),
		zipf = Rank/Count, 
		R_N = unlist(tapply(Rank, Time, function(x) x/length(x))))


ggplot(plotdat4, aes(x=R_N, y = Var1)) + 
	geom_line(aes(group=Time), alpha=.1) +
	geom_point(aes(shape=Time, colour=Time), size=4, alpha=.4) +
	geom_point(size=.7, colour="black", alpha=1, shape=19) 


plotdat4$Var1 <- factor(plotdat4$Var1, level=sort(levels(plotdat4$Var1)))

ggplot(plotdat4, aes(x = Var1)) + 
    geom_bar(aes(weight=R_N), width=1) +
	facet_grid(.~Time)











