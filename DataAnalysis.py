##Import Packages##
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import datetime as dt

## Read in csv file ##
pcrime = pd.read_csv(pcrime.csv")
pcrime.head(10)

## Confirm entire file was imported and data types match ##
pcrime.info()

## Offense count per hour visualization ##
plt.figure(figsize=(10, 6))
sns.histplot(pcrime['hour'], bins=24, kde=True)
plt.title('Hourly Distribution of Offenses')
plt.xlabel('Hour')
plt.ylabel('Count')
plt.show()

## Offense count per day visualization ##
plt.figure(figsize=(10, 6))
sns.countplot(data=pcrime, x='day_of_week')
plt.title('Day of the Week Distribution of Offenses')
plt.xlabel('Day of the Week')
plt.ylabel('Count')
plt.show()

## Offense count per month visualization ##
plt.figure(figsize=(10, 6))
sns.countplot(data=pcrime,x='month_num')
plt.title('Monthly Distribution of Offenses')
plt.xlabel('Month')
plt.ylabel('Count')
plt.show()

## Offense count per Offense Category visualization ##
plt.figure(figsize=(10, 6))
sns.countplot(data=pcrime,x='OffenseCategory')
plt.title('Distribution of Offenses')
plt.xlabel('Offense Category')
plt.ylabel('Count')
plt.xticks(rotation=90)
plt.show()

## Offense count per Offense Type visualization ##
plt.figure(figsize=(10, 6))
sns.countplot(data=pcrime,x='OffenseType')
plt.title('Distribution of Offense Types')
plt.xlabel('Offense Type')
plt.ylabel('Count')
plt.xticks(rotation=90)
plt.show()

## Total offenses per CrimeAgainst per year##
pcrime_against = pcrime.groupby(['year','CrimeAgainst'])['OffenseCount'].sum().reset_index()
pcrime_against

## Total offense count per day of week per year ##
pcrime_day = pcrime.groupby(['year','day_num'])['OffenseCount'].sum().reset_index()
pcrime_day.head(50)

## Total Offenses per month per year ##
pcrime_month = pcrime.groupby(['year','month_num'])['OffenseCount'].sum().reset_index()
pcrime_month.head(20)

## Total Offenses per Hour ##
pcrime_hour = pcrime.groupby(['year','hour'])['OffenseCount'].sum().reset_index()
pcrime_hour.head(20)

## Total Offenses per Type ##
pcrime_type = pcrime.groupby(['year','OffenseType'])['OffenseCount'].sum().reset_index()
pcrime_type.head(20)

## Total Offenses per category ##
pcrime_category = pcrime.groupby(['year','OffenseCategory'])['OffenseCount'].sum().reset_index()
pcrime_category.head(20)

## Total Offenses per year ##
pcrime_year = pcrime.groupby('year')['OffenseCount'].sum().reset_index()
pcrime_year.head(20)

## Total Offenses per Neighborhood ##
pcrime_map = pcrime.groupby(['year','Neighborhood','OpenDataLat','OpenDataLon'])['OffenseCount'].sum().reset_index()
pcrime_map.head(20)

## Calculate the percentage increase since 2016 ##
data_2016 = pcrime[pcrime['year'] == 2016]['OffenseCount'].sum()
data_2022 = pcrime[pcrime['year'] == 2022]['OffenseCount'].sum()

percentage_increase = ((data_2022 - data_2016) / data_2016) * 100

print(f'Percentage Increase from 2016 to 2022: {percentage_increase:.2f}%')

## Export subsets to csv ##
pcrime_against.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_against.csv",index=False)
pcrime_day.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_day.csv",index=False)
pcrime_month.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_month.csv",index=False)
pcrime_hour.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_hour.csv",index=False)
pcrime_type.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_type.csv",index=False)
pcrime_category.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_category.csv",index=False)
pcrime_year.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_year.csv",index=False)
pcrime_map.to_csv("C:/Users/Tucker/Desktop/Python/pcrime_map.csv",index=False)
