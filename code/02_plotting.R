
E(t1)$arrow.size <- .5
E(t2)$arrow.size <- .5


pdf("plots/auto_layout_T1vsT2.pdf", width=9, height=5)
    par(mar=c(0,0,1,0))
    par(mfrow=c(1,2))
    plot(t1); mtext("Time 1")
    plot(t2); mtext("Time 2")
dev.off()



pdf("plots/circle_layout_T1vsT2.pdf", width=9, height=5)
    par(mar=c(0,0,1,0))
    par(mfrow=c(1,2))
    plot(t1, layout=layout.circle); mtext("Time 1")
    plot(t2, layout=layout.circle); mtext("Time 2")
dev.off()


tkplot(t1, layout=layout.sphere)
tkplot(t2, layout=layout.sphere)

pdf("plots/sociomatrix.pdf", width=9, height=5)
    par(mar=c(0,0,1,0))
    par(mfrow=c(1,2))
    plot.sociomatrix(dats[[3]]); mtext("Time 1")
    plot.sociomatrix(dats[[4]]); mtext("Time 2")
dev.off()

library(gplots)

par(mar=c(0,0,0,0))

merge_pdf(2, file = "plots/heatmap.pdf", widths = c(5,5 ), heights = c(5, 5))
heatmap(dats[[3]], main = "Time 1")
heatmap(dats[[4]], main = "Time 2")



library(GGally);library(network); library(gridExtra)
x <- ggnet(network(dats[[3]]), label = TRUE, alpha = 1, 
	color = "white", segment.color = "grey10") + ggtitle("Time 1")+ 
	theme(panel.border=element_rect(colour="grey80", fill=NA))
y <- ggnet(network(dats[[4]]), label = TRUE, alpha = 1, 
	color = "white", segment.color = "grey10") + ggtitle("Time 2") + 
	theme(panel.border=element_rect(colour="grey80", fill=NA))

pdf("plots/ggplot_networks.pdf", width=9, height=5)
grid.arrange(x, y, ncol=2)
dev.off()




