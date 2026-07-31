# ============================================================
# Healthcare Insurance Cost Analysis - R Replication
# ============================================================
# Replicates the data cleaning and visualization steps from the
# Python notebook (Cleaning-Querying-Visualisation.ipynb) using R:
# dplyr for cleaning, ggplot2 for visualization. Same dataset,
# same questions - a side-by-side comparison of the two toolchains.

# ---- Setup ----
library(dplyr)
library(ggplot2)

# ---- Data Inspection ----
df <- read.csv("insurance.csv", stringsAsFactors = FALSE)

head(df)
str(df)
summary(df)
dim(df)

sapply(df[c("sex", "children", "smoker", "region")], unique)

# ---- Data Cleaning ----
sum(duplicated(df))
df[duplicated(df) | duplicated(df, fromLast = TRUE), ]

df <- distinct(df)
cat("Remaining duplicates:", sum(duplicated(df)), "\n")
cat("Shape after cleaning:", nrow(df), "rows,", ncol(df), "columns\n")

# ---- Data Visualisation ----

# Chart 1: Distribution of charges
ggplot(df, aes(x = charges)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Insurance Charges",
       x = "Charges ($)", y = "Number of People") +
  theme_minimal()

# Chart 2: Charges - smokers vs non-smokers
ggplot(df, aes(x = smoker, y = charges)) +
  geom_boxplot(fill = "steelblue") +
  labs(title = "Insurance Charges: Smokers vs Non-Smokers",
       x = "Smoking Status", y = "Insurance Charges ($)") +
  theme_minimal()

# Chart 3: BMI vs charges, coloured by smoking status
ggplot(df, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.6) +
  labs(title = "BMI vs Insurance Charges",
       x = "BMI", y = "Insurance Charges ($)") +
  theme_minimal()

# Chart 4: Average charges by age group
df$age_group <- cut(df$age,
                     breaks = c(0, 18, 30, 40, 50, 100),
                     labels = c("0-18", "18-30", "30-40", "40-50", "50+"))

df %>%
  group_by(age_group) %>%
  summarise(avg_charge = mean(charges)) %>%
  ggplot(aes(x = age_group, y = avg_charge)) +
  geom_col(fill = "steelblue") +
  labs(title = "Average Charges by Age Group",
       x = "Age Group", y = "Average Charges ($)") +
  theme_minimal()

# ============================================================
# Findings match the Python notebook's visual analysis exactly,
# since both work from the same cleaned dataset - see README.md
# for the full write-up of key findings and business recommendations.
# ============================================================
