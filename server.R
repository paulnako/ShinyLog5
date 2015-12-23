library(Lahman); library(plyr)
data(Teams)

#Subset to last three years of data
data <- subset(Teams, Teams$yearID %in% tail(unique(Teams$yearID), 3))

unique(data$franchID)
data$franchID <- mapvalues(data$franchID, from = c("DET", "CLE", "CHW", "KCR", "MIN", "NYY", "TBD", "BOS",
                                                   "TOR", "BAL", "TEX", "ANA", "OAK", "SEA", "MIL", "STL",
                                                   "CIN", "PIT", "CHC", "HOU", "PHI", "ATL", "WSN", "NYM",
                                                   "FLA", "ARI", "SFG", "LAD", "COL", "SDP"), 
                           to=c("Detroit Tigers", "Cleveland Indians","Chicago White Sox", 
                                "Kansas City Royals","Minnesota Twins", "New York Yankees",
                                "Tampa Bay Rays", "Boston Red Sox", "Toronto Blue Jays", 
                                "Baltimore Orioles", "Texas Rangers", "Los Angeles Angels of Anaheim", 
                                "Oakland Athletics","Seattle Mariners", "Milwaukee Brewers", 
                                "St. Louis Cardinals", "Cincinatti Reds", "Pittsburgh Pirates",
                                "Chicago Cubs", "Houston Astros", "Philadelphia Phillies", 
                                "Atlanta Braves", "Washington Nationals", "New York Mets", "Miami Marlins", 
                                "Arizona Diamondbacks", "San Francisco Giants", "Los Angeles Dodgers", 
                                "Colorado Rockies", "San Diego Padres"))

log5 <- function(Team1, Team2){
  t1pct <- with(subset(data, franchID == Team1), sum(W) / sum(G))
  t2pct <- with(subset(data, franchID == Team2), sum(W) / sum(G))
  answer <- (t1pct - (t1pct * t2pct)) / (t1pct + t2pct - (2 * t1pct * t2pct))
  answer
}



shinyServer(function(input, output) {
  
  # You can access the value of the widget with input$select, e.g.
  output$value <- renderText({ 
    paste0('The expected log5 winning percentage for the  ', input$teamA, " against the ",
    input$teamB, " is ", round(log5(input$teamA, input$teamB), 3)) })
  
})
