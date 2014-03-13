## Extra functions here
handy_assign <- function(x){
	mapply(function(x, y) saveRDS(object=x, 
        file = sprintf("data/%s.rds", y)), x, names(x))
}



