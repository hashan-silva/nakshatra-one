# Nakshatra One

[![CodeQL](https://github.com/hashan-silva/nakshatra-one/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/hashan-silva/nakshatra-one/actions/workflows/github-code-scanning/codeql)

[![SonarCloud analysis](https://github.com/hashan-silva/nakshatra-one/actions/workflows/sonarcloud.yml/badge.svg)](https://github.com/hashan-silva/nakshatra-one/actions/workflows/sonarcloud.yml)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=hashan-silva_nakshatra-one&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=hashan-silva_nakshatra-one)

This repository contains a basic project structure for an astrology application.
It includes a Java backend built with Maven and a placeholder Angular frontend.

## Contributing

This project has specific guidelines for contributions. Please review the following files before getting started:

- **`AGENTS.md`**: Provides a detailed overview of the project's architecture, technologies, and coding conventions for human developers.
- **`GEMINI.md`**: Contains instructions tailored for the Gemini AI assistant, ensuring that its contributions align with the project's standards.

All contributors, including AI, are expected to follow the workflow of understanding the context and planning before implementing changes.

## Backend (Maven)
* **Location**: `backend/`
* Run tests with `mvn test`

## Frontend (Angular)
* **Location**: `frontend/`
* Intended to be generated with the Angular CLI. The current structure is a minimal placeholder.

## Docker

This project uses Docker to containerize the frontend and backend applications.
The Docker images are automatically built and pushed to Docker Hub by a GitHub workflow.

To enable this workflow, you need to add the following secrets to your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username.
- `DOCKERHUB_TOKEN`: Your Docker Hub access token.

The workflow will then push the images to:
-   **Backend Image:** `<your-dockerhub-username>/nakshatra-one-backend`
-   **Frontend Image:** `<your-dockerhub-username>/nakshatra-one-frontend`

The workflow is defined in `.github/workflows/docker-publish.yml`.
