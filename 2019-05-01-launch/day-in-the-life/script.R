# Script to run with the presentation

# Coffee
library("beepr")
beep("mario")

library("BRRR")
skrrrahh(18)

library("RXKCD")
getXKCD()

library("rtweet")
create_token(
  app = "rhian",
  consumer_key = Sys.getenv("twitterKey"),
  consumer_secret = Sys.getenv("twitterKeySecret"),
  access_token = Sys.getenv("twitterToken"),
  access_secret = Sys.getenv("twitterTokenSecret"))

post_tweet("I'm sending this tweet, from R, live during the first ever @RLadiesLancs meetup. I really hope it actually works... #rstats #rladies", media = "images/fingers-crossed.gif")

library("Rcade")
Rcade::games$Pacman

#Strava
library("rStrava")
library("tidyverse")
library("lubridate")
app_name <- 'Statistical Sports Analysis' 
app_client_id  <- Sys.getenv("stravaID")
app_secret <- Sys.getenv("stravaSecret")

# create the authentication token
strava_token <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret))
my_acts <- get_activity_list(strava_token)
act_data <- compile_activities(my_acts) 
write_csv(x = act_data, path = "strava-data.csv")
