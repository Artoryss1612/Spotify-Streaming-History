# 🎧 Spotify Streaming History: Listening Behavior & Usage Pattern Analysis (12/2023 - 05/2024)
- Author: Đặng Lê Nguyên **(Data Analyst)**
- Date: 12/2025
- Tool Used: **Python**, **Power Bi**, **SQL**
  - `Python`: Pandas, Numpy, Datetime
  - `Power Bi`: Dax, calculated columns, data visualization, data modeling, ETL
  - `SQL`: CTEs, Joins, Case, aggregate functions

# ReadMe - Table Of Contents (TOCS)
1. [Executive Summary]()
2. [Background & Objectives]()
3. [Dataset Description]()
4. [Data Processing & Metric Definations (Dax)]()
5. [Defining Key Questions before Data Visualization]()
6. [Key Insights & Visualization]()
7. [Recommendations]()

# 🚀 Executive Summary 
- This project analyzes personal Spotify streaming history data to understand long-term listening behavior, platform usage, and music consumption patterns.

- The dataset spans multiple years and includes detailed playback-level information such as:

- Track, artist, and album metadata

- Playback duration

- Platform used (e.g., Web Player)

- User interaction signals (skipped, shuffle, reason for start/end)

- The analysis demonstrates how raw streaming logs can be transformed into actionable insights using Python for data cleaning and SQL for analytical querying.

# 📌Background & Objectives
## Background: 
- Spotify provides detailed streaming history logs that capture how users interact with music over time.

- These raw logs are not analysis-ready and require cleaning, structuring, and querying to extract insights.

## Four Requirements from the Manager:
1. Which artist did they listen to the most this year? Is it the same as last year?

2. Which songs have they played the most? How often do they skip them?

3. What time of day do they typically listen to music?

4. How often do they explore new artists versus replaying favorites?

## 🕵🏼‍♂️Who is this project for ?
- The Marketing/ Product Manager
- The User
- The Data Analyst

