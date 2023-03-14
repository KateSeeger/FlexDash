
reactable::reactable(df_parkrich, 
                     defaultColDef = colDef(html = TRUE,
                                            vAlign = "center",
                                            headerVAlign = "bottom", 
                                            align = "left", 
                                            class = "cell",
                                            headerClass = "header", 
                                            headerStyle = list(fontWeight = 500)),
                     columns = list(
                       `Park_Code` = colDef(name= "Park Code",  filterable = TRUE)),
                     pagination = FALSE,
                     highlight = TRUE, 
                     fullWidth = TRUE,
                     details = function(index) {
                       sub_plotrich <- 
                         df_plotrich[df_plotrich$Park_Code == df_parkrich$Park_Code[index], ]
                       htmltools::div(
                         style = "padding: 20px",
                         reactable(sub_plotrich,  
                                   # defaultColDef = colDef(vAlign = "center",
                                   #                        headerVAlign = "bottom",
                                   #                        align = "left"
                                   # ,
                                   # class = "cell",
                                   # headerClass = "header", 
                                   # headerStyle = list(fontWeight = 500)
                                   #),
                                   columns = list(
                                     `Plot_Code` = colDef(name = "Plot Code", class = "cell") ,
                                     `Native<sup>a</sup>` = colDef(class = "border-left"),
                                     `Non-Native<sup>a</sup>`= colDef(class = "group"),
                                     `Unknown<sup>a</sup>` = colDef(class = "group"),
                                     `H <sup>a</sup>` = colDef(class = "border-left"),
                                     `H <sup>b</sup>` = colDef(class = "border-left"),
                                     `H <sup>c</sup>` = colDef(class = "border-left"),
                                     `H <sup>d</sup>` = colDef(class = "border-left")),
                                   compact = TRUE
                                   
                                   
                         )
                       )
                     }
)

# unique(df_plotrich$Park_Code)
# unique(df_parkrich$Park_Code)

saveRDS(df_parkrich, here::here("df_parkrich.RDS"))
saveRDS(df_plotrich, here::here("df_plotrich.RDS"))



