# Navi-

**Navi** is a Kotlin-based platform that helps users plan, organize, and share trips collaboratively.  
Users can create detailed itineraries, manage events, vote on plans, and receive intelligent suggestions for nearby activities and travel optimizations (not available atm).

# Demo Video
A demo video (~55 MB) is available under the pre-release "Demo Video": https://github.com/fishonttree/Navi-/releases/tag/demo-video

# Installation

KMP is meant to allow Navi to work on multiple platforms. The currently working one with Map feature is the JS Target.

Here are the steps to run the complete app:

## Requirements
- Install Docker
- Install Java 21
- MapBox API key in KotlinProject/.env
- Any LLM API key in python-ai-service/.env (not needed; service has been suspended temporarily)
- Ability to run 4 apps at once

# How to run

##  0.  Containerize Postgres image, clear previous DB state & insert mock data
  - On macOS/Linux
    ```shell
    # under KotlinProject
    ./server/src/main/resources/db_create-tables/migration_script.sh
    ```

##  1.  Run Ktor backend
  - On macOS/Linux
    ```shell
    # under KotlinProject/
    ./gradlew :server:run
    ```

## 2. Build and Run JS Target
  - on macOS/Linux
    ```shell
    # under KotlinProject/
    ./gradlew :composeApp:jsBrowserDevelopmentRun
    ```
