---
name: verify-and-refine
description: Iteratively review and improve a project, codebase, plan, or conversation outcome. Identify concrete defects, gaps, and relevant security risks; apply authorized fixes; verify results; and repeat until no new actionable findings emerge. Deliver a consolidated final plan and clearly report unresolved issues and verification limits.
---

# Verify and refine

Systematically review the requested material, resolve concrete problems within the authorized scope, verify the results, and review again. Maintain one consolidated plan throughout the process.

Respond in the user's language unless they request otherwise. Follow the project's language conventions when editing code, comments, and documentation.

## Establish scope and authority

- Identify the user's objective, constraints, acceptance criteria, and requested target. Do not expand a review of selected code into an unrelated repository-wide audit.
- Read applicable `AGENTS.md` files and other relevant project instructions. Preserve their approval requirements.
- Use the conversation's latest decisions and approvals. Do not treat discarded ideas or earlier proposals as current requirements.
- Determine whether the request authorizes review, plan refinement, or implementation. Reviewing a plan or conversation does not authorize code changes. If implementation authority is unclear, continue analysis and present proposed fixes without modifying project files.
- Before code changes, inspect repository boundaries, working-tree status, relevant architecture, and existing tests. Preserve unrelated changes.
- Write a concrete implementation plan before editing code. Identify intended behavior, affected files, verification commands, assumptions, and any public-contract, configuration, security, persistence, or deployment impact. Obtain approval where required.

## Review the relevant failure modes

Assess the areas that matter to the target:

- Correctness and compliance with the agreed requirements.
- Missing behavior, contradictory requirements, and unsupported assumptions.
- Boundary conditions, failure handling, and regression risks.
- Relevant security concerns, including input validation, access control, sensitive data, and trust boundaries.
- Architectural responsibilities, maintainability, and consistency with established patterns.
- Test coverage and the ability to verify the intended result.
- For plans and conversation outcomes: feasibility, dependencies, sequencing, missing decisions, and consistency with the available evidence.

Keep a concise findings register. For each finding, record a stable identifier, location or reference, concrete evidence, consequence, severity, proposed remedy, verification method, and current status.

Distinguish confirmed defects, evidence-backed risks, and unresolved assumptions. Do not present style preferences or speculative possibilities as defects. Investigate uncertainty proportionally to its likely impact. Mark inaccessible evidence as a limitation rather than inventing a conclusion.

## Fix or refine

- Apply documented fixes only when implementation is authorized and within the approved scope. Prefer the smallest change that addresses the underlying problem.
- Preserve existing behavior except where a change is intentional and authorized.
- Follow applicable approval rules before expanding scope or changing architecture, dependencies, public contracts, security, deployment, or persistence.
- Keep existing architecture concerns separate from the requested fix. Do not silently turn a defect correction into structural cleanup.
- For plans and conversations, revise the proposed outcome directly, resolve contradictions where evidence allows, and identify decisions that require user input.
- Update one consolidated plan after each round. Clearly separate completed work, remaining work, and approval-dependent work.

## Verify and repeat

1. Run the smallest relevant checks for each change. Add or update focused regression tests when practical and justified by changed behavior.
2. Confirm that the original problem is resolved and inspect the affected behavior for regressions. Never weaken a check merely to obtain a passing result.
3. Review the updated result with another relevant focus, such as boundary cases, failure paths, or interactions between affected components.
4. Update finding statuses and the consolidated plan. A proposed fix is not an implemented fix; an implemented fix is not a verified fix.
5. Repeat when there are new findings or corrections. Reset the consecutive clean-review count after any material change. Reopen a resolved finding only when new evidence supports doing so.

Do not rerun identical checks without a reason or manufacture additional work to extend the process. A fresh review must examine the material, not simply repeat the previous conclusion.

For a plan-only task, verification means checking requirements, evidence, dependencies, and internal consistency. Do not claim proposed code has passed runtime tests.

## Stop honestly

Mark the requested work complete only when:

- Two consecutive substantive reviews of the latest result, using different relevant perspectives, find no new concrete defects or material risks.
- Relevant verification checks pass, with non-applicable checks identified as such.
- No unresolved issue remains that must be addressed within the authorized scope.

The two-review rule is a practical stopping condition, not proof of exhaustive coverage or freedom from defects.

If missing access, required approval, unavailable verification, an agreed time or resource limit, or repeated lack of progress prevents completion, stop the dependent work and report the exact limitation and next action. Continue independent authorized work where useful. Do not describe a blocked, budget-limited, or partly verified result as complete. Keep out-of-scope findings visible as separate follow-up items.

## Final deliverable

Provide a concise, self-contained report covering:

1. Overall status and whether the stopping criteria were met.
2. Completed fixes and affected files or sections of the plan.
3. Verification performed, including passed, failed, and unperformed checks with reasons.
4. Unresolved findings, assumptions, limitations, and decisions requiring approval.
5. The final consolidated plan, with completed items distinguished from actual next steps.

For repository changes, also summarize working-tree status and any behavior, configuration, public-contract, deployment, or security impact. State whether architecture concerns were changed, preserved, or deferred.

If the agreed work is complete and there are no remaining steps, say so. Do not invent extra improvements or claim that no possible defects exist.
