library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(DT)

data<- read.csv("ds_salaries_def.csv")

ui <- fluidPage(
  titlePanel("Analisis de los diferentes trabajos en Ciencia de Datos"),
  sidebarLayout(
    sidebarPanel(
      sliderInput('ratio', 'Selecciona el ratio de trabajo realizado a distancia:', min=min(data$remote_ratio), max=max(data$remote_ratio), value=c(min(data$remote_ratio),max(data$remote_ratio)), step=50),
      selectInput('año', 'Seleccion el año (o los años):', choices = unique(data$work_year), selected = 2021, multiple = T),
      actionButton('boton', 'Analizar')
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Cantidad segun tipos de trabajo', plotlyOutput('boxplot')),
        tabPanel('Tabla de informacion', DTOutput('tabla')),
        tabPanel('Salario vs Ratio', plotlyOutput('scatter')),
       )
    )
  )
)

server<- function(input, output){
  df<- eventReactive(input$boton,{
    filter(data, work_year %in% input$año & 
             remote_ratio>= input$ratio[1] &
             remote_ratio<= input$ratio[2])
  })
  output$boxplot<- renderPlotly({
    plot_ly(df(), x=~employment_type, type = "histogram",color = ~employment_type)
  }) 
  output$tabla<- renderDT({
    tabla<- select(df(),"work_year", "employment_type", "salary_in_usd", "remote_ratio" )  
    })
  output$scatter<- renderPlotly({
    plot_ly(df(), x=~remote_ratio, y=~salary_in_usd, type = "scatter", color = ~employment_type )
  })
}
colnames(data)
shinyApp(ui, server)
