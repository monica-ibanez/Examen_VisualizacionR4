library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(DT)

data<- read.csv("ds_salaries_def.csv")

ui <- fluidPage(
  titlePanel("Analisis de Salarios y Perfiles en Ciencia de Datos"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput('año', 'Selecciona el año:', choices= sort(unique(data$work_year)), selected=unique(data$work_year)),
      selectInput('tamaño', 'Tamaño de empresa:', choices = unique(data$company_size), selected = 'M'),
      actionButton('boton', 'Actualizar')
      
      ),
    mainPanel(
      tabsetPanel(
        tabPanel('Histograma', plotOutput('histograma')),
        tabPanel('Tabla de años', DTOutput('tabla')),
        tabPanel('Salario vs index', plotlyOutput('scatter')),
        tabPanel('Salario por experiencia', plotOutput('boxplot')),
        tabPanel('Salario por pais', plotOutput('barras'))
      )
    )
  )
)

server<- function (input, output){
  df<- eventReactive(input$boton,{
    filter(data, work_year %in% input$año & 
             company_size == input$tamaño ) 
  })
  output$histograma<- renderPlot({
    ggplot(df(), aes(x= salary_in_usd))+
      geom_histogram(color = "purple",  fill = "purple", alpha=0.5,bins = 20)+
      labs (title = "Distribucion de Salarios", x= "Salario en USD", y ="Frecuencia")
  })
  output$tabla <- renderDT({
    tabla <- df() %>%
      select(c('work_year', "experience_level", 'employment_type', 'salary_in_usd'))
  })
  output$scatter<- renderPlotly({
    plot_ly(df(), x=~salary_in_usd, y=~scale_index, type='scatter', color = ~experience_level, mode = 'markers')
  })
  output$boxplot<- renderPlot({
    ggplot(df(), aes(x= experience_level, y=salary_in_usd))+
      geom_boxplot(fill = c("coral","darkgreen","cyan", "purple"))+
      labs(title = "Salario por nivel de experiencia", x= "Nivel de experiencia", y = "Salario en USD")
  })
  output$barras<- renderPlot({
    ggplot(df(), aes(x= salary_in_usd, y=employee_residence))+
      stat_summary(fun.y =  "mean", geom = "bar", color="#3399FF" )
    labs(title = "Salario promedio por pais", x= "Salario Promedio", y = "País")
  })
}
shinyApp(ui, server)
