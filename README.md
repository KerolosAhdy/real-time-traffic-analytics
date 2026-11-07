# Real-Time Traffic Analytics

## Project Overview

This project focuses on building a data engineering pipeline for traffic analytics using real-world traffic and weather data from Finland's Digitraffic (Fintraffic) open data platform.

The objective is to transform raw transportation data into structured, reliable, and analytics-ready datasets that support traffic monitoring and future analytical applications.

## Technologies Used

- **Python** – Data extraction and preprocessing
- **PostgreSQL** – Data storage
- **dbt (Data Build Tool)** – Data transformation, modeling, and testing
- **SQL** – Data transformation and validation
- **Git & GitHub** – Version control
- **Azure Stream Analytics** – Planned real-time processing

## Data Sources

The project works with several datasets:

- Traffic measurement data (TMS)
- Traffic stations and sensor metadata
- Weather observations
- Weather forecasts
- Road section information
- Road maintenance activities
- Variable traffic signs
- Traffic messages and locations

**Data Provider:** [Digitraffic – Fintraffic](https://www.digitraffic.fi/)

## Data Transformation Architecture

The dbt project follows a layered transformation architecture:

### 1. Staging Layer

Prepares raw source data through:

- Column standardization
- Data type conversion
- Duplicate handling
- Initial data cleaning

### 2. Intermediate Layer

Performs business-oriented transformations, including:

- Enriching traffic measurements with station and sensor metadata
- Cleaning weather observations
- Enriching weather forecasts with road section information
- Combining maintenance routes with task descriptions
- Enriching traffic messages with location types

### 3. Marts Layer

Contains analytics-ready models:

- `fct_traffic_measurements`
- `dim_tms_sensors`
- `dim_tms_stations`

## Data Quality

Data quality is validated using dbt tests, including:

- Not-null tests
- Unique tests
- Relationship tests
- Custom SQL tests

The latest full dbt build completed successfully with all configured tests passing.

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

## Current Progress

- [x] Data extraction and initial preparation
- [x] PostgreSQL setup
- [x] dbt project initialization
- [x] Staging models
- [x] Intermediate models
- [x] Initial traffic data marts
- [x] Data quality tests
- [ ] Weather and traffic integration
- [ ] Additional analytical marts
- [ ] Azure Stream Analytics integration
- [ ] Final analytics and visualization

## Future Improvements

- Integrating weather observations with traffic measurements.
- Building additional analytical models.
- Extending the pipeline toward real-time processing using Azure services.
- Developing traffic analytics dashboards.

## Author

Data Engineering Graduation Project