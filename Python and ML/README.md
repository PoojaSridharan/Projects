# Personalized Movie & TV Show Recommender
## Project Overview

This project aims to build a movie recommendation system that provides personalized suggestions based on user preferences and cluster analysis of movies and TV shows. It utilizes various data analysis techniques to derive insights and correlations from a dataset containing movie ratings, genres, and other features.

## Key Features
**Data Cleaning:** The dataset was cleaned to ensure accuracy and consistency, removing any irrelevant or incomplete records.

**Correlation Analysis:** Analyzed the correlation between movie ratings and the number of votes to understand viewer preferences.

**Trend Analysis:** Conducted trend analysis of movies and TV shows over time to identify popular genres and themes.

**Country-wise Analysis:** Explored the performance of movies and TV shows across different countries.

**Clustering:** Implemented clustering techniques to group similar movies and TV shows based on features like genre and type.

**Recommendation Engine:** Developed a recommendation engine that suggests movies based on user input and similarity metrics.

## How It Works
**Data Preparation:**

Cleaned and preprocessed the dataset by handling missing values and encoding categorical features such as genre, type, and country.
Similarity Calculation:

Used cosine similarity to create a similarity matrix, which quantifies how similar movies are to one another based on their features.

**Cluster-based Recommendations:**

Filtered recommendations based on movie clusters, providing users with tailored suggestions that match their preferences.

## Tools Used
1. Python
2. Pandas
3. NumPy
4. scikit-learn
5. Matplotlib
6. Seaborn
