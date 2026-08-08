## Processed Data

The repository does not include the complete processed dataset (`master_dataset_cleaned.csv`) because it exceeds GitHub's file size limit.

### How to Regenerate the Dataset

1. Run `generate_marketing_data.py` to generate all raw CSV files inside the `data/raw/` directory.
2. Execute the **Generate Master Dataset** notebook to merge the raw files into a single master dataset.
3. Run the **Data Preparation & EDA** notebook to:
   - Clean the data
   - Handle missing values (if any)
   - Create derived KPIs and engineered features
   - Perform preprocessing
4. Export the final processed dataset as `master_dataset_cleaned.csv`.

The regenerated `master_dataset_cleaned.csv` is used throughout the project for:
- Statistical Analysis
- Machine Learning (Linear Regression & Random Forest)
- Tableau Dashboard Development