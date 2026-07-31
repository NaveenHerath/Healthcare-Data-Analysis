# Healthcare Insurance Cost Analysis

Exploratory data analysis of a healthcare insurance dataset to identify what drives medical insurance charges, using pandas for cleaning, SQL (via sqlite3) for querying, and seaborn/matplotlib for visualization.

## Dataset

`insurance.csv` — 1,338 records of US health insurance policyholders with the following fields:

| Column | Description |
|---|---|
| age | Age of the policyholder |
| sex | Gender |
| bmi | Body mass index |
| children | Number of dependents |
| smoker | Smoking status |
| region | US region of residence |
| charges | Annual medical insurance charges ($) |

## Tools

- Python
- pandas
- sqlite3
- seaborn
- matplotlib

## Key Findings

- **Smoking is the dominant cost driver.** Smokers pay ~$32,050 on average vs. ~$8,441 for non-smokers — roughly 4x more.
- **BMI compounds risk mainly for smokers.** Charges correlate strongly with BMI for smokers (r ≈ 0.81) but barely at all for non-smokers (r ≈ 0.08). Smokers with a BMI over 30 pay ~$41,693 on average.
- **Age has a steady, moderate effect**, with average charges rising from ~$7,086 (ages 0-18) to ~$18,085 (ages 50+).
- **Region and sex have a smaller effect.** The southeast has the highest average charges (~$14,735), partly explained by having the highest average BMI (~33.4) of any region.

Full analysis, SQL queries, and charts are in [`Cleaning-Querying-Visualisation.ipynb`](Cleaning-Querying-Visualisation.ipynb).

## Business Recommendations

1. Prioritize smoking-cessation incentives, since smoking is the largest single driver of cost.
2. Use combined risk scoring (BMI × smoking status) for underwriting rather than single-factor thresholds.
3. Target wellness programs at high-BMI smokers, the highest-cost segment.
4. Review regional pricing in the southeast, where average BMI and charges are both elevated.
5. Monitor high-cost outliers separately for case management, since a small group of high-BMI smokers drives a disproportionate share of total cost.

## Running the Notebook

```bash
pip install -r requirements.txt
jupyter notebook Cleaning-Querying-Visualisation.ipynb
```

## Project Structure

```
.
├── Cleaning-Querying-Visualisation.ipynb   # Full analysis: cleaning, SQL queries, visualizations
├── insurance.csv                            # Source dataset
├── requirements.txt                         # Python dependencies
└── README.md
```
