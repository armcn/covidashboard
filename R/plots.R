plot_daily_province_data <- function(
  .tbl,
  .col_y,
  .title_y = "",
  .dark_mode
) {
  
  if (isTRUE(.dark_mode)) {
    
    background_color <- "#343a40" 
    text_color <- "#ffffff"
    
  } else {
    
    background_color <- "#ffffff"
    text_color <- "#000000"
    
  }
  
  .tbl |> 
    plotly::plot_ly() |> 
    plotly::add_trace(
      type = "scatter",
      mode = "lines",
      x = ~date,
      y = col_formula(.col_y),
      color = ~province,
      hoverinfo = "text",
      hovertext = paste0(
        .title_y, 
        ": ", 
        map_chr(
          .tbl[[.col_y]], 
          format_number
        ),
        "<br>", 
        .tbl[["province"]],
        "<br>", 
        map_chr(
          .tbl[["date"]], 
          format_date
        )
      )
    ) |> 
    plotly::layout(
      xaxis = list(
        title = "Date",
        showgrid = FALSE,
        zeroline = FALSE,
        color = text_color
      ),
      yaxis = list(
        title = .title_y,
        showgrid = FALSE,
        zeroline = FALSE,
        color = text_color
      ),
      legend = list(
        font = list(
          color = text_color
        ),
        itemclick = "toggleothers",
        orientation = "h",
        y = -0.25
      ),
      paper_bgcolor = background_color,
      plot_bgcolor = background_color
    )
  
}