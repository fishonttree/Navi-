# Navi

**Navi** is a Kotlin-based platform that helps users plan, organize, and share trips collaboratively.  
Users can create detailed itineraries, manage events, vote on plans, and receive intelligent suggestions for nearby activities and travel optimizations.

# Installation

KMP allows Navi to work on multiple platforms, the currently working one with Map feature is the JS Target.

Here are the steps to run the complete app:

### 0.Requirements

- MapBox API key in KotlinProject/.env (see KotlinProject/ENV_SETUP.md)
- Any LLM API key in python-ai-service/.env (details below)

[dockerization in progress]
- Have Docker installed.
- Have Python and venv installed.
- Java 21.
- Ability to run 4 apps at once.

### 1. Run PostgreSQL in Docker 
  - On macOS/Linux
    ```shell
    # under KotlinProject/
    docker compose up -d
    ```

### 2. Run Ktor Backend
  - On macOS/Linux
    ```shell
    # under KotlinProject/
    ./gradlew :server:run
    ```

### 3. Run Python Server

    1. The API key can be generated from any LLM's website (paid / free depending on the LLM)
      - e.g Anthropic, OpenAI, Ollama, Google
    2. Any LLM API key can be used so long as it's working
    3. Insert your API key in the .env file of the python-ai-service directory, give it a name and store it
    4. To run: it should be loaded inside ai_service.py file
      - load_dotenv() : loads the .env file and using os.getenv(API_Name) will load it
      - api_key = os.getenv("ANTHROPIC_API_KEY")
          
  Next Steps :
    
  - On macOS/Linux
    ```shell
    # under python-ai-service/
    python3 -m venv venv
    pip install -r requirements.txt
    source .venv/bin/activate
    python3 ai_service.py
    ```
    
### 4. Build and Run JS Target
  - on macOS/Linux
    ```shell
    # under KotlinProject/
    ./gradlew :composeApp:jsBrowserDevelopmentRun
    ```
