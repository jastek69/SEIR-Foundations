-My tasks
- **Communication Style:** High Information Density, Direct, Ordinal Logic.
- **Tone:** Analytical, Objective, gen-X, Marvel, Star Trek, and Star Wars fueled Conversational Filler.

- **my task:** the next phase of our lab has been released. This new generation of Agent implementation is based on the concept of utiizing a multi-framework architecture where appropriate with pydantic, CrewAI, Langchain, LangGraph, Langfuse, and Hermes Agent. 
- Note: This classroom kit is a menu + doctrine; I am to invent the architecture. It builds off of the lessons learned in the SOAR projects and Agent 11.
- I am thinking of potential ways to use this new structure for example creating swarms of agents to do tasks, secure infrastructure, and assist in LLM development.
- Learning to use them in single framework or as mutlit-framework implemnetations and the ability to identify which is most beneficial 
- Provide me an honest evaluation of the new projects framework and design potential.
- Evaluate it against my current projects and potential ways I could take what has been done already and reiterate upon them adding improvements or be used as a foundation to build off of utilizing the new frameworks.
- Review the current projects I have targeted that could best benefit from this new framework.
- launch point: main project folder: /c/Users/John Sweeney/aws/SEIR-FoundationsNew Project folder with new code 

Proects to evaluate:
Project: SEIR-Serverless-SOAR  
project directory: /c/Users/John Sweeney/aws/lambda/SEIR-Serverless-SOAR  
repo: [https://github.com/jastek69/SEIR-Serverless-SOAR.git](https://github.com/jastek69/SEIR-Serverless-SOAR.git)  

Project: Lab 12E - Agent 11  
project directory: /c/Users/John Sweeney/aws/lambda/SEIR-Foundations/12E  
github repo: [https://github.com/jastek69/armageddon-12E-Agent11.git](https://github.com/jastek69/armageddon-12E-Agent11.git)

Project: Vertex AI  
Notes:  
* MCP on an EC2:  
* Llama LLM Server hosted on Machine - represents On Prem AI  
* Ability to switch between different llm's to emulate companies using different AI models to answer questions
project folder: /c/Users/John Sweeney/gcp/vertex_ai
Potential benefits: LangChain, Langfuse

SebekAI Vertex RAG — service account + IAM  
project folder: /c/Users/John Sweeney/gcp/vertex_ai/terraform/sebekai-vertex-rag
Potential benefits: LangChain, Langfuse


Legal Projects:
**Legal Case Management:** /c/Users/John Sweeney/aws/lambda/seir-clone-for-legal
**clawlaw build:** /c/Users/John Sweeney/projects/ai/legal/clawlaw/zig/clawlaw
**working directory:** /c/Users/John Sweeney/projects/ai/legal/clawlaw/jastek


Kubernetes:
Project: Kube Agentic  
project directory: /c/Users/John Sweeney/kubernetes/kube-agentic  
[https://github.com/jastek69/kube-agentic.git](https://github.com/jastek69/kube-agentic.git)

Project: ArgoCD and OPA
project directory: /c/Users/John Sweeney/kubernetes/kubernetesclass - ArgoCD and OPA
Potential benefits: all


Project: The Temple  
project directory: /c/Users/John Sweeney/aws/ai/temple  
[https://github.com/jastek69/Temple.git](https://github.com/jastek69/Temple.git)
Potential benefits: all

Project: Stability AI
/c/Users/John Sweeney/aws/ai/launch-instance/stability_ai
Potential benefits: Would especially like to know how to implement Langfuse for Finops tracking modeling costs and infrastructure costs, and how to potentially implement Hermes Agent, Langfuse, and CrewAI especially for Unreal integration, LangChain for tools


# Cursor

Evaluation notes — multi-framework agent kit (Pydantic, CrewAI, LangChain, LangGraph, Langfuse, Hermes) against the project portfolio. Classroom stack is a **menu for your own designs**, not a drop-in swarm platform.

**Kit location:** `theo-main/SEIR-Foundations/module3/demo_lesson/` (`sample.py`, `crewai_pydantic_classroom/`)

**Artifacts from this pass:**
- Temple: `~/aws/ai/temple/ORCHESTRATOR-SKETCH.md`, `models/temple/orchestrator.py`
- Legal matrix: `~/projects/ai/legal/clawlaw/jastek/documents/design/design-kit-matrix.md`

---

## 0. Kit verdict

| Claim | Honest read |
|---|---|
| Six technologies | Different jobs — validate / integrate / orchestrate / host / observe / crew — not one mandatory stack |
| Runnable depth today | Pydantic + CrewAI Security Analyst; LC/Graph/Langfuse thin demos; Hermes info stub |
| Design potential | High as shared engineering dialect |
| As drop-in swarm OS | Weak by design — you build the architecture |

---

## 1. Priority order (benefit ÷ effort)

1. **SOAR + Agent11 join** — finish Foundations→SOAR waves; Langfuse on heralds + routes  
2. **Stability AI** — Langfuse FinOps; LangChain tools off-GPU; Hermes later for Unreal  
3. **kube-agentic** — LangGraph narrative shell; playbooks stay code  
4. **mcp-ec2 LLM switcher** — LangChain providers + Langfuse around `ask_env` (not only `vertex_ai/`)  
5. **Legal lineage** — jastek matrix → idle legal clone → redaction → sebekai → ClawLaw worker last  
6. **Temple** — LangGraph Orchestrator + domain briefs; Guide sole voice; Ma'at governor  
7. **Vertex RAG TF / Argo+OPA class** — enablers / policy feedstock, not agent hosts  

---

## 2. Project evaluations

### SEIR-Serverless-SOAR
`~/aws/lambda/SEIR-Serverless-SOAR`

- Already has Pydantic domain, Fusion, deterministic SOAR, SFN Bedrock agentic loops, MCP.
- **Add:** Langfuse (highest ROI); LangGraph as shared loop/dispatch simulator; CrewAI only as investigation/counsel **behind** Fusion.
- **Don’t:** rewrite playbooks/Fusion in CrewAI; stuff full LC into every Lambda.
- Rule: Bedrock explains; Python authorizes; Dynamo remembers; S3 proves.

### Lab 12E — Agent 11
`~/aws/lambda/SEIR-Foundations/12E/armageddon-12E-Agent11`

- Policy-aware model routing; fail-closed; MCP; multi-destination.
- **Add:** Langfuse on typed telemetry; thin public API; optional LangGraph for orchestrator graph; LC as destination adapters.
- **Don’t:** host CrewAI/Hermes *inside* Agent11 — crews are **callers**; Agent11 is the **gate**.
- Harden tests / `models_runtime` / telemetry sink before framework stacking.

### Stability AI
`~/aws/ai/launch-instance/stability_ai`

- Best greenfield for full kit + Unreal + FinOps. Infra mature; agents absent.
- **Langfuse FinOps:** CostEvent schema → instrument worker/scripts → CUR/`gpu_seconds` bridge → budgets.
- **Unreal:** Pydantic contracts → LC Comfy tools → CrewAI 2D slice → Hermes UE control; agents **off** the GPU box.
- Epic OIDC = long pole — start early.

### Vertex AI + SebekAI RAG TF
`~/gcp/vertex_ai` · `…/terraform/sebekai-vertex-rag`

- RAG + WIF identity. Live multi-LLM switcher is largely **`mcp-ec2` + HA VPN / home Ollama**, not the TF module.
- **Add:** LangChain retrievers + Langfuse at callers; route answers via Agent11/`ask_env`.
- **Don’t:** put agent frameworks in Terraform.

### kube-agentic
`~/kubernetes/kube-agentic`

- MCP + DGC; “LLM narrates; code authorizes.” Strong kit fit.
- **Add:** LangGraph (narrative/approval graphs); Langfuse; Pydantic unify on MCP path; CrewAI advisory only.
- Playbooks/governance stay deterministic code.

### ArgoCD + OPA (kubernetesclass)
`~/kubernetes/kubernetesclass`

- GitOps/admission lab — near-zero agent surface.
- Harvest ConstraintTemplates into kube-agentic policy tools; don’t host CrewAI here.

### The Temple
`~/aws/ai/temple`

- Canon + Pydantic + Ma'at spec mature; runtime immature.
- **Revised design:** Orchestrator + domain agents (Chambers, Laws, Scrolls, Forge) — multi-agent **responsibilities**, not swarms.
- **Guide** = sole Pilgrim voice · **Ma'at** = governor (weighs, never writes).
- **Adopt:** Pydantic (done/extended in `orchestrator.py`), LangGraph Orchestrator, Langfuse evals, LC tools optional.
- **Defer:** CrewAI on live turn (OK offline Keeper scroll drafts); Hermes until Phase III UE.
- Risk if multi-voice or Ma'at-as-author — that is the real “over-agenting.”

### Legal Case Management
`~/aws/lambda/seir-clone-for-legal`

- SOAR-shaped KED legal fleet; redact-before-model; autonomy ceiling observe→draft→notify; currently largely deactivated.
- **Add:** Pydantic, LangGraph DPC/dispatcher twins, Langfuse draft provenance.
- **Don’t:** agents that file/serve/email SCLARC.

### ClawLaw
`~/projects/ai/legal/clawlaw/zig/clawlaw`

- Production-pilot email/Slack paralegal; approval + STOP + fence.
- **Add:** Pydantic/Langfuse/LangGraph on **sebekai + redaction** only.
- **Don’t:** replace `email-assistant` / send fence with CrewAI or LangChain agents.

### jastek (legal working dir)
`~/projects/ai/legal/clawlaw/jastek`

- Design/control plane; matrix lives at `documents/design/design-kit-matrix.md`.
- Rubric: frameworks may VALIDATE / REASON / ORCHESTRATE / OBSERVE — never AUTHORIZE or EGRESS.

---

## 3. Cross-cutting rules

1. Smallest tool set that meets requirements — don’t install all six.  
2. Schema-valid ≠ factually true; frameworks ≠ authorization.  
3. LLM narrates; host code authorizes; humans gate irreversible egress.  
4. Observability (Langfuse) ≠ legal/compliance system of record.  
5. Control planes (SOAR, Agent11, ClawLaw fences, Temple Ma'at) stay; kits adapt around them.

---

## 4. Swarm / secure-infra / LLM-dev map

| Ambition | Best host | Pattern |
|---|---|---|
| Security investigation swarms | SOAR | Crew/Graph interpret; Fusion/playbooks act |
| Secure infra assist | kube-agentic + OPA | Propose → policy → execute |
| Multi-model routing | Agent11 + mcp-ec2 | Already designed |
| Media / Unreal / FinOps | Stability | Tools + Crew + Hermes + Langfuse |
| Contemplative multi-agent | Temple | Domain briefs + Guide + Ma'at |
| Legal draft/assist | Legal clone → ClawLaw sebekai | Draft only; ClawLaw fence for egress |

---

# Claude

Evaluation date 2026-11-03. Everything below was checked against the actual repos (file reads, `git status`, `py_compile`, line counts). Where I disagree with the Cursor section, §6 says so.

---

## 0. Bottom line (TL;DR, Number One)

1. **Your doctrine is ahead of the kit. Your framework fluency is behind it.** The kit's best lesson, Part 5 ("Which framework stops the bad DB delete? *None of them*"), is something SOAR, kube-agentic and ClawLaw already enforce in code. So the lab won't teach you architecture. It will teach you the six tools, and that's the gap worth closing.
2. **Langfuse is the one framework that pays off in almost every project.** None of your projects evaluates LLM output quality over time. You have gates everywhere and evals nowhere.
3. **The real multi-agent opportunity is a SOAR "Council"**, not swarms. Your four agentic heralds investigate the same incident separately and never meet. A read-only synthesis layer over their outputs is the right place for LangGraph or CrewAI.
4. **Fix the basics before stacking frameworks.** Agent 11 still doesn't parse (`SyntaxError`), and Temple has 29 uncommitted changes.
5. **"Swarm" is mostly the wrong word for security work.** Five agents agreeing is not evidence, as the kit itself says. Use small specialist panels that each check their own evidence. Save swarms for parallel, low-stakes jobs.

---

## 1. Kit verdict: what `module3/demo_lesson` actually is

| Piece | What it really is | Grade |
|---|---|---|
| Lectures 01–04 | Clear map of what each tool does and where it stops; good warnings ("schema-valid ≠ true", "agreement ≠ safety") | **A** as doctrine |
| `crewai_pydantic_classroom/security_analyst.py` | The only real lab: one CrewAI agent, `output_pydantic`, checks the output again in the app, read-only fixture | **B+**, solid single-agent pattern |
| `ecs_agent_lab/` | The same script in a container on ECS, run with `sleep infinity` and ECS Exec; task role only has `ssmmessages:*` | **B**, good least-privilege example |
| `sample.py --demo langgraph` | A straight 2-node graph. **No conditional edges, no checkpointer, no `interrupt()`** | **C**, skips everything LangGraph is for |
| `sample.py --demo langfuse` | One span, then flush | **C-**, no generations, cost, scores, datasets or evals |
| `sample.py --demo hermes-info` | `print()` calls only | **Incomplete**, nothing to run |
| Model default | `openai/gpt-4.1-mini` everywhere; Bedrock left "as a separate assignment" | **Gap** for an AWS course. Your stack is Bedrock Converse |
| Tests / evals / cost limits | None | **Gap** |

**Honest read:** about 20% runnable code and 80% doctrine. The "you invent the architecture" framing is correct and suits you, because your control planes already exist. Treat the kit as a **phrasebook** (each framework's idioms), not a blueprint.

**Things the kit leaves out that matter in your stack:**
- **Lambda size limits.** CrewAI plus its dependencies won't fit a 250 MB zip, so it needs a container-image Lambda or ECS. LangGraph core plus `langchain-aws` fits. SOAR already hits size pressure (`build/_agentplatform_size`, `_prune_test`).
- **Langfuse hosting cost.** Self-hosting v3 means running Postgres, ClickHouse, Redis and blob storage. That's a small platform of its own. Decide Cloud vs self-host per data class (§4).
- **LangGraph vs Step Functions.** In SOAR, Step Functions already gives you a durable, resumable loop with iteration and token caps. LangGraph doesn't replace that in production. Its value there is a **local simulator / test harness** and new graphs that don't exist yet.

---

## 2. Framework selection rule (use this to "identify which is most beneficial")

Apply in order and stop at the first tool that meets the requirement:

1. **Pydantic.** Always, at every boundary. You already do this platform-wide (`SebekAIModel`, `extra="forbid"`).
2. **Langfuse.** Any time a production LLM call exists. Observability plus evals.
3. **LangGraph.** When you need branching, loops, checkpoints or a human-approval pause, *and* nothing you already run (Step Functions, the Postgres queue) does it.
4. **LangChain.** Only for integrations you don't already have: retrievers, swapping providers. If a direct SDK path works (Bedrock Converse), LangChain is extra weight.
5. **CrewAI.** For panels of role-based agents whose output is **advisory**. Run it on ECS or a container Lambda.
6. **Hermes Agent.** A standalone autonomous operator. **Only behind an existing gate, never inside a control plane.**

A seventh you already use: **Google ADK** (`gcp/vertex_ai/agent/soar_agent/agent.py`). Include it in comparisons. It's your Gemini-native baseline.

---

## 3. Project-by-project

### 3.1 SEIR-Serverless-SOAR: **most mature; highest payoff from Langfuse and a Council**
- **State:** 4 agentic Converse loops in Step Functions (Air-Walker, Alpha Ray, Firelord, Fallen One), each with Pydantic tool schemas and a validated `submit_findings`. Deterministic playbooks and Fusion. MCP read/action split. 53 test files, with pytest in CI.
- **Already planned:** `models/ai/orchestrator.py` (5,425 lines) already lists LangGraph and CrewAI as *outside* the domain aggregate ("FRAMEWORKS CHANGE. DOMAIN STATE SHOULD SURVIVE THEM."). That's the correct seam. You designed for this months ago.
- **Gaps this kit fills:**
  1. **Langfuse on the 4 loops.** Per-iteration generations with Bedrock token usage, tool spans, and `human_review_required` outcomes as scores. Today, a transcript in S3 is a forensic record, not something you can analyze.
  2. **Shared loop harness.** The 4 loops repeat the same `initialize → call_model → execute_tools → finalize` shape. Pull it into one harness before adding frameworks. Otherwise you instrument the same logic four times.
  3. **Council (new, read-only).** Rule today: heralds "do not invoke other agent Lambdas." Keep that rule. Add a **separate** synthesizer, started by Step Functions or EventBridge after an incident collects ≥2 investigation records. It reads `waf-investigations` + `token-investigations` + `soar-interpretations` and outputs a single `CouncilAssessment` (Pydantic): agreements, contradictions, evidence gaps. Build it on LangGraph (a fan-in node, a contradiction-check node, a human-review pause), or as a CrewAI panel on ECS for comparison. This is the real multi-agent build.
- **Don't:** move playbooks or Fusion into a framework, or put LangChain into every Lambda.
- **Housekeeping:** `CLAUDE.md` says "There is no automated test suite", which is stale (53 test files, pytest in CI). Fix it so agents don't act on wrong information.

### 3.2 Lab 12E: Agent 11, **good design, blocked by two bugs**
- **State, verified today:**
  - `lab12e` is **775,166 lines**, of which **579,764 (~75%) are comments or blank**. `models_runtime/orchestrator.py` alone is 31,821 lines, 94% comment.
  - `models_runtime/orchestrator.py` **still fails `py_compile`** (`SyntaxError`, the stray `COMPLETE PART II` line).
  - `mcp/connector.py` **still imports only `datetime`, not `timezone`**, so 19 tests fail.
  - 310/428 inline tests pass. `policy/`, `routing/`, `network/` and `telemetry/` have no tests.
- **Key finding:** `telemetry/` defines typed events (`routing_event`, `policy_event`, `governance_event`, `usage`, …) and **has no sink**. Its own comments sketch `SINKS = {...}` / `SINK_ADAPTERS = {...}`. **Langfuse is the missing sink.** It's the best fit in the whole portfolio, because the events are already typed.
- **Order:** (1) fix the 2 bugs, (2) move inline tests into `tests/` with a `conftest.py` shim (TESTING.md gap #4), (3) Langfuse sink adapter, (4) LangChain chat models as interchangeable adapters for the `company_cloud` / `company_onprem` / `company_llama` / `external_fm` runtimes, (5) LangGraph optional.
- **Rule:** Agent 11 is the **gate**. CrewAI and Hermes are **callers** of it, never hosted inside it.
- **Honest note on comment density:** 75% comments works as course notes, but it hurts every agent that reads the code, including you, me and Hermes. It also inflates RAG corpora and the context window. Consider moving the narrative into `docs/` and keeping the code lean.

### 3.3 Vertex AI + SebekAI Vertex RAG TF: **best place for a framework bake-off**
- **State:** 4 RAG Engine corpora (~1,340 files), keyless AWS→GCP access via Workload Identity Federation, an SSM registry owned by SOAR, and a 114-line **Google ADK** Gemini agent with **read-only** SOAR MCP access (m2m scope `rbac-api/user`; action tools are rejected).
- **Correction to `question.md`:** "MCP on EC2 / Llama server / LLM switching" lives in **Agent 11 `lab12e/general/` labs 01–04** (GCP Llama over IPsec, home Ollama), not in `gcp/vertex_ai`. Plan the LLM-switching work in Agent 11.
- **Recommended lab, and the one that best meets your "which is most beneficial" goal:** run **ADK vs LangGraph vs CrewAI** agents against the *same* read-only SOAR MCP tools and the *same* 20 questions. Trace all three in Langfuse and compare correctness, tool-call count, tokens/cost and latency. Results, not opinion.
- **RAG evals:** you already found that one document can dominate retrieval (8 of 10 chunks) and added `/rag/max-chunks-per-document`. Turn that into a **Langfuse dataset + retrieval-diversity score** so you can catch regressions instead of hand-checking.
- **Terraform:** a pure identity/IAM module. It gets no frameworks.

### 3.4 Legal Case Management (`seir-clone-for-legal`): **good LangGraph fit, currently deactivated**
- **State:** Phase 1 applied and verified, **deactivated since 2026-10-03** (Lambdas idle; WAF and schedules off). Development is still active (last commit 2026-10-31: DPC pleading PDFs, OAH search, Pydantic hardening). Redaction gateway (Comprehend + Comprehend Medical, fail-closed). KMS is mandatory here.
- **Fit:** DPC drafting and the case dispatcher are textbook **LangGraph with `interrupt()` for attorney review**. The draft→review→revise loop with a durable checkpoint is exactly what the kit's LangGraph demo leaves out.
- **Data rule:** Langfuse runs **self-hosted, inside the account, after redaction**, or records metadata only. Privileged or client data never goes to Langfuse Cloud.
- **Don't:** let any agent file, serve, or send email.

### 3.5 ClawLaw: **best gates in the portfolio; the Python kit mostly doesn't apply**
- **State:** **TypeScript / Node 24 / Postgres 16 / Anthropic SDK**, in a live pilot since Aug 2026. Gates: verbatim-quote check, separate authorizer call, independent review, approval hash, STOP window, at-most-once send fence.
- **Mismatch:** CrewAI, Hermes and most of the kit are Python. In Node the options are **LangGraph.js** and the **Langfuse JS SDK**. The core pipeline doesn't need a framework, because its gates are already deterministic and tested.
- **Where the kit fits:** `services/sebekai` (Python, "one real agent, the rest still a skeleton", `fett.py` + `fett_runner.py`). Pydantic, Langfuse and optional LangGraph go there.
- **Blocker for Langfuse:** zero data retention with Anthropic is **"Not confirmed in writing"** (README). Adding Langfuse Cloud would add another third-party processor of attorney work product. Self-host or record metadata only. This is a compliance decision, not a technical one.
- **Do not** replace `email-assistant`, the gates, or the send fence with framework agents.

### 3.6 jastek (legal design/control plane)
- Docs only: 13 design docs, including `design-kit-matrix.md` (from the Cursor pass). Rule to keep: *frameworks may VALIDATE / REASON / ORCHESTRATE / OBSERVE, never AUTHORIZE or EGRESS.* That's the right rule. Put it in ClawLaw's `ARCHITECTURE.md` so it carries weight there.

### 3.7 kube-agentic: **cleanest fit for both LangGraph and Hermes**
- **State:** mTLS nginx gateway → thin MCP trio (`mcp-server` / `mcp_governance` / `mcp_executor`) → deterministic playbooks. A Deterministic Governance Core (`dgc/`). `restart_deployment` is denied unless `approved=true` + `approver`. 44-test pytest suite, kubectl stubbed. Phases 1–4 done, Kong is next.
- **LangGraph:** the existing `approved=true`/`approver` gate is a natural place for an `interrupt()`. The graph pauses, a human approves, and the graph resumes with the approver id. The **DGC still authorizes**; the graph only carries state.
- **Hermes (best Hermes experiment in the portfolio):** give a Hermes agent **only an mTLS client certificate, no kubectl and no ServiceAccount**, and let it work freely. The gateway was built to hold back untrusted agents, so this is a live test of that zero-trust design. Log every denial. Each denial shows the gateway worked.
- **CrewAI:** advisory triage panel only. **Langfuse:** on the narrative (Gemini) path.

### 3.8 ArgoCD + OPA (kubernetesclass): **the policy check outside the LLM**
- Not a place to host agents. But **OPA is exactly what kit Part 5 asks for**: policy enforced outside the LLM.
- **Use:** every agent-proposed manifest or Terraform change goes through `conftest`/Gatekeeper dry-run with the constraints from `Project3_OPA` *before* a human sees it. Agents propose, OPA rejects, humans approve. The rejection count becomes a Langfuse score.

### 3.9 The Temple: **smallest codebase, lowest framework payoff, one clear eval win**
- **State:** about 565 lines of Python in `models/temple/` (about 800 counting the Cursor-created `orchestrator.py`); canon 5.0.4 (18 chambers, 16 laws, 6 derived awaiting the Keeper). **29 uncommitted changes:** `canon/maat.yaml` was moved to `governance/maat.yaml`, `validate.py` and `DRIFT_SUITE.md` were deleted, and `canon-5.1.proposal` + `ratification.yaml` are untracked. Cursor's `models/temple/orchestrator.py` is also untracked. **Commit or branch this before anything else.** Don't let the multiverse branch without a save point.
- **Clear win:** `models/test_drift.py` already exists. Turn the drift tests into a **Langfuse dataset**, and score each Guide turn for voice drift and law compliance (Ma'at as an *evaluator*, which fits "weighs, never writes").
- **Agree with Cursor:** one voice (the Guide), Ma'at as governor, domain briefs rather than swarms. LangGraph is fine but optional at this size. A plain Python state machine would work too.

### 3.10 Stability AI: **greenfield for agents, but the FinOps question needs reframing**
- **State:** Terraform + Packer GPU stack (ComfyUI, Spot option, S3 model store). `docs/FinOps.md` (308 lines; cost model, Spot, buy-vs-rent). `python/chain_metrics.py` already scores outputs (sharpness, color stats, **CLIP similarity**). A tiny FastMCP server (`classify`, `health`). Unreal is listed as Phase 3/4 in `TODO.md` / `PHASE2.md`. **There is no LLM in the loop today.**
- **Langfuse for FinOps, honestly:**
  1. Langfuse tracks **per-job cost**, not **billing**. Authoritative infrastructure cost stays in **CUR / Cost Explorer with tags** (`Project`, `Workflow`, `Purchase=spot|ondemand`).
  2. Record each ComfyUI job as a Langfuse **generation** with custom `cost_details` = `gpu_seconds × instance $/s` (Spot or on-demand rate from FinOps.md). The model name is the checkpoint (FLUX.2, Qwen-Image, Wan2.2…).
  3. Push the `chain_metrics.py` results as **Langfuse scores**.
  4. **The KPI that matters: cost per *acceptable* output** (cost ÷ outputs above a CLIP/sharpness threshold). Langfuse can calculate it and CUR can't. You already have both sides.
  5. Monthly, reconcile the Langfuse job total against CUR spend for the instance. Unexplained spend is idle GPU time, which is your biggest cost lever.
  6. Host Langfuse **off the GPU box** (Cloud hobby tier is fine here, since this data isn't sensitive).
- **CrewAI creative crew** (on a CPU box, not the GPU): Director (shot list) → Prompt Writer (per-model guide in `comfyui-prompt-guidev0.4.md`) → Critic (reads `chain_metrics` scores, approves or retries). **LangChain tools** wrap `scripts/submit_job.py`, `model_select.py` and the MCP server. Pydantic `ShotSpec` / `JobRequest` contracts.
- **Hermes + Unreal (Phase 4):** Hermes as a long-running operator on a CPU control node, driving UE through the **Remote Control API / Python editor scripting**, or through a UE MCP server, with skills it saves (reusable "render sequence X" procedures). The `ue_render` SQS pattern you already designed (12-hour max visibility timeout + `ChangeMessageVisibility`) is the gate. Hermes queues jobs and never touches the render workers directly. **Start the Epic developer-account process now**, since it takes the longest.
- **Housekeeping:** `rds-ssh-lab01.pem` and `terraform.tfvars` sit in the repo root. Both are correctly gitignored (verified), but a key next to code is one `git add -f` from a leak. Move it to `~/.ssh`.

---

## 4. Cross-cutting: one Langfuse, three data classes

| Class | Projects | Langfuse mode |
|---|---|---|
| Not sensitive | Stability, Temple, Vertex bake-off, kit labs | Langfuse Cloud is fine |
| Security telemetry | SOAR, Agent 11, kube-agentic | Self-hosted (ECS/EKS) or Cloud with IPs/tokens masked. SOAR already stores only token hashes. Keep it that way in traces |
| Privileged / client data | Legal clone, ClawLaw, sebekai | **Self-hosted in the account, after redaction, or metadata only.** Never Cloud until ZDR and the firm's agreement allow it |

Use separate Langfuse **projects** per repo, with shared score names (`human_review_required`, `policy_denied`, `schema_retry`, `cost_usd`), so you can compare across the portfolio.

---

## 5. Swarm / secure-infra / LLM-dev map

| Ambition | Best home | Pattern | Swarm OK? |
|---|---|---|---|
| Security investigation | SOAR Council | Heralds investigate separately → synthesizer flags contradictions → human | **No**: panel, read-only |
| Secure-infra assist | kube-agentic + OPA | Agent proposes → OPA/DGC → human approves (LangGraph pause) | **No** |
| Zero-trust red team | kube-agentic | Hermes with only an mTLS cert, probing the gateway | Single agent |
| LLM dev assist | Agent 11 | Agents write the missing `policy/` / `routing/` / `telemetry/` tests; human reviews | **Yes**, parallel, low stakes |
| RAG corpus curation | Vertex RAG | Parallel workers classify and dedupe source files before import | **Yes** |
| Creative exploration | Stability | Parallel prompt variants scored by `chain_metrics`, cost-capped | **Yes**, with a budget cap |
| Legal drafting | Legal clone → ClawLaw | Draft only. ClawLaw's fence controls egress | **No** |

---

## 6. Where this pass differs from the Cursor section

| Topic | Cursor | Claude |
|---|---|---|
| Agent 11 | "Harden tests before stacking" | Specific: 2 known bugs **still present today**, telemetry has **no sink** (Langfuse fills it), 75% comment density |
| SOAR multi-agent | CrewAI "behind Fusion" | Concrete new piece: **Council** that synthesizes herald outputs; plus a shared loop harness first |
| ClawLaw | Add Pydantic/Langfuse/LangGraph on sebekai | Agree, but noted **core is TypeScript** (kit is Python) and **ZDR unconfirmed** blocks Langfuse Cloud |
| Framework comparison | Not addressed | **ADK already in use**; proposed a measured ADK vs LangGraph vs CrewAI bake-off on the SOAR MCP |
| Stability FinOps | CostEvent → CUR bridge | Agree; reframed the KPI as **cost per acceptable output** from existing `chain_metrics.py` |
| Hermes | "Later, for Unreal" | Also the **kube-agentic mTLS red-team** as the first, safer Hermes experiment |
| Temple | Orchestrator design | Agree on design; flagged **29 uncommitted changes** (including Cursor's own file) |
| LLM switcher location | `mcp-ec2` | Lives in **Agent 11 `lab12e/general` labs 03/04** |
| Doc staleness | Not addressed | SOAR `CLAUDE.md` "no automated test suite" is wrong |

---

## 7. Priority order (payoff ÷ effort)

1. **Hygiene, about a day.** Fix Agent 11's `SyntaxError` and `timezone` bug; commit or branch Temple; correct the SOAR `CLAUDE.md` test claim.
2. **Langfuse foundation.** Decide hosting per §4. First sinks: Agent 11 telemetry, then the SOAR 4-loop harness.
3. **Framework bake-off** (Vertex + SOAR MCP): ADK vs LangGraph vs CrewAI, measured in Langfuse. This one lab answers "which is most beneficial."
4. **SOAR Council**, built on whichever framework wins #3.
5. **kube-agentic.** LangGraph approval pause on `restart_deployment`; Hermes mTLS red team; OPA as the policy check on proposals.
6. **Stability.** Cost per acceptable output in Langfuse; CrewAI creative crew; start the Epic account process. Hermes/Unreal comes later.
7. **Legal clone** (when reactivated): LangGraph DPC with attorney pause; self-hosted Langfuse after redaction. **ClawLaw sebekai:** metadata-only traces.
8. **Temple.** Drift suite → Langfuse evals.

*"Do. Or do not. There is no try."* Here that means: measure (#3) before you commit to a framework (#4).

