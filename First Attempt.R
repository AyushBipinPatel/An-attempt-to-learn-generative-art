## Attempting to learn generative art

  library(tidyverse)
  library(gganimate)
  
  tibble(
    rads = c(0:3600)*(pi/180),
    rads2 = c(3600:0)*(pi/180),
    sinof = sin(rads),
    cosof = cos(rads),
    tanof = tan(rads)
  ) %>% 
    ggplot()+
    coord_polar()+
    theme(
      panel.background = element_blank(),
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank()
    ) +
    geom_line(aes(rads,sinof),
              colour = "#2bc846", 
              size = 1)+
    transition_reveal(along = rads)+
    geom_line(aes(rads2,cosof),
              colour = "#ff010d", 
              size = 1)+
    transition_reveal(along = rads2) -> animated_chart



anim_save(animation = animated_chart,
          filename = "first_genrative_aRt.gif")
