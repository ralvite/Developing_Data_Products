

library(markdown)
library(DT)

navbarPage("Diamond price",
           tabPanel("About",
                    fluidRow(
                        column(6,
                               includeMarkdown("about.md")
                        ),
                        column(3
                               ,
                               img(class="img-polaroid",
                                   src="http://4cs.gia.edu/wp-content/uploads/2017/05/Hero-Carat-Weight_700x394.jpg")
                        )
                    )),
           tabPanel("Explore",
                    sidebarLayout(
                        sidebarPanel(
                            sliderInput("sliderCarat", "What is the diamond carat weight?", 0.20, 2.5, value = 0.8)
                        ),
                        
                        mainPanel(
                            plotOutput("plot1"),
                            h3("Predicted Price from Model:"),
                            textOutput("pred1")
                            
                        )
                    )
                        
           ),
           tabPanel("Summary",
                    verbatimTextOutput("summary")
           ),
           tabPanel("Data",
                    DT::dataTableOutput("table")
           )
)

