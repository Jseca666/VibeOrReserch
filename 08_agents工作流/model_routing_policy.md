# 模型路由策略

本策略规定 Auto-Gate 在不同任务类型下如何选择模型层级。目标是降低低风险整理任务的成本，同时把数学证明、运筹可解性、新颖性边界、claim/RD/OUT 关键门禁保留给更强复核层。

本策略不替代 `自进化自动工作闭环协议.md`、`Codex角色调用协议.md`、`研究债务队列.md`、`claim审批表.md` 或最终对外责任确认。模型等级只表示推理资源分配，不表示命题已证、claim 已升级或 RD 可关闭。

## 1. 抽象能力层

协议正文只引用抽象能力层，具体模型映射写入 `model_routing_policy.yaml`。未来 Codex 支持新模型时，优先更新 YAML，不重写 T0-T7 协议正文。

| 能力层 | 用途 | 当前默认映射 |
|---|---|---|
| `execution` | 低风险整理、格式迁移、摘要、检索初筛、日志整理、结构化副本维护 | GPT-5.4 xhigh |
| `review` | 对中风险草案进行复核，检查论文锚点、模型边界和文献风险 | GPT-5.5 xhigh |
| `gate` | T2/T5/T6/T7 高风险门禁、claim/RD/OUT 关键裁决 | GPT-5.5 xhigh |
| `merge_owner` | 并行结果合并、冲突消解、Auto-Gate 最终收口 | GPT-5.5 xhigh 或 Auto-Gate |

成本口径采用本项目当前工作假设：GPT-5.5 xhigh 约为 GPT-5.4 xhigh 的两倍成本。该口径只用于项目内路由，不作为官方价格判断。

## 2. T0-T7 默认路由

| 任务类型 | 默认路由 | 升级触发 |
|---|---|---|
| T0 论文方向与贡献策略 | `execution` 起草 map/matrix；涉及主贡献定位时由 `review` 复核 | 主贡献取舍、新颖性边界、审稿风险、论文主线调整 |
| T1 公式/符号/草稿整理 | `execution` | 出现 \(W_1/W_2\) 混用、支撑冲突、非单调 \(P\)、推前等价、维度冲突 |
| T2 定理/命题/证明验证 | `gate` | 默认高风险；可由第二个 `gate` 角色复核 |
| T3 优化模型/MILP/reformulation | `execution` 写模型卡草案；`review` 审改革写和可解性 | big-M、强对偶、离散/连续精确性、复杂度、路径变量嵌入 |
| T4 实验/日志/反例 | `execution` 做日志和表格；反例意义由 `review` 或 `gate` 审 | 反例击穿命题、实验影响 claim、求解器结果支持/否定理论 |
| T5 文献检索/边界 | `execution` 做检索摘要；`gate` 做新颖性和边界裁决 | 文献覆盖 C-010/C-011、改变贡献强度、related work 主线变化 |
| T6 claim 状态 / 论文强 claim | `gate` | 默认高风险；GPT-5.4 只可做表格预整理 |
| T7 工作流/角色/Auto-Gate 自进化 | `execution` 做格式同步；`gate` 审门禁、角色和主线变化 | 改角色、改门禁、改主线、改模型路由、改并行协议 |

## 3. 升级触发

出现以下任一情况时，低风险 worker 的结果必须升级到 GPT-5.5 xhigh 或 Auto-Gate gate 层复核：

- 影响 claim 状态、claim 强度或论文强表述。
- 触发 RD 关闭候选、系统内解除阻断候选或 `claim阻断` 解释变化。
- 文献索引显示 `direct_existing`、`literature_conflict` 或 `novelty_risk`。
- proof step 从 `draft`、`need_audit` 变成 `conditional_pass` 或 `audited_pass`。
- 实验或反例击穿候选命题。
- OUT 从中间技术产物变成 `paper_eligible` 或成果型输出候选。
- 并行 worker 对同一片段、claim、RD 或 OUT 的判断冲突。

## 4. 越权边界

GPT-5.4 xhigh worker 只能产出草案、结构化 rows、摘要、候选 RD/NXT/OUT 建议和风险标记。它不得单独执行以下动作：

- 升级 claim。
- 关闭 RD 或把 RD 标为关闭候选。
- 裁决文献新颖性或论文主贡献成立。
- 标记 proof 通过。
- 批准成果型 OUT、paper progress、`main.tex` 或成果型 slides 准入。
- 覆盖 Auto-Gate 最终裁决。

`review_model = gpt-5.5-xhigh` 也不表示命题已证。证明仍必须经过命题卡、假设账本、证明步骤矩阵、反例检查、文献边界和 Auto-Gate 裁决。

## 5. NXT/EVO 字段

后续 NXT、EVO meta 和 active CSV 应记录以下字段：

| 字段 | 取值 |
|---|---|
| `model_tier` | `low` / `mixed` / `high` / `gate` |
| `worker_model` | 当前执行模型或 `none` |
| `review_model` | 复核模型或 `none` |
| `parallelizable` | `yes` / `no` / `partial` |
| `merge_owner` | `Auto-Gate` / 角色名 / `gpt-5.5-xhigh` |
| `escalation_reason` | 升级原因；无则写 `none` |
| `cost_class` | `low` / `medium` / `high` / `capped` |
