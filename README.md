# Health Facility Performance Index (HFPI) Project

## Overview

The Health Facility Performance Index (HFPI) is an innovative composite index designed to assess the performance of health facilities within the 47 counties of Kenya for the fiscal year 2018/2019. The HFPI integrates a comprehensive analysis framework, consisting of three primary domains: ‘General Service Availability,’ ‘General Service Readiness,’ and ‘Management and Finance Support Systems.’ These domains are further divided into sub-domains and are ultimately based on a detailed set of 196 indicators, providing a holistic view of health facility operations across the nation.

## Objectives

* Assessment of Health Facilities: To offer a quantitative evaluation tool that measures the performance of health facilities across various essential dimensions.
* Policy Decision Making: To aid policymakers and health administrators in identifying areas of improvement and allocating resources more effectively.
* Enhancement of Health Services: To contribute towards the enhancement of health service delivery by pinpointing performance gaps and successes.

## Methodology

he construction of the HFPI involved a multi-method approach combining advanced analytical techniques to ensure accuracy, reliability, and comprehensiveness:

### 1. Principal Component Analysis

PCA was used as the first approach to create the index. The first component was used to create it. Due to the nature of PCA it fell short in capturing other variables as it gives the most weight to the first component with the highest variability

### 2. Fuzzy Logic

A Composite Fuzzy Indicator was created to deal with uncertainties and provide a more nuanced analysis by considering the degree to which an indicator influences health facility performance.

### 3. COINr Package in R

The final construction of the HFPI utilized the COINr package, an R package developed by the European Commission's Competence Centre for Composite Indicators and Scoreboards. COINr stands out for its comprehensive suite of functions that support the creation, analysis, auditing, and visualization of composite indicators. This choice was motivated by COINr’s flexibility, its capability to handle an unlimited number of indicators and aggregation levels, and its integrated environment for developing composite indicators.

## Dashboard Development

To make the insights accessible to policymakers, health administrators, and the public, a dynamic dashboard was developed using Power BI. This dashboard visualizes the HFPI results, allowing users to interact with the data, compare performance across counties, and drill down into specific domains and indicators for a more detailed view.

## Acknowledgements

Sincere gratitude to the Kenya Health Facility Assessment (KHFA) for the comprehensive report which served as the primary source of data for the Health Facility Performance Index (HFPI) project. The data extracted from the KHFA report was instrumental in providing a detailed understanding of the health facility performance across the 47 counties of Kenya, forming the backbone of the analysis and insights.
