
library(plotly)

plot_ly(EV_below_2, x = EV_below_2$Time, y = EV_below_2$ID, z = EV_below_2$FF, type = 'scatter3d', mode = 'lines', color = EV_below_2$ID) %>%
  layout(
    scene = list(
      xaxis = list(title = "Time (in min)"),
      yaxis = list(title = ""),
      zaxis = list(title = "Mean form factor", range = c(1,7))
    )
  ) %>%
  style(line = list(width= 10))
