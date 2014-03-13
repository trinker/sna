weights_1 <- c(.01, .01, .01, .01, .01, .05, .05, .05, .05, .25, .25, .25)
weights_2 <- rep(1/11, 12)

selects <- function(p, n = 12) {
    melt(data.frame(from = LETTERS[1:n],
            do.call(rbind, lapply(1:n, function(i) {
                sample(LETTERS[1:n][-i], 3, FALSE, prob = p[-i])
            }))), 
        id="from", value.name="to", 
        variable.name = "choice.n"
    )[, c(1, 3, 2)]
}

set.seed(100)
time_1 <- selects(weights_1)
t1 <- graph.data.frame(time_1)

set.seed(100)
time_2 <- selects(weights_2)
t2 <- graph.data.frame(time_2)

E(t1)$arrow.size <- .5
E(t2)$arrow.size <- .5






