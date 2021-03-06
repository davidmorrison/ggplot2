PositionDodge <- proto(Position, {
  adjust <- function(., data, scales) {
    if (empty(data)) return(data.frame())
    check_required_aesthetics("x", names(data), "position_dodge")
    
    collide(data, .$width, .$my_name(), pos_dodge, check.width = FALSE)
  }  

  objname <- "dodge"
  desc <- "Adjust position by dodging overlaps to the side"
  icon <- function(.) {
    y <- c(0.5, 0.3)
    rectGrob(c(0.25, 0.75), y, width=0.4, height=y, gp=gpar(col="grey60", fill=c("#804070", "#668040")), vjust=1)
  }
  
  examples <- function(.) {
    ggplot(mtcars, aes(x=factor(cyl), fill=factor(vs))) +
      geom_bar(position="dodge")
    ggplot(diamonds, aes(x=price, fill=cut)) + geom_bar(position="dodge")
    # see ?geom_boxplot and ?geom_bar for more examples
    
    # Dodging things with different widths is tricky
    df <- data.frame(x=c("a","a","b","b"), y=1:4)
    (p <- qplot(x, y, data=df, position="dodge", geom="bar", stat="identity"))
    
    p + geom_linerange(aes(ymin = y-1, ymax = y+1), position="dodge")
    # You need to explicitly specify the width for dodging
    p + geom_linerange(aes(ymin = y-1, ymax = y+1), 
      position = position_dodge(width = 0.9))
      
    # Similarly with error bars:
    p + geom_errorbar(aes(ymin = y-1, ymax = y+1), width = 0.2,
      position="dodge")
    p + geom_errorbar(aes(ymin = y-1, ymax = y+1, width = 0.2),
      position = position_dodge(width = 0.90))
  }
})

