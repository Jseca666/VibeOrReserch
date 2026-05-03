# 并行 agents 调度协议

本协议规定多个 agents 并行工作时的任务边界、模型分配和合并规则。并行化的目标是减少等待时间、提高覆盖率和降低低风险任务成本，不是让多个 worker 分散改变项目状态。

本协议不替代 Auto-Gate、RD/NXT/EVO/OUT、claim 审批、证明审计、文献边界或人类责任确认。

## 1. 调度原则

```text
Map：多个 worker 生成结构化 rows / cards / summaries。
Review：高风险 rows 由 reviewer 或 gate 层复核。
Reduce：Auto-Gate 或 merge owner 统一消解冲突并写回。
```

worker 产物只能进入草案、证据、候选 RD/NXT/OUT 或风险标记。最终项目状态只能由 Auto-Gate 或指定 merge owner 收口。

## 2. 可并行任务

以下任务可并行，默认使用 `execution` 能力层：

- 不同 source 文件的 T0 草稿锚点分流。
- 文献检索初筛和文献卡片摘要。
- Markdown 到 CSV/JSONL/YAML 的格式迁移。
- source 覆盖矩阵和结构化副本一致性检查。
- 实验日志摘要、JSON/CSV 结果摘要。
- 独立小规模反例搜索。
- 不同候选命题的初步假设账本。
- RD/NXT/OUT active CSV 同步检查。
- raw notes fragment card 生成。

若并行任务涉及 claim、新颖性、proof step 通过、RD 关闭候选或成果型 OUT，必须转入 `review` 或 `gate`。

## 3. 必须串行或最终串行收口的任务

以下任务不得由多个 worker 各自直接写最终状态：

- claim 升级或降级。
- Auto-Gate 最终裁决。
- RD 关闭候选或系统内解除阻断候选。
- 论文主线调整或重大方向取舍。
- 角色结构变化。
- 同一证明链 P1-P5 的最终合并。
- 同一 MILP reformulation 的最终模型卡。
- 文献边界对贡献强度的最终判断。
- 成果型 OUT、paper progress、`main.tex` 或成果型 slides 准入。

## 4. Worker 输出 schema

每个并行 worker 的输出必须包含以下字段，优先写入结构化草案或合并表：

| 字段 | 含义 |
|---|---|
| `worker_id` | worker 稳定 ID |
| `worker_model` | 实际执行模型 |
| `task_scope` | 分配的文件、片段、文献或实验范围 |
| `source_ids` | 输入来源 ID |
| `output_ids` | 产出 rows/cards/log IDs |
| `confidence` | `low` / `medium` / `high` |
| `risk_flags` | 风险短码列表 |
| `needs_review` | `true` / `false` |
| `suggested_rd` | 候选 RD；不得直接关闭 |
| `suggested_nxt` | 候选 NXT；不得直接改变主线 |

## 5. Merge 输出 schema

merge owner 的合并结果必须包含：

| 字段 | 含义 |
|---|---|
| `merge_owner` | Auto-Gate、角色名或模型 route |
| `conflict_table` | worker 冲突清单 |
| `dedup_map` | 重复片段或重复文献合并表 |
| `accepted_rows` | 接收的结构化记录 |
| `rejected_rows` | 拒收或退回记录 |
| `needs_gate_review` | 必须升级到 gate 的条目 |
| `autogate_decision` | 系统内裁决 |
| `rd_nxt_out_updates` | 写回建议 |

## 6. 冲突升级规则

出现以下情况时，必须由 `gate` 或 `merge_owner` 复核：

- 两个 worker 对同一 claim 的状态判断冲突。
- 同一片段同时被标为主贡献和暂缓。
- 文献索引显示 `direct_existing`，但 raw map 标为主贡献候选。
- 实验结果击穿候选命题。
- proof step 状态从 `need_audit` 变为 `conditional_pass` 或 `audited_pass`。
- RD 从继续阻断变成关闭候选。
- OUT 从中间技术产物变成 `paper_eligible`。

## 7. 隐私与工具边界

- worker 必须遵守结构化副本中的 `privacy_level`、`public_allowed` 和 `redaction_rule`。
- 含原始笔记摘要、未公开证明、实验日志或论文正文片段的输入不得推送到公开镜像。
- 任何 worker 需要安装求解器、Python 包、LaTeX 工具、外部许可证或系统组件时，必须暂停并请求人类确认。
- 并行 worker 不得把缺工具的任务写成已完成；只能标为 `blocked_by_tool` 或登记待确认。

## 8. 成本预算规则

- `execution` 用于低风险、可回滚、结构化、摘要、检索初筛和日志任务。
- `review` / `gate` 用于复杂推理、新颖性边界、证明审计、claim/RD/OUT 门禁。
- 如果低风险 worker 输出没有触发风险标记，可由 Auto-Gate 抽查；若触发风险标记，必须升级复核。
- 不得为了节省成本绕过 T2/T5/T6/T7 的关键门禁。
