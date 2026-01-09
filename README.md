# Navi

**Navi** is a Kotlin-based platform that helps users plan, organize, and share trips collaboratively.  
Users can create detailed itineraries, manage events, vote on plans, and receive intelligent suggestions for nearby activities and travel optimizations (not available atm).

# Installation

KMP allows Navi to work on multiple platforms, the currently working one with Map feature is the JS Target.

Here are the steps to run the complete app:

### Requirements

- MapBox API key in KotlinProject/.env
- Any LLM API key in python-ai-service/.env (this fork ain't got one)

[dockerization in progress]
- Have Docker installed.
- Have Python and venv installed (not needed atm)
- Java 21.
- Ability to run 4 apps at once.

### TODO
  docker-compose.yml should run all containers:
- PostgreSQL (need to secure credentials)
- Python AI server (done)
- KMP app (including Ktor backend, JS target run)


### 1. Run Ktor Backend
  - On macOS/Linux
    ```shell
    # under KotlinProject/
    ./gradlew :server:run
    ```

### 3. Build and Run JS Target
  - on macOS/Linux
    ```shell
    # under KotlinProject/
    ./gradlew :composeApp:jsBrowserDevelopmentRun
    ```