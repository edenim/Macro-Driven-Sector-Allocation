library(dplyr)

# -----------------------------
# Summary-level data from Python
# -----------------------------
df <- data.frame(
  rate_regime = c(
    "Rising","Rising","Rising",
    "Falling","Falling","Falling","Falling"
  ),
  sector = c(
    "Technology","Technology","Energy",
    "Technology","Technology","Health Care","Energy"
  ),
  monthly_return = c(
    0.0084, 0.0079, 0.0037,
    0.0078, 0.0081, 0.0105, 0.0114
  )
)
# -----------------------------
# H2: Rising vs Falling
# -----------------------------
t.test(
  monthly_return ~ rate_regime,
  data = df %>% filter(rate_regime != "Stable")
)

# -----------------------------
# H3: Technology vs Others (Falling)
# -----------------------------
t.test(
  monthly_return ~ (sector == "Technology"),
  data = df %>% filter(rate_regime == "Falling")
)
