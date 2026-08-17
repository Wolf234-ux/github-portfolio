# Saurav Dodiya — AI Coding Workflow & Lifecycle Architecture

This document details my end-to-end AI-augmented product and engineering lifecycle: from problem specification to production delivery, automated review gates, and incident root-cause diagnosis.

---

## 1. End-to-End Workflow Architecture (Mermaid Diagram)

```mermaid
flowchart TD
    %% Styling
    classDef startEnd fill:#1e1e2e,stroke:#89b4fa,stroke-width:2px,color:#cdd6f4;
    classDef process fill:#181825,stroke:#b4befe,stroke-width:1px,color:#cdd6f4;
    classDef decision fill:#313244,stroke:#f9e2af,stroke-width:2px,color:#f9e2af;
    classDef failure fill:#452834,stroke:#f38ba8,stroke-width:1px,color:#f38ba8;
    classDef success fill:#254137,stroke:#a6e3a1,stroke-width:1px,color:#a6e3a1;

    subgraph PHASE_1 ["1. Problem Scoping & Spec Contracting"]
        A["User Need / Business Goal"] --> B["Draft PRD & Metric Scorecard"]
        B --> C["Generate AGENTS.md / Interface Contract Schema"]
    end

    subgraph PHASE_2 ["2. Agentic Pair-Programming Loop"]
        C --> D["Context Initialization (Rule Injection & Skill Discovery)"]
        D --> E["Autonomous Implementation (Step-by-Step Tool Use)"]
        E --> F{"Deterministic Verification Gate"}
        F -- "Linter / Type / Unit Test Failure" --> G["Auto-Feed Traceback to Agent"]
        G --> E
        F -- "All Checks Pass (100%)" --> H["Produce Diff & Local Preview"]
    end

    subgraph PHASE_3 ["3. Human-in-the-Loop Review & PR Gate"]
        H --> I["Human Architectural Review"]
        I --> J{"Regression / Hallucination Check"}
        J -- "Violates Contract / Over-Refactored" --> K["Rollback / Refine Agent Prompt"]
        K --> E
        J -- "Approved" --> L["Git Commit & Atomic PR"]
    end

    subgraph PHASE_4 ["4. CI/CD & Automated Delivery"]
        L --> M["GitHub Actions CI / Container Build"]
        M --> N["Automated Cloud Provisioning (Render / AWS)"]
        N --> O["Production Telemetry & Health Checks"]
    end

    subgraph PHASE_5 ["5. Production Incident / Debug Loop"]
        O --> P{"Anomaly / Sentry Error Triggered?"}
        P -- "No" --> Q["Continuous Evaluation & Learning"]
        P -- "Yes" --> R["Isolate Reproducer Script"]
        R --> S["Supply Log Telemetry to AI Debug Session"]
        S --> T["Generate Regression Test FIRST"]
        T --> E
    end

    class A,Q startEnd;
    class B,C,D,E,G,H,I,K,L,M,N,O,R,S,T process;
    class F,J,P decision;
    class G,K,R failure;
    class N,O,Q success;
```

---

## 2. Core Pillars of My Workflow

### A. Spec Contracting Before Token Generation
Before opening an AI coding session, I define clear contracts:
- Input/output schemas (JSON schema / Pydantic models).
- Acceptance criteria and edge cases.
- System constraints embedded in `AGENTS.md` (e.g. strict lint rules, directory boundaries).

### B. The 3-Strike Rule & Deterministic Verification
I never trust generated code until deterministic tools pass:
1. **Static Analysis & Types**: Linters (`ruff`, `eslint`, `tsc`) run automatically on save.
2. **Unit & Integration Tests**: PyTest/Jest suites with real assert assertions.
3. **Execution Sandbox**: The agent is given access to run terminal commands to verify its own code before requesting human review.
If the agent loops 3 times on the same bug, I intervene, isolate the minimal reproducible snippet in a scratch script, and provide explicit steering.

### C. Incident Debugging: "Test-First" Root Cause Analysis
When production telemetry or user issues arise:
1. **Capture minimal payload**: Extract exact headers/payload from logs.
2. **Write a failing test first**: Create `test_repro_<issue>.py` reproducing the exact failure state.
3. **Feed failure trace to AI agent**: Instruct the agent: *"Modify only the core logic to make this test pass without altering existing test baselines."*
4. **Deploy hotfix with regression lock**: Prevents the same bug from re-emerging.
