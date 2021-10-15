library(tidyverse)

sim_data <- function(b){
  tibble(
    x = c(0:1000),
    y = ifelse(x == 0,0,
               ifelse(x == 1, 1,
                      lag(x,1) + lag(x,2))),
    z = y - rnorm(n = 1,mean = 500,sd = 500),
    a = y + rnorm(n = 1,mean = 500,sd = 500),
    state = b
  ) 
}

map_dfr(c(1:100),sim_data) -> gen_data


gen_data %>% 
  ggplot(aes(x,y))+
  geom_line(colour = "#FFC740",
            alpha = 0.8,
            size = 2)+
  geom_line(aes(x,z),
            colour = "#FF010D",
            alpha = 0.8,
            size = 2)+
  geom_line(aes(x,a),
            colour = "#2BC846",
            alpha = 0.8,
            size = 2)+
  coord_polar()+
  theme(
    panel.background = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank()
  ) -> dist_fib2

ggsave(dist_fib2,filename = "Distorted Fibonacci 2.jpeg",device = "jpeg")
