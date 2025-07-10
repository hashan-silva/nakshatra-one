## Project: NakshatraOne - Astrology Web Platform

**NakshatraOne** is a web-based astrology software built using Java (Spring Boot) for the backend and Angular for the frontend. It provides comprehensive astrological services such as Kundli generation, Panchang, Horoscope predictions, and Matchmaking.

---

# AGENT Instructions

Agents working on this project should follow these core principles:

### Workflow
1.  **Understand the Context:** Before writing or modifying code, thoroughly review all relevant files to understand the existing architecture, patterns, and conventions.
2.  **Create a Plan:** Formulate a clear to-do list or a step-by-step plan. This helps ensure all aspects of the task are covered.

### 🔧 Technologies
- **Backend:** Java 17+, Spring Boot, REST APIs, Swiss Ephemeris (JNI)
- **Frontend:** Angular 16+, Bootstrap or Tailwind CSS
- **Database:** PostgreSQL or MySQL
- **Authentication:** JWT-based login (Spring Security + Angular Interceptors)

---
### Module Overview

| Module             | Description |
|--------------------|-------------|
| Kundli Generation  | Accepts birth details, uses Swiss Ephemeris to calculate planetary positions and renders chart (North/South) |
| Panchang/Muhurat   | Uses ephemeris to calculate tithi, nakshatra, yoga, karana |
| Horoscope          | Daily, Weekly, Monthly predictions based on planetary transits |
| Matchmaking        | Traditional 36-gun Milan algorithm with Dosha checks |
| Dasha Analysis     | Vimshottari Dasha periods, based on Moon's Nakshatra |
| Reports            | PDF generation using iText or PDFBox |
| Multi-language     | i18n support via Angular/Spring message sources |

---

### API Guidelines
- Use RESTful naming conventions
- Authentication endpoints: `/api/auth/login`, `/api/auth/register`
- Secure sensitive routes using JWT
- All astrology data endpoints under `/api/astro/*`

---

### 📊 Data Structures
- Prefer DTOs for request/response objects
- Use standard enum types for:
  - Planet names
  - Zodiac signs
  - Chart styles (NORTH_INDIAN, SOUTH_INDIAN)
- Store raw chart data in JSON (or normalized relational format)

---

### 📁 File Organization

**Backend**
/src/main/com/hashan0314/nakshatraone
    - /controller
    - /service
    - /model
    - /util
    - /config

**Frontend**
/src/app
    - /components
    - /services
    - /models
    - /pages

---

### 📁 File Organization

**Backend**
/src/main/com/hashan0314/nakshatraone
    - /controller
    - /service
    - /model
    - /util
    - /config

**Frontend**
/src/app
    - /components
    - /services
    - /models
    - /pages

**Terraform**
/terraform
    - `main.tf`: Main configuration file.
    - `variables.tf`: Input variables for customization.
    - `outputs.tf`: Output values from the deployment.

---

### Best Practices
- Document each API endpoint using Swagger
- Follow Angular style guide (modularize features)
- Write unit/integration tests (JUnit for backend, Jasmine/Karma for frontend)
- Ensure time zone accuracy in all planetary calculations

### Code Quality and Linting

-   **Backend (Java/Spring Boot):** Run `mvn validate` to check for code quality issues and enforce coding standards.
-   **Frontend (Angular):** Run `ng lint` to identify and fix linting issues.
-   **Terraform:**
    -   Run `terraform validate` to check for syntax errors and configuration issues.
    -   Run `terraform fmt -check=true -diff=true` to check for formatting issues.

### Best Practices
- Document each API endpoint using Swagger
- Follow Angular style guide (modularize features)
- Write unit/integration tests (JUnit for backend, Jasmine/Karma for frontend)
- Ensure time zone accuracy in all planetary calculations

### Code Quality and Linting

-   **Backend (Java/Spring Boot):** Run `mvn validate` to check for code quality issues and enforce coding standards.
-   **Frontend (Angular):** Run `ng lint` to identify and fix linting issues.

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

## Commit Instructions

Please follow this format for all Git commits:
- \<type>(\<scope>): \<short description>
- **Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
- **Examples:**
    - feat(kundli): add North Indian chart generator
    - fix(panchang): correct sunrise time calculation
    - docs(api): add Swagger docs for matchmaking endpoint
- Use descriptive commits. Reference issues/tickets using `#issueID` in the footer when applicable.
- Update `README.md` whenever commands or project layout change.
- Do not modify this `AGENTS.md` file.

### Pull Request Guidelines

-   If the pull request is created by Codex, please add the label `codex` to the PR.

## Testing

### Backend (Java - Spring Boot)
- Use **JUnit 5** and **Mockito**
- Test service logic independently
- Use `@WebMvcTest` for controller tests
- Use `@DataJpaTest` for repository tests

Run tests:
```bash
./mvnw test
```

### Frontend (Angular)
 - Use Jasmine and Karma for unit tests
 - Write tests for components, services, and pipes
 - Use ng test to execute tests

Run tests:
```bash
npm run test
```
- Include the command output in the PR description under a **Testing** section.

Agents should follow modular, clean coding practices and prefer reusable components. Maintain consistent UI/UX and align with the application's spiritual and professional tone.

