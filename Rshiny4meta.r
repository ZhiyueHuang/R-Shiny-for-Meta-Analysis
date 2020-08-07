library(shiny)

# Define UI ----
ui <- fluidPage(
  
  titlePanel("Statistical Report for Meta Analysis (Introduction & Material and Methods)"),
  
  sidebarLayout(
    sidebarPanel(
      
      textInput("population", h3("Population"), 
                value = "Enter text..."),
      
      textInput("group", h3("Group"), 
                value = "Enter text..."),
      
      textInput("data_base", h3("Data Base"),
                value = "Enter text..."),
      
      textInput("time_range", h3("Time Range"),
                value = "Enter text..."),
      
      textInput("search_strategy", h3("Search Strategy"),
                value = "Enter text..."),
      
      selectInput("search_language", h3("Search Language"),
                  choices = list("No language limitation" = "no language limitation",
                                 "English only" = "English only",
                                 "Chinese only" = "Chinese only")),
      
      textInput("investigators_main", h3("Main Investigators"),
                value = "Enter text..."),
      
      textInput("investigator3", h3("Third Investigator"),
                value = "Enter text..."),
      
      textInput("baseline", h3("Baseline Covariates"),
                value = "Enter text..."),
      
      textInput("endpoints", h3("Endpoints"),
                value = "Enter text...")
      
      #fileInput("data", h3("Meta Data"))
    ),
    
    
    mainPanel(
      h1("Introduction"),
      p(textOutput("p1")),
      
      h1("Materials and Methods"),
      h2("Selection criteria"),
      p(textOutput("p2")),
      p("The studies inclusion/exclusion criteria include:"),
      div("Please list the inlcusion/exclusion criteria of the studies here.", style = "color:blue"),
      
      p("Moreover, all studies were carefully evaluated to identify duplicate patient populations. 
          Criteria used to determine duplicate populations included the study period, hospital, 
          treatment information, and any additional inclusion items. However, subsequent reports 
          containing new data on prognostic factors or survival were also incorporated into pooled 
          analyses of the specific point."),
      
      h2("Quality assessement"),
      p(textOutput("p3")),
      
      h2("Data extraction"),
      p(textOutput("p4"))
      
    )
  )
  
  
  
)

# Define server logic ----
server <- function(input, output) {
  
  output$p1 = renderText({
    paste("The aim of this analysis is to invesigate the role of ",
          input$group,
          " as a prognostic factor to ", input$population, ". ", 
          "A systematic review and meta-analysis will be performed 
             to clarify the clinical significance of ", input$group, 
          " in ", input$population, ".", 
          " This article reports the statistical part of this meta analysis.", 
          sep = ""
    )
  })
  
  
  output$p2 = renderText({
    paste("A literature search was conducted in ", input$data_base, ".",
          "All the sutdies published before", input$time_range, "were included.", 
          "Search criteria used", input$search_strategy, ".", 
          "The search was restricted to human studies with", input$search_language, "."
    )
  })
  
  output$p3 = renderText({
    paste("Investigators ", input$investigators_main, " independently evaluated 
             the methodological quality of the studies twice, applying 
             the Newcastle-Ottawa Quality Assessment scale for case-control
             and cohort studies. ", 
          "According to the quality scales, if a study met a requirement, 
              then it gained a score of 1; otherwise, it gained a score of 0. ",
          "REMARK guidelines, which provide a useful start for assessing tumor prognostic markers, 
              were used to help identify study bias. ",
          "When discrepancies between investigators occurred, 
              a third investigator ", input$investigator3, 
          " conducted an additional evaluation.", sep = "")
  })
  
  output$p4 = renderText({
    paste("Baseline characteristics of the included studies, such as ",
          input$baseline,
          " were independently recorded on a spreadsheet. ",
          "In each study, ", input$endpoints, " were extracted with their standard error, if available.",
          "Hazard ratio (HR) was used to assess the prognostic impact of ",
          input$group, " for time to event data; while odds ratio for binary outcomes. ", 
          "For those studies that did not report the HR but provided sufficient data on survival, 
             the log HRs and variances were estimated based on the methodology published previously. ",
          "An HR greater than 1 implied a worse survival for those patients with ", input$group, ". ", 
          "Otherwise, if the value of HR was smaller than 1, a better prognosis was indicated for the group with ", input$group, ".",  
          "If the value of HR could be obtained from both multivariate and univariate analyses, we extracted the HR from univariate analyses.",
          sep = "")
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
