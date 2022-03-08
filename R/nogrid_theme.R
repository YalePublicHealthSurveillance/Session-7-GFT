nogrid_theme <- function(){ theme(
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.background = element_blank(),
  axis.line = element_line(colour = "black"),
  legend.position = "none",
  axis.text.x = element_blank(),
  axis.text.y = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  axis.ticks = element_blank(),
  axis.line.x = element_blank(),
  axis.line.y = element_blank(),
  plot.title = element_text(size = 24),
  strip.background = element_rect(color = "white")
) 
}
