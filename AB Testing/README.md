# A/B Testing Case Study: Landing Page Redesign
## 📌 Project Overview

This project presents an end-to-end A/B testing analysis conducted to evaluate whether a redesigned landing page improves user conversion compared to an existing version.

The goal of this project was not only to apply statistical techniques, but also to practice real-world experimentation thinking — from business problem framing to data validation, statistical testing, and business recommendation.

## 🎯 Business Problem

The business wants to determine whether launching a new landing page design will lead to higher user conversion. Since conversion directly impacts revenue and user engagement, an A/B test was conducted before rolling out the change to all users.

## 🧪 Experiment Design

- Control Group: Users shown the existing (old) landing page
- Treatment Group: Users shown the redesigned (new) landing page
- Assignment: Randomized, one version per user
- Primary Metric: Conversion rate (binary: converted / not converted)


## 📊 Dataset Description

The dataset contains approximately 294,000 user records with the following attributes:

- User behavior (conversion, pages visited, session duration)
- Demographics (age, gender, location)
- Device information
- Experiment assignment (control vs treatment)

Each user appears only once in the dataset, ensuring independence of observations.

## 🔍 Data Validation & EDA

Before analysis, several checks were performed:

- Verified no duplicate user IDs
- Confirmed correct landing page assignment per group
- Checked for missing values and correct data types
- Validated balance across key dimensions:

  - Age
  - Gender
  - Device type
  - Geographic location

Exploratory analysis confirmed that randomization worked as expected and that conversion rate is the most appropriate primary metric.

## 📐 Hypotheses

- Null Hypothesis (H₀):
  There is no difference in conversion rates between the control and treatment groups.

- Alternative Hypothesis (H₁):
  There is a difference in conversion rates between the control and treatment groups.

A two-sided test was used to detect both potential improvements and degradations.

## 📈 Key Results

- Control Conversion Rate: 11.87%
- Treatment Conversion Rate: 17.95%
- Absolute Lift: +6.08 percentage points

This indicates a substantial improvement in conversion for users exposed to the redesigned landing page.

## 🧠 Statistical Analysis

- Test Used: Two-sample proportion z-test
- P-value: < 0.001 (statistically significant)
- 95% Confidence Interval for Lift: [5.8%, 6.3%]

The confidence interval lies entirely above zero, providing strong evidence that the new landing page improves conversion rate.

## ✅ Conclusion & Recommendation

The redesigned landing page demonstrates both statistical significance and practical significance. Given the large and consistent improvement in conversion rate, the recommendation is to roll out the new landing page to all users, while continuing to monitor guardrail metrics post-deployment.

## 🧠 Key Learnings

- How to structure an A/B test from a business perspective
- Importance of data validation before statistical testing
- Difference between statistical significance and practical significance
- Translating statistical outputs into actionable business decisions

## 🛠 Tools & Technologies

- Python
- Pandas
- NumPy
- Matplotlib
- Statsmodels
