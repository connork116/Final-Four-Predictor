# File: cbbdata_setup.R
# One-time setup for cbbdata API access

# Install devtools and dependencies
if (!require("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

install.packages(c("jsonlite", "httr", "dplyr", "tidyr"))

# Install cbbdata from GitHub and load it
devtools::install_github("andreweatherman/cbbdata")
library(cbbdata)

# Check if it loaded properly
if (!exists("cbd_create_account")) {
  stop("cbbdata didn't install correctly. Try restarting RStudio and running again.")
}

# Create your account - REPLACE WITH YOUR INFO
cbd_create_account(
  username = "YOUR USERNAME", 
  email = "YOUR EMAIL",
  password = "YOUR PASSWORD"
)

# Login to get your API key
# NOTE: If using RStudio, you may want to set up environment variables for your username and password instead of hardcoding them here.
cbd_login(username = "YOUR USERNAME", password = "YOUR PASSWORD")