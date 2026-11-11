# Real-Time Traffic Analytics

## Project Overview

This project is a data engineering graduation project that builds a structured traffic analytics pipeline using real-world transportation and weather data from Finland's Digitraffic (Fintraffic) open data platform.

The main objective is to extract, store, clean, transform, and organize raw traffic and weather data into reliable, analytics-ready datasets that can support traffic monitoring and future analytical applications.

The current implementation uses Python, PostgreSQL, and dbt to build a layered data transformation pipeline. Real-time stream processing using Azure Stream Analytics is planned as a future enhancement.

## Project Objectives

- Build a data pipeline using real-world transportation data.
- Integrate traffic, weather, and road maintenance datasets.
- Transform raw data into structured analytical models.
- Implement data quality checks and validation.
- Prepare analytics-ready datasets for future reporting and visualization.

## Technologies Used

- **Python** – Data extraction and preprocessing.
- **PostgreSQL** – Relational database and data storage.
- **dbt (Data Build Tool)** – Data transformation, modeling, and testing.
- **SQL** – Data cleaning, transformation, and validation.
- **Git & GitHub** – Version control and project management.
- **Azure Stream Analytics** – Planned future real-time processing integration.

## Data Sources

The project uses several datasets from Finland's Digitraffic / Fintraffic open data platform:

- Traffic Measurement System (TMS) measurements.
- Traffic stations and sensor metadata.
- Weather observations.
- Weather forecasts.
- Weather station metadata.
- Road section information.
- Road maintenance routes and activities.
- Variable traffic signs.
- Traffic message locations.

**Data Provider:** [Digitraffic – Fintraffic](https://www.digitraffic.fi/)

## Data Transformation Architecture

The dbt project follows a three-layer transformation architecture.

### 1. Staging Layer

The staging layer prepares raw source data for further processing through:

- Column standardization.
- Data type conversion.
- Initial data cleaning.
- Source-level validation.
- Duplicate handling where required.

### 2. Intermediate Layer

The intermediate layer performs more advanced transformations and combines related datasets.

Key transformations include:

- Enriching traffic measurements with TMS station and sensor metadata.
- Cleaning and standardizing weather observations.
- Enriching weather forecasts with road section information.
- Identifying the nearest operational weather station for each TMS station.
- Combining road maintenance routes with maintenance task descriptions.
- Cleaning variable traffic sign data.
- Enriching traffic message locations with location classifications.
- Preparing station coordinates for geographical analysis.

### 3. Marts Layer

The marts layer contains analytics-ready fact, dimension, and analytical models.

**Traffic Measurement Marts**
- `fct_traffic_measurements`
- `dim_tms_sensors`
- `dim_tms_stations`

**Weather Marts**
- `mart_weather_data`
- `mart_weather_station_coverage`
- `mart_weather_forecast`

**Maintenance Marts**
- `mart_maintenance_routes`
- `mart_tms_maintenance`

**Traffic Information Marts**
- `mart_variable_signs`
- `mart_traffic_messages`

These models provide structured datasets for traffic analysis, weather monitoring, road maintenance analysis, and geographical coverage assessment.

## Data Quality and Testing

Data quality is validated using dbt data tests, including:

- Not-null tests.
- Unique tests.
- Accepted-values tests.
- Relationship tests.
- Custom SQL tests for business and data quality rules.

The project has successfully completed its full dbt validation:

| Validation | Result |
|---|---:|
| Total dbt Models | 31 |
| Successful Models | 31 |
| Total Data Tests | 114 |
| Passing Tests | 114 |
| Warnings | 0 |
| Errors | 0 |

**Latest validation status: All 31 models built successfully and all 114 data tests passed.**

## Project Structure

```text
traffic_analytics/
│
├── analyses/
├── macros/
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
│
├── seeds/
├── snapshots/
├── tests/
│
├── dbt_project.yml
├── README.md
└── .gitignore
```

## Current Project Status

- [x] Data extraction and initial preparation.
- [x] PostgreSQL database setup.
- [x] dbt project initialization and configuration.
- [x] Staging models development.
- [x] Intermediate models development.
- [x] Traffic measurement fact and dimension models.
- [x] Weather observation and forecast marts.
- [x] Weather station geographical coverage analysis.
- [x] Road maintenance analytical marts.
- [x] Variable traffic signs mart.
- [x] Traffic message locations mart.
- [x] Data quality testing and validation.
- [x] dbt documentation generation.
- [x] Final model and test validation.

## Running the Project

### Prerequisites

- Python 3.12
- PostgreSQL
- dbt Core
- dbt-postgres adapter

### Setup

1. Clone the repository:

```bash
git clone https://github.com/KerolosAhdy/real-time-traffic-analytics.git
cd real-time-traffic-analytics
```

2. Create and activate a Python virtual environment.

3. Install the required dbt packages:

```bash
pip install dbt-core dbt-postgres
```

4. Configure the PostgreSQL connection in your dbt profile (`profiles.yml`).

5. Run the dbt models:

```bash
dbt run
```

6. Execute data quality tests:

```bash
dbt test
```

7. Generate dbt documentation:

```bash
dbt docs generate
```

8. Serve the documentation locally:

```bash
dbt docs serve
```

**Note:** PostgreSQL connection credentials and local environment configuration should be maintained outside the public repository.

## Future Improvements

- Integrating weather observations with traffic measurements for deeper analytical insights.
- Developing additional traffic performance and road condition indicators.
- Integrating Azure Stream Analytics for real-time data processing.
- Developing interactive dashboards using Power BI or other visualization tools.
- Expanding the pipeline with additional historical and real-time datasets.

## Author

**Data Engineering Graduation Project**

**GitHub Repository:**  
https://github.com/KerolosAhdy/real-time-traffic-analytics

