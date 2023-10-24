# Portland Crime Analysis
Analysis of crime rates in the different neighborhoods of Portland, Oregon from 2016-2022

## Introduction
In this data analysis project, I delve into a comprehensive exploration of crime trends in Portland, Oregon, spanning from 2016 through 2022. By leveraging my skills in Microsoft Excel, SQL, Python, and Tableau, I aim to uncover valuable insights that shed light on the evolving patterns of criminal activity within the city. Through this analysis, I aspire to provide a deeper understanding of the challenges that Portland has faced and the dynamics that have influenced its neighborhoods over the years. To do so, I will follow the data analysis process of **Ask, Prepare, Process, Analyze, Share,** and **Act**. 

## Ask

### Business Task
Conduct a comprehensive analysis of crime trends in Portland, Oregon from 2016 through 2022 to provide data-driven insights that raise awareness of evolving challenges.

### Limitations
Recognizing the intricate web of factors influencing Portland's current challenges is crucial. This analysis delves specifically into deciphering crime trends and patterns within the city, while acknowledging the need for an in-depth exploration of additional elements shaping the issue.

Such analyses include:
* **Substance Abuse**
* **Policy Changes**
* **Homelessness**
* **Housing Prices**
* **Econimic Inflation**
* **Pandemic Impact**
* **And More**


Still, my crime analysis remains committed to raising awareness, aiming to inspire action. In acknowledging the complexity of the situation, my focus on crime trends within the city is intended to contribute to a better understanding of the issue.

## Prepare

