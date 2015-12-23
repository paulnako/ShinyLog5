library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Log5 Winning Percentage Calculator"),
  selectInput("teamA", label = h3("Team A:"), 
              choices = list("Detroit Tigers", "Cleveland Indians","Chicago White Sox", 
                             "Kansas City Royals","Minnesota Twins", "New York Yankees",
                             "Tampa Bay Rays", "Boston Red Sox", "Toronto Blue Jays", 
                             "Baltimore Orioles", "Texas Rangers", "Los Angeles Angels of Anaheim", 
                             "Oakland Athletics","Seattle Mariners", "Milwaukee Brewers", 
                             "St. Louis Cardinals", "Cincinatti Reds", "Pittsburgh Pirates",
                             "Chicago Cubs", "Houston Astros", "Philadelphia Phillies", 
                             "Atlanta Braves", "Washington Nationals", "New York Mets", "Miami Marlins", 
                             "Arizona Diamondbacks", "San Francisco Giants", "Los Angeles Dodgers", 
                             "Colorado Rockies", "San Diego Padres"), 
              selected = 1),
  selectInput("teamB", label = h3("Team B:"), 
              choices = list("Detroit Tigers", "Cleveland Indians","Chicago White Sox", 
                             "Kansas City Royals","Minnesota Twins", "New York Yankees",
                             "Tampa Bay Rays", "Boston Red Sox", "Toronto Blue Jays", 
                             "Baltimore Orioles", "Texas Rangers", "Los Angeles Angels of Anaheim", 
                             "Oakland Athletics","Seattle Mariners", "Milwaukee Brewers", 
                             "St. Louis Cardinals", "Cincinatti Reds", "Pittsburgh Pirates",
                             "Chicago Cubs", "Houston Astros", "Philadelphia Phillies", 
                             "Atlanta Braves", "Washington Nationals", "New York Mets", "Miami Marlins", 
                             "Arizona Diamondbacks", "San Francisco Giants", "Los Angeles Dodgers", 
                             "Colorado Rockies", "San Diego Padres"), 
              selected = 1),
  
  hr(),
  mainPanel(
    tabsetPanel(type = "tabs", 
                tabPanel("Log5", verbatimTextOutput("value")), 
                tabPanel("Documentation", "Log 5 is a formula invented by Bill James to estimate the 
                         probability that team A will win a game, based on the true winning percentage of 
                         Team A and Team B. This app derives winning percentages from the last three available seasons in the 
                         Lahman Baseball database.  To use, select two teams to derive the log5 winning percentage for Team A.")
))))

