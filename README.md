# Nakshatra One

This repository contains a basic project structure for an astrology application.
It includes a Java backend built with Maven and a placeholder Angular frontend.

## Backend (Maven)
* **Location**: `backend/`
* Run tests with `mvn test`

## Frontend (Angular)
* **Location**: `frontend/`
* Intended to be generated with the Angular CLI. The current structure is a minimal placeholder.

## Remote Setup
This repository does not include a Git remote by default. To add one, run:

```bash
git remote add origin <your-repository-url>
```

## Continuous Integration
GitHub Actions workflows are provided in `.github/workflows` to run tests,
perform SonarQube and CodeQL analysis, and build a Docker image on every push
or pull request.

## Docker
The repository includes a simple `Dockerfile` that packages the backend. Build
the image using:

```bash
docker build -t astrology-backend .
```