### Dataset
The dateset that I am using come from the [Portland Crime Data](https://www.kaggle.com/datasets/michaellindsay/portland-crime) on kaggle which was accessed directly from Portland Police Bureau's Open Data initiative; compiled from 2015-2023. This dataset is being used under this [license](https://creativecommons.org/publicdomain/zero/1.0/).

### Columns
**Address:** Address of reported incident at the 100 block level (e.g.: 1111 SW 2nd Ave would be 1100 Block SW 2nd Ave).

**Case Number:** The case year and number for the reported incident (YY-######).

**Crime Against:** Crime against category (Person, Property, or Society).

**Neighborhood:** Neighborhood where incident occurred. If the neighborhood name is missing, the incident occurred outside of the boundaries of the Portland neighborhoods or at a location that could not be assigned to a specific address in the system. (e.g., Portland, near Washington Park, on the streetcar, etc.).

**Occur Date:** Date the incident occurred. The exact occur date is sometimes unknown. In most situations, the first possible date the crime could have occurred is used as the occur date. (For example, victims return home from a week-long vacation to find their home burglarized. The burglary could have occurred at any point during the week. The first date of their vacation would be listed as the occur date.)

**Occur Time**: Time the incident occurred. The exact occur time is sometimes unknown. In most situations, the first possible time the crime could have occurred is used as the occur time. The time is reported in the 24-hour clock format, with the first two digits representing hour (ranges from 00 to 23) and the second two digits representing minutes (ranges from 00 to 59).

**Offense Category:** Category of offense (for example, Assault Offenses).

**Offense Type:** Type of offense (for example, Aggravated Assault).
Note: The statistic for Homicide Offenses has been updated in the Group A Crimes report to align with the 2019 FBI NIBRS definitions. The statistic for Homicide Offenses includes (09A) Murder & Non-negligent Manslaughter and (09B) Negligent Manslaughter. As of January 1, 2019, the FBI expanded the definition of negligent manslaughter to include traffic fatalities that result in an arrest for driving under the influence, distracted driving, or reckless driving. **The change in definition impacts the 2019 homicide offenses statistic and the comparability of 2019 homicide statistics to prior year.**

**Open Data Lat/Lon:** Generalized Latitude / Longitude of the reported incident. For offenses that occurred at a specific address, the point is mapped to the block's midpoint. Offenses that occurred at an intersection is mapped to the intersection centroid.

**Open Data X/Y:** Generalized XY point of the reported incident. For offenses that occurred at a specific address, the point is mapped to the block's midpoint. Offenses that occurred at an intersection is mapped to the intersection centroid. To protect the identity of victims and other privacy concerns, the points of certain case types are not released. XY points use the Oregon State Plane North (3601), NAD83 HARN, US International Feet coordinate system.

**Offense Count:** Number of offenses per incident. Offenses (i.e. this field) are summed for counting purposes.

## Process

### Data Cleaning

#### Excel
To clean my dataset in Excel I did the following:
* Checked for and removed any duplicates
* Removed unneeded columns (ReportDate, OpenDataX/Y, Index)
* Filled Missing neighborhood fields with unknown
* Converted military time to standard time and rounded up to the nearest hour
  - Formula: **(=TEXT(TIME(INT(A2/100), ROUNDUP(MOD(A2, 100)/60, 0), 0), "h AM/PM")**

I then created some pivot tables for some quick analysis to understand the data better. I looked at the number of offenses per neighborhood, and the number of offenses per offense category/type. Obviously a much more in depth analysis will come later but these pivot tables gave me an idea of what I am working with.

#### SQL
To continue the cleaning process, I jumped into BigQuery. The queries that I used can be found [here](https://github.com/tuckertrost/Portland_Crime_Analysis/blob/main/DataCleaning.sql).

To summarize the cleaning in SQL, the following was performed:
* Blank Lat/Lon cells that had a known neighborhood were filled with the average lat/lon from the given neighborhood.
* Day of week, month, and year were all extracted from OccurDate and placed in their own columns.
* Separate columns for the military hour anda day and month names were added.

The data was now clean and ready to be queried and analyzed.

## Analyze
Moving on to the Analyze phase, I decided to utilize python to perform some exploratory data analysis and determine what data would most effectivly convey the ongoing crime trends.

All python code used can be found [here](https://github.com/tuckertrost/Portland_Crime_Analysis/blob/main/DataAnalysis.py)

To summarize my exploratory analysis in python, the following was performed:
* Imported necessary packages (NumPy, Pandas, Matplotlib, Seaborn, Datetime)
* Used Seaborn and Matplotlob to create some quick visualizations of temploral, catigorical, and location trends
* Used pandas and numpy to pull subsets of data to be visualized in a tableau dashboard
* Exported all relevant subsets to csv files


Python visualization examples:

![download](https://github.com/tuckertrost/Portland_Crime_Analysis/assets/132526212/313dfec3-3a06-4928-bb95-4d29d26f7a50)
![download](https://github.com/tuckertrost/Portland_Crime_Analysis/assets/132526212/709226ef-3e77-414c-95f9-8168c4df88de)
![download](https://github.com/tuckertrost/Portland_Crime_Analysis/assets/132526212/39222ee1-95c5-4244-a628-decf8f16dfca)

I now have enough data to plug into tableau and create a cohesive dashboard.
## Share
The dashboard created for this project can be found [here](https://public.tableau.com/app/profile/tucker.trost/viz/PortlandCrimeTrendAnalysis/FinalDash)

Within the dashboard, I saught to showcase the major temporal, categorical, and location trends over the years. 

To do so, I included the following visualizations in my dashboard:
* **Total Offenses per Crime against**
* **Total Offenses per Year**
* **Total Offenses per Hour**
* **Total Offenses per Offense Type**
* **Total Offenses per Neighborhood**
* **Neighborhood Offense hotspot map**

Here is a look at the dashboard I created:

<img width="646" alt="Pcrimedash" src="https://github.com/tuckertrost/Portland_Crime_Analysis/assets/132526212/81527796-3440-40fb-a56c-125e20990407">

### Key findings
#### Temporal Trends
* Crime increased by 24% from 2016 to 2022, with a sharp rise in 2020.
* Crime is lowest from 1 am to 6 am, increases steadily, has a spike at noon, and remains high throughout the afternoon and night, peaking at midnight.
* No significant variation in crime by month, with slightly lower numbers in late winter and early spring.
* Crime is highest on Mondays and gradually declines through the week.
* No significant variance by year across hours, months, and days.

#### Categorical Trends
* Theft from motor vehicles was the top offense overall, but vandalism took the lead from 2020 to 2022
* Other top offenses include motor vehicle theft, simple assault, and burglary.
* Crime against property consistently surpasses crime against person and society.
* Larceny offenses significantly outnumber other offense categories.

#### Location Trends
* In 2016, Hazelwood led in offenses, with Downtown close behind. After 2016, Downtown surpassed Hazelwood
* There are two clusters of high-offense neighborhoods: one around Downtown and another in East Portland surrounding Hazelwood.

## Act
By closely examining the shifting crime trends in Portland, Oregon, this analysis aims to offer a clearer perspective on the city's safety landscape. To equip both residents and potential visitors with practical guidance, a set of recommendations is presented below.

**Be Aware of Peak Crime Hours:** When exploring the city, be extra cautious during the late afternoon and evening, as these are the peak hours for criminal activity. Stay in well-lit areas and avoid walking alone late at night.

**Lock Your Vehicle:** If you're driving in Portland, make sure to lock your vehicle and avoid leaving valuable items in plain sight. Motor vehicle theft is one of the top offenses, so take precautions to protect your vehicle.

**Vandalism Awareness:** Be mindful of your surroundings and report any acts of vandalism you may come across. If you witness suspicious activity, report it to the authorities or local security.

**Explore Safely:** While Downtown and certain East Portland neighborhoods have higher offense counts, this doesn't mean you shouldn't explore these areas. Use common sense, stay aware of your surroundings, and take necessary safety measures.

**Plan Your Visit:** To stay safe, plan your visit during the daytime and use well-traveled routes when exploring. Be cautious in areas with higher reported offenses and avoid walking alone at night in less crowded areas.

**Engage with Locals:** Interact with the local community, shop owners, and residents. They can provide valuable insights into safe areas, great places to visit, and precautions to take.

**Stay Informed:** Stay informed about local news and any safety advisories that may be in effect during your visit. Local authorities may issue safety recommendations, especially if there are significant events or gatherings in the city.

Thank you!
