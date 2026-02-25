# File: pull_barttorvik.R
# Pull Barttorvik historical data using cbbdata package

library(cbbdata)
library(dplyr)

# Login
cbd_login(username = 'YOUR USERNAME', password = 'YOUR PASSWORD')

# Define which seasons to pull
seasons <- 2008:2025

# Pull ratings data for all seasons
all_seasons <- lapply(seasons, function(yr) {
  message(paste("Pulling season", yr))
  df <- cbd_torvik_ratings(year = yr)
  df$season <- yr
  return(df)
}) %>% bind_rows()

# Save to CSV
write.csv(all_seasons, "data/raw/barttorvik_historical.csv", row.names = FALSE)

# Print confirmation
message("Done! Data saved to data/raw/")
message(paste("Total rows:", nrow(all_seasons)))
message(paste("Total teams per season (avg):", round(nrow(all_seasons)/length(seasons))))

# Preview
print(head(all_seasons))