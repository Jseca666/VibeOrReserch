# 论文草稿

本目录存放中文论文草稿、LaTeX 版本和图表说明。

## 输出目录

- `paper_strategy/`：论文主题、贡献假设、related work map、贡献证据矩阵和审稿风险；不是论文正文。
- `technical_notes/`：内部 LaTeX 技术说明、证明链、proof package、theorem card 和 appendix candidate。
- `paper_progress/`：论文 LaTeX 进度片段，先于正式改写 `main.tex`。
- `slides/`：beamer、PPTX 和 markdown slides 等阶段汇报产物。

所有正式输出产物应先登记到 `08_agents工作流/产物产出队列.md`，并遵守 `08_agents工作流/产物输出闭环协议.md`。
成果型 `paper_progress/` 和 `slides/` 必须能追溯到 `paper_strategy/` 中的论文锚点或贡献证据矩阵。

## 写作规则

- 当前主线只关注分布鲁棒机会约束及其 MILP 嵌入；SRI/CVaR/SOC 暂作为背景、对照或后续扩展。
- 只有通过 claim 审批的结论才能写成强命题。
- 条件证明必须完整列出条件。
- 未完成证明写成 conjecture、remark 或 proof sketch。
- 论文中的每个强 claim 应能回指到 `00_总览索引/claim审批表.md`。
- `main.tex` 当前仍视为样板稿；未通过门禁的内容先进入 `paper_progress/`、`technical_notes/` 或 `slides/`，不得直接写成正文强结论。
