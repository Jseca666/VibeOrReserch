# Agents 工作流

本目录定义本项目的 agent 路由、门禁协议和产物模板。

## 角色调用建议

- 研究方向模糊：先用 `PI导师` + `research-ideation`。
- 文献问题：先用 `paper-navigator`，再用 `research-survey`。
- 公式推导：用 `formula-derivation`。
- 严格证明：用 `proof-writer`，然后必须用 `证明审计员` 审查。
- 论文规划：用 `paper-planning`。
- 论文自审：用 `paper-review`，但数学 claim 先看审批表。

## 标准流程

```text
问题/想法
  -> 建模对象卡
  -> 命题卡
  -> 假设账本
  -> 反例搜索
  -> 证明包
  -> 证明审计
  -> 形式化说明
  -> 运筹可解性说明
  -> claim审批
  -> 论文草稿
```
