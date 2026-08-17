# Tooling Setup, Custom Harnesses & Failure Mode Mitigations

**Author:** Saurav Dodiya  
**Focus:** AI-Augmented Product & Systems Engineering

---

## 1. What I've Set Up Around AI Coding Tools

To turn generative AI from an unpredictable autocomplete into a reliable, high-velocity co-pilot, I configure deterministic scaffolding around every project:

### A. Repository Rule Injection (`AGENTS.md` / `.cursorrules`)
Every repository maintains an `AGENTS.md` at the root specifying:
- **Architecture Constraints**: "Use vanilla CSS tokens over heavy utility frameworks unless explicitly specified."
- **Coding Conventions**: Explicit type annotations, early-return patterns, and zero unhandled async promises.
- **Forbidden Actions**: Never modify `.env` files directly, never delete database migrations, never install unvetted third-party npm packages without schema checks.

### B. Custom MCP (Model Context Protocol) & Hook Ecosystem
- **Post-Edit Formatting Hooks**: Pre-commit hooks (`pre-commit`, `ruff`, `eslint`) execute immediately after agent file writes. If formatting fails, the stdout is instantly fed back into the agent context for self-correction.
- **Database & Telemetry MCP**: An MCP server that gives the agent read-only access to local schema definitions and sanitized mock fixtures, preventing hallucinated column names.
- **Interactive Verification Subagents**: Specialized subagents equipped with headless browser control (Playwright/Chrome DevTools) that capture DOM screenshots and network waterfalls to verify UI rendering before declaring a task complete.

---

## 2. Where AI Coding Tools Fall Down (Failure Modes)

Working daily with state-of-the-art AI coding models (Claude 3.7 Sonnet, Gemini 2.0 Flash/Pro, GPT-4o), I have cataloged specific failure modes:

| Failure Mode | How It Manifests | Why It Happens |
| :--- | :--- | :--- |
| **Context Horizon Amnesia** | Agent modifies a downstream file and breaks an upstream utility without realizing it. | Large repos exceed effective attention context; models prioritize recency over global architectural consistency. |
| **Over-Eager Refactoring** | Asking to fix one CSS bug results in the model rewriting 400 lines of unrelated markup. | Lack of diff boundary constraints in the prompt or tool configuration. |
| **Hallucinated SDK APIs** | The agent invents convenient convenience methods (e.g. `client.create_and_wait()`) that do not exist in the installed library version. | Training cutoff divergence or synthetic data blends in pretraining. |
| **Silent Async Race Conditions** | Code looks syntactically pristine but has subtle un-awaited promises or state race conditions under high concurrency. | LLMs optimize for token coherence rather than temporal execution flow. |

---

## 3. Strong Opinions & My Mitigation Playbook

1. **"Never let an AI write code it cannot test."**  
   If an agent is writing a function, it is simultaneously required to write a deterministic unit test. If the test runner cannot execute in the loop, the task is incomplete.

2. **Strict File Diff Boundaries.**  
   I configure tooling to reject whole-file overwrites for surgical fixes. Multi-chunk targeted replacement tools force the model to reason only about the relevant AST nodes.

3. **Human as Chief Architect, AI as Relentless Builder.**  
   High-level architectural partitioning, API contract definition, and security trust boundaries remain strictly human responsibilities. The AI excels at rapid implementation, boilerplate generation, migration script execution, and test matrix coverage.
