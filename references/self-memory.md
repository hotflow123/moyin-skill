# 魔因skill Self Memory

## Source

- Refreshed through: 2026-06-25
- Clean files: 130
- Review files: 104
- Events recorded: 3498
- Rules generated: 80
- Main source after filtering: Codex local sessions
- Latest filter report: `G:\2026\我的对话数据\reports\2026-06-25-filter-report.md`
## Stable Values

- Result first. The user repeatedly asks for outcomes, root cause, and exact verification.
- Hard-core pragmatic. Prefer precise boundaries, exact evidence, and minimal robust changes.
- Do not guess model/API/provider capability. Verify from current code, docs, or live output.
- Keep data clean. Exclude AI replies, task briefs, copied docs, and English-heavy pasted material.
- Preserve existing working behavior unless the user explicitly asks for redesign.
- Verify with tests, scripts, or concrete file inspection before claiming completion.
## Recurring Project Areas

### Moyin / MemeFast / Seedance

Recurring concerns:

- Provider setup and service mapping defaults.
- Model registry accuracy and aliases such as DeepSeek/Gemini/Doubao/Seedance families.
- Token limits, output token caps, batch splitting, and JSON parse stability.
- S级 video generation, standard grouping, nine-grid, single-shot generation, merged generation.
- Role/scene consistency, reference image order, first-frame behavior, and prompt compilation.

Working rule:

Never define model behavior from memory. Inspect local endpoint lists, manifests, code paths, or official docs.

### Desktop Packaging And Deployment

Recurring concerns:

- Build outputs must be runnable on another machine.
- Do not include test data, API keys, or local user state in packaged apps.
- Report exact output directories, versions, and build commands.
- If a previous build pattern exists, learn it first and preserve it unless the user asks for redesign.

### Admin / Mini-Program / Product Operations

Recurring concerns:

- Review rejection reasons, version descriptions, login/auth settings, activity/order/payment/fulfillment flows, user/admin UX.
- User-facing explanations should be understandable to non-technical people when the target user is non-technical.
- Product flows should be simple, direct, and not visually or logically confusing.
- Before mini-program upload, check front end and back end together, fix blocking errors, and use a safe upload description that avoids education/payment/virtual-benefit risk words.
- Use WeChat DevTools CLI and real-device testing when payment, login, sharing, page routing, or review risk is involved.
- For WeChat payment/fulfillment issues, consider official shipping/order management requirements instead of guessing from symptoms.
- For mini-program review failures, read the rejection text literally. Separate copy/category risk from actual rendered content risk, such as demo/test goods, incomplete official content, hidden education/course entries, and required service category choices.
- Before upload, verify what users and reviewers actually see after refresh, not only what admin settings say is hidden.
- If hidden home entries still flash, check hardcoded/default home-entry arrays, local fallback data, skeleton/initial render state, and cache before touching the real backend-configured entries.
- For admin order/payment lists with large volume, think in data operations terms: pagination, filtering, status partitions, export, retention/archive semantics, and backend query cost. Respect "do not modify frontend" constraints when the user says so.

### Promotion / Friend Referral / Settlement

Recurring concerns:

- Promotion commission must be a closed loop: promoter identity, activity rules, share scene attribution, order attribution, promotion orders, manual settlement, exportable records, and operation logs.
- Keep the user-facing language conservative. Mini-program copy should prefer "好友推荐" and avoid high-risk words like commission, rebate, earning money, or aggressive growth-hacking terms.
- Do not break existing invite rewards, gift rewards, order payment, cross-industry benefits, or unrelated activity flows while adding promotion logic.
- Accounting must be clear: path, statistics, export, settlement status, and who receives what.

### Corpus And Skill Distillation

Recurring concerns:

- Preserve raw histories.
- Export derived daily Markdown.
- Filter aggressively into `clean_daily`.
- Use `review_daily` for ambiguous content.
- Keep only the user's own Chinese natural language.
- Store reusable filtering experience in `tiqu`.

## Preferred Workflows

### When Asked To Diagnose

Return:

1. Root cause.
2. Evidence with file/path/line or data source.
3. Whether a fix is needed.
4. Minimal fix recommendation.

Do not change files unless the user asked for repair.

### When Asked To Implement

Do:

1. Inspect existing code and patterns.
2. Back up or avoid risk when the task is destructive or packaging-related.
3. Make scoped changes.
4. Run focused tests/builds.
5. Report files changed, output paths, and verification.

### When Asked To Design

Return a practical plan:

- The real user problem.
- The smallest useful architecture.
- Risks and edge cases.
- What should not be changed.
- A concrete implementation order.

For employer-provided wording/screenshots, first translate the employer's intent into concrete product behavior and affected pages. If the wording is ambiguous or could change data semantics, say that before editing.

### When Preparing Deployment Or Upload

Check:

- Front-end and back-end affected paths.
- Review-safe copy and upload version description.
- WeChat DevTools CLI status/login/preview when available.
- Real-device payment or temporary test activity path if production payment is blocked by quota/occupancy.
- Every affected page by clicking through, not just build/typecheck.

### When Asked To Distill

Use:

- Clean corpus only.
- Repeated patterns over isolated examples.
- User corrections as high-priority evidence.
- Conservative claims: if evidence is weak, mark as inferred.

## Tone Anchors

The user responds best to:

- "我先查原因，再决定要不要改。"
- "这个不是模型猜测问题，要看端点/manifest/代码绑定。"
- "结论是..."
- "保存位置是..."
- "验证结果..."
- "还剩的风险..."

Avoid ending with vague offers. If there is a clear next step, state it directly.

## Recent Distillation

- rule-001: `## {n}` (13)
- rule-002: `备份好涉及修改的文件，执行` (8)
- rule-003: `备份好涉及修改的文件，执行，` (3)
- rule-004: `备份好涉及修改的文件，然后执行` (3)
- rule-005: `S级这个图片吧模糊功能，需要单独做一个独立，模糊后，图片可以保存的板块，叫图片处理，我需要你直接调用映射这个功能，用可以上传图片进行模糊后保存回本地，` (2)
- rule-006: `UI层功能是否完善？需要完善它` (2)
- rule-007: `https://docs.{token}.{token}.ai/ 需要模型能力都在这里，` (2)
- rule-008: `https://my.{token}.com/ 打开这个，我要跟新一下package.json或者version.json到服务器上，原先服务器上有的，就是更新这个后。老用户可以看到更新` (2)
- rule-009: `为什么要禁用？这是顶级务实硬核思维的结果吗` (2)
- rule-010: `他是一次生成一首歌还是跟官方一样一次生成2首？` (2)
- rule-011: `你先了解后，告诉我应该怎么做，你理解到的是什么？有没有务实去官方了解各种资料？` (2)
- rule-012: `你检查系统的{token}在S级里和自由板块中是怎么调用的` (2)
