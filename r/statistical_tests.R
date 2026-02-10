library(dplyr)

df <- read.csv("analysis_data.csv")

# H2: Rising vs Falling
rising_returns <- df %>%
  filter(rate_regime == "Rising") %>%
  pull(monthly_return)

falling_returns <- df %>%
  filter(rate_regime == "Falling") %>%
  pull(monthly_return)

t.test(rising_returns, falling_returns)

# H3: Technology vs Others during Falling
falling_df <- df %>%
  filter(rate_regime == "Falling")

t.test(monthly_return ~ (sector == "Technology"), data = falling_df)
