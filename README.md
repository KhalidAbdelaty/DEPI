# End-to-End Uber Analytics Data Engineering Project

This project represents the culmination of my training in the Microsoft Data Engineer Track at DEBI.  It encompasses a complete data engineering pipeline, from extraction to loading, transformation, model building, and visualization, all within the Azure cloud environment.  The goal of this project is to build a robust and scalable analytics platform for Uber trip data, enabling deeper insights into trip patterns, fare prediction, and ultimately, better business decisions.

## Datamodel

![data_model.jpeg](Images/data_model.jpeg)


## Project Story

This project involved the following steps:

1. **Data Acquisition:** The raw dataset, `uber_data.csv`, was sourced from a public GitHub repository.

2. **Initial Database Creation:**  An initial database, `UberTripsDB`, was created. The downloaded `uber_data.csv` file was imported into this database using a flat file import process. This database served as a staging area for the raw data.

3. **Data Extraction using Azure Data Factory (ADF):** ADF was configured to extract the `uber_data.csv` file directly from the GitHub HTTP source.

   ![Extract In ADF.png](https://github.com/KhalidAbdelaty/DEPI/blob/main/Images/Extract%20In%20ADF.png)

4. **Data Storage in Azure Blob Storage:** The extracted CSV file was stored in an Azure Storage Account within a container designated for raw data (`RawData`).

![2.Storage Account (RawData).png](https://github.com/KhalidAbdelaty/DEPI/blob/main/Images/2.Storage%20Account%20(RawData).png)

5. **Data Transformation using Azure Databricks:**  The raw data was then transformed within an Azure Databricks notebook. This involved data cleaning, feature engineering, and outlier handling. The transformed data was saved as CSV files in a separate Azure Storage Account container named `TransformedData`.  The transformation process is detailed in the `Transformation.ipynb` notebook.

![3.Storage Account (TransformedData).png](https://github.com/KhalidAbdelaty/DEPI/blob/main/Images/3.Storage%20Account%20(TransformedData).png)

6. **Data Warehouse (DWH) Creation in Azure Synapse Analytics:**  A dedicated data warehouse was created in Azure Synapse Analytics.  The star schema design for this DWH is visualized in the Datamodel section below.

   ![Azure Synapse.png](https://github.com/KhalidAbdelaty/DEPI/blob/main/Images/Azure%20Synapse%20DWH.png)
   ![Azure Synapse DWH.png](https://github.com/KhalidAbdelaty/DEPI/blob/main/Images/Azure%20Synapse%20.png)


7. **Data Loading into Azure Synapse Analytics:**  The transformed data from the `TransformedData` container was loaded into the Azure Synapse DWH tables, including a key analytics table named `UberTable_Analytics`.  This table serves as the foundation for the dashboard.

8. **Data Inspection in SQL Server Management Studio (SSMS):** The DWH was connected to SSMS to perform detailed data validation and inspection.  A backup of the DWH is available as `UberTripsDWH.bak`.

9. **Machine Learning Model Development:**  A machine learning model was developed to predict Uber fares based on various features. The model development process, including data preprocessing, feature engineering, model selection, training, evaluation, and hyperparameter tuning, is documented in the `UberML.ipynb` notebook.  XGBoost was ultimately chosen as the best performing model, achieving an R-squared score of 0.84. The trained model was saved as `uber_fare_prediction_model_improved.joblib`.

10. **Dashboard Creation:** Finally, a Power BI dashboard ([Uber Dashboard.pbix](Dashboard/Uber Dashboard.pbix)) was created based on the `UberTable_Analytics` table in the DWH. This dashboard provides interactive visualizations and insights derived from the processed data.



## Machine Learning Model Details

The machine learning model for fare prediction was developed using Python with the following libraries:

* pandas
* numpy
* matplotlib
* seaborn
* scikit-learn (including StandardScaler, OneHotEncoder, ColumnTransformer, Pipeline, RandomForestRegressor, train_test_split, cross_val_score, GridSearchCV, mean_squared_error, r2_score)
* xgboost
* scipy
* joblib


The model uses features such as pickup/dropoff times and locations, passenger count, trip distance, and engineered features like rush hour, weekend, and night flags to predict the fare amount.  The model training process includes data preprocessing, outlier handling, feature selection, and hyperparameter tuning. Refer to the `UberML.ipynb` notebook for the complete code and detailed analysis.

## Conclusion

This project provided valuable experience in building and deploying a cloud-based data engineering pipeline.  Key learnings included working with Azure Data Factory, Databricks, Synapse Analytics, and Power BI.  Challenges encountered during the project included handling data quality issues and optimizing the machine learning model.  Future work could involve exploring real-time data ingestion and more advanced predictive modeling techniques.


## Acknowledgements

I would like to express my sincere gratitude to my team members for their invaluable contributions to this project. I oversaw the project review and took on the most critical role in its development.

* **Mohamed Zabady:** [GitHub Link - https://github.com/zabady9] - Handled the machine learning aspects of the project.
* **Yasser Elsayed:** [GitHub Link - https://github.com/yasserelsayed7] -  Managed the Azure Data Factory pipeline development
* **Ziad Elsayed:** [GitHub Link -  ] -  Contributed to the data transformation process in Databricks
* **Abd-Alaah Mostafa:** [GitHub Link - ] - Assisted with data warehouse design in Azure Synapse
* **Saber Elsayed:** [GitHub Link - ] -  Supported the Power BI dashboard development


Their dedication, collaboration, and insightful feedback were instrumental in the successful completion of this project. I truly appreciate their support and teamwork.
