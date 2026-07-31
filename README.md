# Healthcare Insurance Cost Analysis

Exploratory data analysis of a healthcare insurance dataset to identify what drives medical insurance charges. The same analysis is implemented twice — once in Python and once in R — plus an interactive Power BI dashboard, so the project doubles as a comparison of both toolchains alongside a BI-tool deliverable.

## Project Scope

This repository currently includes:

- **Python EDA** — data cleaning (pandas), SQL querying (sqlite3), and visualization (seaborn/matplotlib) in a single Jupyter notebook.
- **R replication** — the same cleaning and charts re-implemented in R (dplyr, ggplot2), to compare both languages on the same questions. SQL querying is Python-only for now.
- **Power BI dashboard** *(in progress)* — an interactive dashboard built on top of the same dataset for business-facing exploration, to be added once complete.

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

- Python (pandas, sqlite3, seaborn, matplotlib)
- R (dplyr, DBI/RSQLite, ggplot2)
- Power BI *(dashboard in progress)*

## Key Findings

- **Smoking is the dominant cost driver.** Smokers pay ~$32,050 on average vs. ~$8,441 for non-smokers — roughly 4x more.
- **BMI compounds risk mainly for smokers.** Charges correlate strongly with BMI for smokers (r ≈ 0.81) but barely at all for non-smokers (r ≈ 0.08). Smokers with a BMI over 30 pay ~$41,693 on average.
- **Age has a steady, moderate effect**, with average charges rising from ~$7,086 (ages 0-18) to ~$18,085 (ages 50+).
- **Region and sex have a smaller effect.** The southeast has the highest average charges (~$14,735), partly explained by having the highest average BMI (~33.4) of any region.

Full analysis, SQL queries, and charts are in [`Cleaning-Querying-Visualisation.ipynb`](Cleaning-Querying-Visualisation.ipynb) (Python). The R equivalent, covering cleaning and visualization, is viewable with results already rendered at [`eda_analysis.md`](eda_analysis.md) — no need to run R to see it.

## Business Recommendations

1. Prioritize smoking-cessation incentives, since smoking is the largest single driver of cost.
2. Use combined risk scoring (BMI × smoking status) for underwriting rather than single-factor thresholds.
3. Target wellness programs at high-BMI smokers, the highest-cost segment.
4. Review regional pricing in the southeast, where average BMI and charges are both elevated.
5. Monitor high-cost outliers separately for case management, since a small group of high-BMI smokers drives a disproportionate share of total cost.

## Running the Analysis

**Python:**
```bash
pip install -r requirements.txt
jupyter notebook Cleaning-Querying-Visualisation.ipynb
```

**R:**

Results are already rendered in [`eda_analysis.md`](eda_analysis.md) — just open it, no R installation needed. To run it yourself:
```bash
Rscript eda_analysis.R          # runs the analysis, plots open interactively
```
or open [`eda_analysis.Rmd`](eda_analysis.Rmd) in RStudio and knit it to regenerate `eda_analysis.md` with fresh output. Requires the `dplyr` and `ggplot2` packages (`install.packages(c("dplyr", "ggplot2"))`), plus `rmarkdown`/`knitr` and Pandoc if re-knitting.

## Python vs. R: Notes

Both run the same cleaning logic against the same dataset, so the underlying findings match — the difference is in the toolchain:

- **Syntax style**: pandas is more imperative; R's dplyr pipeline (`%>%`) reads as a chain of verbs, which some find more readable for step-by-step data manipulation.
- **Visualization**: seaborn/matplotlib and ggplot2 produce comparable charts, but ggplot2's layered grammar-of-graphics syntax (`+` to add layers) is often considered faster for iterating on plot aesthetics.
- **Result sharing**: a Jupyter notebook stores code and output together natively; R's equivalent is R Markdown (`.Rmd`) knitted to a GitHub-flavored doc (`eda_analysis.md`), which is what's used here so results are visible without running anything.
- **Ecosystem fit**: Python is generally stronger for general-purpose scripting, automation, and downstream ML; R remains a strong choice for statistics-heavy analysis and is widely used in academic/health-research settings — relevant given this is a healthcare dataset.

## Power BI Dashboard

An interactive Power BI dashboard is planned as a business-facing companion to the notebook analysis, built directly on `insurance.csv`. It will be added to this repository (as a `.pbix` file and/or exported screenshots) once complete.

## Project Structure

```
.
├── Cleaning-Querying-Visualisation.ipynb   # Python: cleaning, SQL queries, visualizations
├── eda_analysis.R                          # R: same cleaning and charts, plain script
├── eda_analysis.Rmd                        # R: source for the knitted results doc below
├── eda_analysis.md                         # R: rendered results (view directly on GitHub)
├── eda_analysis_files/                     # Chart images embedded in eda_analysis.md
├── insurance.csv                            # Source dataset
├── requirements.txt                         # Python dependencies
└── README.md
```
