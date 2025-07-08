## Project: NakshatraOne - Astrology Web Platform

**NakshatraOne** is a web-based astrology software built using Java (Spring Boot) for the backend and Angular for the frontend. It provides comprehensive astrological services such as Kundli generation, Panchang, Horoscope predictions, and Matchmaking.

---

# AGENT Instructions

Agents working on this project should follow these core principles:

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

### Best Practices
- Document each API endpoint using Swagger
- Follow Angular style guide (modularize features)
- Write unit/integration tests (JUnit for backend, Jasmine/Karma for frontend)
- Ensure time zone accuracy in all planetary calculations
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

