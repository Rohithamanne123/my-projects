library(tidyverse) 
library(ggplot2)

expenses <- read.csv("C:/Users/Rohitha Manne/Downloads/Expenses.csv")
View(expenses)

# View the structure of the data
str(expenses)

# View the unique expense types
unique(expenses$Expense)

# Summary of monthly spend by expense
expenses %>%
  group_by(Expense) %>%
  summarise(amount_spent = sum(Debit))

# Since there are so many different expense types, consolidate expense 
# types into broader categories

expense_categories <- expenses %>%
  mutate(expense_type = 
           case_when(Expense %in% c('Car Payment', 'Car insurance', 'Mortgage',
                                    'College Payment') ~ 'fixed_expenses',
                     Expense %in% c('Cell phones', 'Electric', 'TV', 'Oil',
                                    'Water') ~ 'utilities',
                     Expense %in% c('Car Expense', 'EZPASS', 
                                    'Gas', 'Healthcare', 
                                    'Household Misc', 'Lawn Service', 
                                    'Parking', 'Work Expense', 'Groceries',
                                    'Dogs') ~ 'variable_expenses', 
                     Expense %in% c('Cash', 'Entertainment', 'Food', 'Gifts', 
                                    'Misc', 'Party Expense', 'Peloton', 
                                    'Travel') ~ 'personal_spending'))


# View the new expense type category sums with percentages

expense_categories %>%
  group_by(expense_type) %>%
  summarise(amount_spent = sum(Debit)) %>%
  mutate(percent = amount_spent/sum(amount_spent)*100, 
         round(percent, digits=0))

# Sum and graph broad expense types

expense_categories %>%
  group_by(expense_type) %>%
  summarise(amount_spent = sum(Debit)) %>%
  ggplot(aes(x = expense_type, y = amount_spent, fill = expense_type)) +
  geom_col(position = "dodge") + 
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))


# Create a tibble of the new expense type category numbers to make
# the code for a pie chart easy to write

summary_expenses <- expense_categories %>%
  group_by(expense_type) %>%
  summarise(amount_spent = sum(Debit)) %>%
  mutate(percent = amount_spent/sum(amount_spent)*100)


# Plot a pie chart

ggplot(summary_expenses, aes(x = "", y = percent, fill = expense_type)) +
  geom_col() +
  geom_text(aes(label = round(percent, digit=0)),
            position = position_stack(vjust=0.5)) + 
  coord_polar(theta = "y")



expense_categories %>%
  filter(expense_type == 'personal_spending') %>%
  distinct(Expense)

#-------------------------------------------

library(shiny)
library(ggplot2)
library(plotly)

# Define UI
ui <- fluidPage(
  titlePanel("Monthly Expenses Tracker"),
  sidebarLayout(
    sidebarPanel(
      h3("Enter Monthly Expenses"),
      numericInput("jan", "January", value = 0, min = 0),
      numericInput("feb", "February", value = 0, min = 0),
      numericInput("mar", "March", value = 0, min = 0),
      numericInput("apr", "April", value = 0, min = 0),
      numericInput("may", "May", value = 0, min = 0),
      numericInput("jun", "June", value = 0, min = 0),
      numericInput("jul", "July", value = 0, min = 0),
      numericInput("aug", "August", value = 0, min = 0),
      numericInput("sep", "September", value = 0, min = 0),
      numericInput("oct", "October", value = 0, min = 0),
      numericInput("nov", "November", value = 0, min = 0),
      numericInput("dec", "December", value = 0, min = 0)
    ),
    mainPanel(
      h3("Total Monthly Expenses"),
      verbatimTextOutput("total"),
      plotOutput("barplot"),
      plotlyOutput("calendarPlot"),
      plotlyOutput("regressionPlot"),
      plotlyOutput("pieChart")
    )
  )
)

# Define server
server <- function(input, output) {
  
  # Calculate total expenses
  totalExpenses <- reactive({
    total <- sum(input$jan, input$feb, input$mar, input$apr, input$may, input$jun,
                 input$jul, input$aug, input$sep, input$oct, input$nov, input$dec)
    return(total)
  })
  
  # Output total expenses to UI
  output$total <- renderText({
    paste0("$", totalExpenses())
  })
  
  # Create bar plot of monthly expenses
  output$barplot <- renderPlot({
    expenses <- c(input$jan, input$feb, input$mar, input$apr, input$may, input$jun,
                  input$jul, input$aug, input$sep, input$oct, input$nov, input$dec)
    months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
    data <- data.frame(expenses, months)
    ggplot(data, aes(factor(months, months), expenses, fill = months)) + 
      geom_bar(stat = "identity") +
      labs(x = "Month", y = "Total Expenses", title = "Monthly Expenses Tracker") +
      scale_fill_brewer(palette = "Set3")  # Use a color palette
  })
  
  # Create calendar plot using Plotly
  output$calendarPlot <- renderPlotly({
    expenses <- c(input$jan, input$feb, input$mar, input$apr, input$may, input$jun,
                  input$jul, input$aug, input$sep, input$oct, input$nov, input$dec)
    months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
    data <- data.frame(expenses, months)
    
    plot_ly(data, x = ~months, y = ~expenses, type = 'scatter',
            mode = 'markers+text',
            text = ~paste("$", expenses),
            textposition = 'top',
            marker = list(size = 15, color = ~expenses, colorscale = "Viridis")) %>%
      layout(title = "Monthly Expenses Calendar",
             xaxis = list(title = "Month"),
             yaxis = list(title = "Total Expenses"))
  })
  
   # Create pie chart
  output$pieChart <- renderPlotly({
    summary_expenses <- reactive({
      expense_categories %>%
        group_by(expense_type) %>%
        summarise(amount_spent = sum(Debit)) %>%
        mutate(percent = amount_spent/sum(amount_spent)*100)
    })
    
    plot_ly(data = summary_expenses(), labels = ~expense_type, values = ~amount_spent, type = 'pie',
            marker = list(colors = RColorBrewer::brewer.pal(n = 4, name = "Pastel1")),
            textinfo = "percent+label") %>%
      layout(title = "Expense Categories",
             xaxis = list(title = ""),
             yaxis = list(title = ""))
  })
  
  # Create regression plot
  output$regressionPlot <- renderPlotly({
    expenses <- c(input$jan, input$feb, input$mar, input$apr, input$may, input$jun,
                  input$jul, input$aug, input$sep, input$oct, input$nov, input$dec)
    months <- c(1:12)
    
    lm_model <- lm(expenses ~ months)
    
    fitted_values <- predict(lm_model, newdata = data.frame(months = months))
    
    plot_ly(x = ~months, y = ~expenses, type = 'scatter', mode = 'markers', 
            marker = list(size = 10, color = ~expenses, colorscale = "Viridis"),
            text = ~paste("$", expenses)) %>%
      add_trace(x = ~months, y = ~fitted_values, mode = 'lines', line = list(color = 'blue')) %>%
      layout(title = "Regression Analysis of Monthly Expenses",
             xaxis = list(title = "Month"),
             yaxis = list(title = "Total Expenses"))
  })
 
}

# Run the app
shinyApp(ui = ui, server = server)
