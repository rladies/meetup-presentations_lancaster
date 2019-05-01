# Script to run with the presentation

# Coffee
library("beepr")
Sys.sleep(3)
beep(1)
beep("mario")

library("BRRR")
skrrrahh(18)

library("RXKCD")
getXKCD()
getXKCD(435)









# Twitter
library("rtweet")
create_token(
  app = "rhian",
  consumer_key = Sys.getenv("twitterKey"),
  consumer_secret = Sys.getenv("twitterKeySecret"),
  access_token = Sys.getenv("twitterToken"),
  access_secret = Sys.getenv("twitterTokenSecret"))

post_tweet("I'm sending this tweet, from R, live during the first ever @RLadiesLancs meetup. I really hope it actually works... #rstats #rladies", media = "images/fingers-crossed.gif")












# Rcade
library("Rcade")
Rcade::games$Pacman

