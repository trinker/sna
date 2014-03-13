
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

pdf("plots/heatmap.pdf", width=12, height=5)
    par(mar=c(0,0,1,0))
    par(mfrow=c(1,2))
    heatmap(dats[[3]]); mtext("Time 1")
    heatmap(dats[[4]]); mtext("Time 2")
dev.off()