# 📂Dataset Description
## 📌Data Source:
- Source:
    - [Maven Anlytics](https://mavenanalytics.io/data-playground/spotify-streaming-history)
- Size: The **Spotify_Streaming_history** table contains **149.860** records with **11** fields
- Format: CSV

# Data Processing by Python & SQL

1. Using Python to:
> - **Data Cleaning**: check data quality, handle null values, convert data types, detect anomalies, recreate columns and update values.

2. Using SQL to:
> - Aggregate total listening time

> - Rank most-played tracks and artists

> - Analyze skipping behavior

> - Group listening activity by platform

> - Explore playback patterns over time
 


# 🗯️Defining Key Questions before Data Visualization
## Step 1 & Step 2
<img width="1218" height="682" alt="image" src="https://github.com/Artoryss1612/Spotify-Streaming-History/blob/328552b819dc6851d9f8047ce43a00a5d63bcf81/keys%20spotify.pdf" />


# 📊Key Insights & Visualizations
## I. Overview
![imagealt](https://github.com/Artoryss1612/Spotify-Streaming-History/blob/328552b819dc6851d9f8047ce43a00a5d63bcf81/page1.pdf)

<img width="1300" height="730" alt="Page 2" src="https://github.com/Artoryss1612/Spotify-Streaming-History/blob/328552b819dc6851d9f8047ce43a00a5d63bcf81/page2.pdf" />


## 🔑 Key Takeaways from the Spotify Streaming History Dataset

### **Dataset Overview**

* **Total playback events**: **148,660**
* **Total listening time**:

  * **317,324 minutes**
  * **≈ 5,289 hours** of music consumption
* This represents **long-term, sustained usage**, suitable for behavioral analysis rather than short-term trend sampling.

---

## 1️⃣ Listening Volume & Engagement

* Average listening per track:

  * **≈ 2.13 minutes per playback**
* This indicates that:

  * Most tracks are listened to **beyond previews**
  * The dataset reflects **intentional listening**, not passive sampling

---

## 2️⃣ Skipping Behavior

* **Skip rate**: **4.41%**

  * Meaning **95.59% of tracks are not skipped**
* This is **exceptionally low** for streaming platforms and suggests:

  * Strong user–content alignment
  * High playlist or artist familiarity
  * Low friction in music discovery behavior

➡️ **Key Insight**:
The user demonstrates **high engagement and commitment**, with skips being the exception rather than the norm.

---

## 3️⃣ Top Artists by Total Listening Time (minutes)

| Rank | Artist         | Minutes Played |
| ---: | -------------- | -------------: |
|    1 | The Beatles    |   **19,987.8** |
|    2 | The Killers    |   **17,206.0** |
|    3 | John Mayer     |   **11,864.3** |
|    4 | Bob Dylan      |    **9,374.5** |
|    5 | Paul McCartney |    **5,914.1** |

* The **top artist alone accounts for ~6.3% of all listening time**
* Strong preference for:

  * Rock
  * Singer-songwriter
  * Classic and alternative genres

➡️ **Key Insight**:
Listening behavior is **artist-centric**, with repeat consumption dominating total playtime.

---

## 4️⃣ Most-Played Tracks (by Total Minutes)

| Rank | Track                         | Minutes Played |
| ---: | ----------------------------- | -------------: |
|    1 | *Ode To The Mets*             |    **1,100.4** |
|    2 | *The Return of the King*      |    **1,073.4** |
|    3 | *The Fellowship Reunited*     |      **745.9** |
|    4 | *19 Días y 500 Noches (Live)* |      **706.3** |
|    5 | *In the Blood*                |      **636.4** |

* Top tracks are **long-form compositions**, not short singles
* Indicates preference for:

  * Albums
  * Soundtracks
  * Narrative or immersive music

➡️ **Key Insight**:
The user favors **deep listening experiences** rather than high-rotation chart tracks.

---

## 5️⃣ Platform Usage Distribution (% of Plays)

| Platform       |    Usage % |
| -------------- | ---------: |
| **Android**    | **93.88%** |
| iOS            |      2.05% |
| Cast to device |      2.02% |
| Windows        |      1.14% |
| Mac            |      0.79% |
| Web Player     |      0.12% |

* Mobile usage is **overwhelmingly dominant**
* Desktop and web usage are **negligible**

➡️ **Key Insight**:
Listening behavior is **mobile-first**, likely tied to commuting, travel, or daily routines.

---

## 6️⃣ Overall Behavioral Profile (Requirement Synthesis)

Based on quantitative evidence:

* ✅ **High engagement** (low skip rate, long average listens)
* ✅ **Strong artist loyalty** (top artists dominate listening time)
* ✅ **Album-oriented consumption** (long tracks, soundtrack usage)
* ✅ **Mobile-centric usage** (94% Android)
* ✅ **Intentional listening**, not algorithm-driven passive play

---

## 📌 Final Conclusion

> The Spotify Streaming History dataset reveals a **highly engaged, preference-driven listening profile**, characterized by deep artist loyalty, minimal skipping, long-form content consumption, and near-exclusive mobile usage.
> This makes the dataset well-suited for **behavioral analytics, personalization modeling, and time-based listening analysis**.


## V. Action Strategies
<img width="1299" height="727" alt="Page 5" src="https://github.com/user-attachments/assets/3bef2867-e097-46b0-ad05-ce317a7d4b47" />



# 💡Recommendations






| **Who**     | **Strategy**                                           | **Insight**                                                                                                                                                                                                                                                                                                                                                             | **Recommendation**                                                                                                                                                                                                                                                                                                                                                                      |
| ----------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Manager**  | **1.🎯 Suggest the Right Music at the Right Time (Contextual Relevance)** | 🔹 94% of listening occurs on Android, implying mobile and situational usage. <br><br> 🔹 Presence of long soundtrack tracks and extended plays indicates: Focused listening moments, Emotional or immersive sessions. | 💡 Shift from static recommendations to context-aware suggestion windows.|
| **Manager** | **2. Ensure High-Frequency Artists Build Long-Term Emotional Connections** |🔹 Top artists (e.g., The Beatles, The Killers, John Mayer) account for a disproportionate share of total listening time. Repeated listens across years suggest emotional attachment, not trend-based behavior | 💡Measure emotional connection, not just consumption. Long-Term Connection Indicators: Artist listened to consistently across time (not in bursts), Low skip rate across the artist’s catalog, Multiple tracks from the same album played fully, Continued listening despite reduced algorithmic promotion, Artists meeting these criteria should be treated as “core emotional anchors” for the user. |
| **Product Team** | **3. Minimize Frustration: Ensure High-Frequency ≠ Low-Enjoyment** | 🔹 Skip rate is only 4.41%, indicating generally strong content relevance. However, frequency alone does not guarantee enjoyment—some tracks may be replayed due to: Algorithmic resurfacing, Playlist inertia, Passive listening contexts | 💡 Redefine “high-enjoyment songs” using multi-signal validation, not play count alone. Combine: Low skip probability, High average minutes played per listen, Repeat listens across different days, Completion via reason_end = trackdone |
