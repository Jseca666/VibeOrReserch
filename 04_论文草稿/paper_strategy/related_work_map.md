# Related Work Map

状态：论文策略草案 / T0 产物
来源：文献分类总索引；文献边界表；NXT-20260502-004；NXT-20260502-006
禁止用途：不得替代文献卡、文献边界表或 BibTeX

## 1. Wasserstein DRO / DRCC 理论

作用：提供最坏违约概率、样本到 unsafe set 距离、对偶或 reformulation 的理论来源。

当前判断：

- 通用 Wasserstein DRCC 不是本项目原创点。
- C-010/W1 应作为已有理论在风-能耗巡检结构中的适配基础。
- 需要继续精读代表文献以固定定理条件、支撑、成本和风险阈值口径。

## 2. Strong MIP / MILP Reformulation

作用：界定 DRCC 与 big-M/MIP 嵌入的已有结果边界。

当前判断：

- big-M/MIP 强 formulation 文献可能覆盖部分 C-011 表达方式。
- 本项目可写贡献不应是“首次 MIP 化 DRCC”，而应是风-能耗相关结构与巡检路径变量的接口设计。

## 3. UAV 巡检路径 / Arc Routing

作用：提供巡检路径决策、路径变量、任务覆盖和 benchmark 语境。

当前缺口：

- 需要主动收集 UAV inspection、arc routing、path planning 的代表性模型和 baseline。
- 需要判断本项目 MILP 与已有巡检路径模型相比新增了什么风险约束结构。

## 4. 风不确定性与无人机能耗模型

作用：支撑风变量、功耗模型 \(P(V)\)、能耗映射 \(\Phi\) 或 \(G(z)\) 的物理合理性。

当前缺口：

- 需要把风预测误差、有效二维风、风-能耗映射与无人机能耗文献连接起来。
- 需要明确哪些能耗模型是假设，哪些有文献支撑，哪些只是内部推导。

## 5. 本文交叉点

候选交叉点：

```text
Wind-aware UAV inspection + energy-correlated uncertainty + Wasserstein DRCC + MILP planning.
```

可写方向：

- 不是通用 DRCC 定理创新。
- 不是通用 UAV routing 创新。
- 可能是把风-能耗相关不确定性以可审计 DRCC-MILP 方式嵌入巡检规划。

## 6. 后续文献任务

| 文献方向 | 目标 | 触发任务 |
|---|---|---|
| Wasserstein DRCC 代表定理 | 固定 C-010/W1 条件和已有边界 | T5 / 证明审计 |
| UAV inspection / arc routing | 固定路径规划 baseline 和任务语境 | T0 / T5 |
| Wind-aware UAV energy | 固定风-能耗建模文献基础 | T0 / T5 |
| MILP reformulation / big-M | 固定 C-011 可写边界 | T3 / T5 |
