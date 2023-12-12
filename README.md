# Walmart Sales Analysis Using Python, SQL, and Excel

## Overview of Analysis

### Purpose

The purpose of this analysis is to gain insights into sales performance, identify areas for improvement, and make data-driven decisions to increase revenue. This challenge is from [ProjectPro](https://www.projectpro.io/article/sql-database-projects-for-data-analysis-to-practice/565) and the data is from [Kaggle](https://www.kaggle.com/datasets/yasserh/walmart-dataset).

## Data Dictionary

The dataset provided shows sales data for 45 Walmart stores. The data also provides a 'Holiday_Flag' variable which is a boolean field that shows whether the week is a special holiday week or not. This signifies promotional markdown events throughout the year preceding prominent holidays which include the Super Bowl, Labor Day, Thanksgiving, and Christmas.

The dataset includes 8 variables and 6435 samples.

![Data Dictionary](Images/walmart_data_dictionary.png)

## Data Cleaning

To prepare the data for importation and analysis in a SQL database, I first inspected the data using Python and cleaned the data as necessary. I used the 'dtypes' attribute to check the datatypes for each variable.

![Datatypes](Images/walmart_datatypes.png)

This shows that the 'Date' variable is currently an object type and not datetime. On closer inspection of the dates, there is inconsistent formatting as well. I changed the 'Data' datatype from object to datetime while also standardizing the formatting of the dates.

```
# Change Date datatype from object to date
walmart_data['Date'] = pd.to_datetime(walmart_data['Date'])
```

I then checked for missing values to see if there were any gaps in the data.

```
# Check for missing values
for col in walmart_data.columns.tolist():
  print('{} column missing values: {}'.format(col, walmart_data[col].isnull().sum()))
```

![Missing Values](Images/walmart_missing_values.png)

Luckily, there were no missing values in the data. I then checked the 'Holiday_Flag' variable to make sure that it was indeed a boolean field and only held two values.

```
# Check Holiday_Flag unique values
walmart_data['Holiday_Flag'].unique()
```

Since it was a boolean field, I created a new column called 'Holiday_Week' to convert the 'Holiday_Flag' variable from an integer to an object. I replaced the 1 and 0 values with the actualy text of what they signified - Holiday Week and Not Holiday Week respectively. I then dropped the 'Holiday_Flag' variable. This will help make the data more readable and easier to understand for data visualizations.

```
# Create new column Holiday_Week to convert Holiday_Flag variable from integer to object, then drop Holiday_Flag
walmart_data['Holiday_Week'] = ''

def applyHoliday(h):
  if h == 1:
    return 'Holiday Week'
  else:
    return 'Not Holiday Week'

walmart_data['Holiday_Week'] = walmart_data['Holiday_Flag'].apply(applyHoliday)

walmart_data = walmart_data.drop('Holiday_Flag', axis=1)
```

I then exported the cleaned data to a CSV file. The data is now ready for import into a SQL database.

```
# Export cleaned data to CSV
walmart_data.to_csv('Walmart_Clean.csv', index=False)
```


