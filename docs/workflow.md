# Workflows for AI Smart Topics

## Core workflow

### 1. Start with a clear question
Before asking an LLM to do something, define:
- what problem you want to solve;
- what output is expected;
- what constraints must be respected;
- what signals tell you the answer is correct.

Good prompt structure:
```text
Context:
- project type
- stack
- constraints
- target environment

Task:
- what exactly to produce

Output format:
- code, summary, plan, or test checklist

Validation:
- how to check the result
```

## 2. Break complex tasks into phases
Use this sequence:
1. Define the objective
2. Make a plan
3. Build small modules
4. Validate incrementally
5. Integrate into the main system
6. Review and improve

### 3. Validate continuously
Every AI-generated result should be checked by at least one of:
- automated tests;
- build commands;
- static analysis;
- log inspection;
- manual verification.

## 4. Keep a human decision layer
AI can generate ideas, but humans must decide:
- what architecture to choose;
- whether the trade-off is acceptable;
- whether the solution is safe and correct.

## 5. Keep working artifacts
Record:
- prompts;
- architecture notes;
- decisions and trade-offs;
- test procedures;
- lessons learned.

## Recommended process
```text
idea -> problem statement -> architecture -> prototype -> tests -> feedback -> refinement -> final result
```

## Practical example for a software task
```text
We need a small Python service.
Requirements:
- accept JSON input
- validate required fields
- store into SQLite
- return structured response
- include tests

Constraints:
- no external packages beyond stdlib
- Python 3.11+
- include README

Validation:
- run unit tests
- check API responses
- verify failure cases
```

## Recommended folder flow
```text
project/
├── README.md
├── docs/
├── src/
├── tests/
├── examples/
├── scripts/
└── notes/
```

## Summary
The best AI workflow is not "ask once and trust the answer". It is:
- ask clearly;
- plan intentionally;
- test rigorously;
- iterate with feedback.
