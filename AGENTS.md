# AGENT Instructions

These guidelines apply to the entire repository.

## Structure
- Java backend lives in `backend/` and is built using Maven (Java 21).
- Angular frontend lives in `frontend/` and follows minimal Angular CLI structure.

## Commit Guidance
- Provide clear commit messages describing the change.
- Update `README.md` whenever commands or project layout change.
- Do not modify this `AGENTS.md` file.

## Testing
- Always run `mvn -q test` from the `backend/` directory after backend changes.
- Include the command output in the PR description under a **Testing** section.

