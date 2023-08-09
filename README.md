# Portland Crime Analysis
Analysis of crime rates in the different neighborhoods of Portland, Oregon from 2015-2023

## Introduction
In this data analysis project, I delve into a comprehensive exploration of crime trends in Portland, Oregon, spanning from 2015 to 2023. By leveraging my skills in Microsoft Excel, SQL, and Tableau, I aim to uncover valuable insights that shed light on the evolving patterns of criminal activity within the city. Through this analysis, I aspire to provide a deeper understanding of the challenges that Portland has faced and the dynamics that have influenced its neighborhoods over the years. To do so, I will follow the data analysis process of **Ask, Prepare, Process, Analyze, Share,** and **Act**. 

## Ask

### Business Task
Conduct a comprehensive analysis of crime trends in Portland, Oregon from 2015 to 2023 to provide data-driven insights that raise awareness of evolving challenges and empower law enforcement and policy makers with actionable information for informed decision-making in regards to public safety.

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


Still, my crime analysis remains committed to raising awareness, aiming to inspire action. In acknowledging the complexity of the situation, my focus on crime trends within the city is intended to contribute to a better understanding of the issue while igniting proactive responses.

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
