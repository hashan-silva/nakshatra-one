## Project: NakshatraOne - Astrology Web Platform

**NakshatraOne** is a web-based astrology software built using Java (Spring Boot) for the backend and Angular for the frontend. It provides comprehensive astrological services such as Kundli generation, Panchang, Horoscope predictions, and Matchmaking.

---

# Gemini Agent Instructions

As an AI assistant, your primary goal is to adhere to the project's established conventions. Before making any code changes, it is crucial to:

1.  **Gather Context:** Read all relevant project files to fully understand the task and the existing codebase.
2.  **Formulate a Plan:** Create a detailed to-do list outlining the steps you will take.

Analyze existing code before making changes.

### Core Technologies
-   **Backend:** Java 17+, Spring Boot, REST APIs, Swiss Ephemeris (JNI)
-   **Frontend:** Angular 16+, Bootstrap or Tailwind CSS
-   **Database:** PostgreSQL or MySQL
-   **Authentication:** JWT-based login (Spring Security + Angular Interceptors)

---

### Development Guidelines

**File Organization:**

-   **Backend:**
    -   `/src/main/com/hashan0314/nakshatraone`
        -   `/controller`
        -   `/service`
        -   `/model`
        -   `/util`
        -   `/config`
-   **Frontend:**
    -   `/src/app`
        -   `/components`
        -   `/services`
        -   `/models`
        -   `/pages`
-   **Terraform:**
    -   `/terraform`
        -   `main.tf`: Main configuration file.
        -   `variables.tf`: Input variables for customization.
        -   `outputs.tf`: Output values from the deployment.

**API Conventions:**

-   Use RESTful naming conventions.
-   Authentication endpoints: `/api/auth/login`, `/api/auth/register`.
-   Secure sensitive routes using JWT.
-   All astrology data endpoints under `/api/astro/*`.

**Best Practices:**

-   Document new API endpoints using Swagger.
-   Follow the Angular style guide, creating modular features.
-   Ensure time zone accuracy in all planetary calculations.
-   Use DTOs for request/response objects.

**Code Quality and Linting:**

-   **Backend (Java/Spring Boot):** Run `mvn validate` to check for code quality issues and enforce coding standards.
-   **Frontend (Angular):** Run `ng lint` to identify and fix linting issues.
-   **Terraform:**
    -   Run `terraform validate` to check for syntax errors and configuration issues.
    -   Run `terraform fmt -check=true -diff=true` to check for formatting issues.

---

### Resource Provisioning Best Practices

-   **Free Tier Services:** Always prioritize the use of Oracle Cloud Infrastructure (OCI) Free Tier eligible services and shapes (e.g., `VM.Standard.E2.1.Micro` for compute instances) to minimize costs.
-   **Least Privilege IAM Policies:** When creating resources, ensure that IAM policies are configured with the principle of least privilege. Grant only the necessary permissions for resources to perform their intended functions.

---

### Security Vulnerability Checks

-   **Backend (Java/Spring Boot):**
    -   Integrate **OWASP Dependency-Check** to identify known vulnerabilities in project dependencies.
    -   Utilize **SonarQube** for static code analysis, focusing on security-related rules.
    -   Consider **Snyk** for continuous security monitoring of dependencies and code.
-   **Frontend (Angular):**
    -   Regularly run `npm audit` to identify and fix vulnerabilities in Node.js packages.
    -   Integrate **SonarQube** for static code analysis, including security rules.
    -   Consider **Snyk** for continuous security monitoring of dependencies and code.
-   **CI/CD Integration:** Automate security checks within the CI/CD pipeline to catch vulnerabilities early.

---

### Testing

**Backend (Java - Spring Boot):**

-   Use **JUnit 5** and **Mockito**.
-   Run tests with: `./mvnw test`

**Frontend (Angular):**

-   Use **Jasmine** and **Karma**.
-   Run tests with: `npm run test`

---

### Commit Style

Please follow this format for all Git commits:

-   `<type>(<scope>): <short description>`
-   **Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
-   **Examples:**
    -   `feat(kundli): add North Indian chart generator`
    -   `fix(panchang): correct sunrise time calculation`

### Pull Request Guidelines

-   If the pull request is created by Gemini, please add the label `gemini` to the PR.