# Paper Storyline Canvas

状态：论文策略草案 / T0 产物
来源：PS-20260503-001；related_work_map；contribution_evidence_matrix

## Task

风不确定性下的无人机巡检路径规划，需要在能耗违约风险受控的前提下选择可执行巡检路径或调度方案。

## Challenge

风会以非线性方式影响不同航向的能耗，导致巡检方案的能耗违约事件与路径决策耦合。直接使用独立能耗盒或普通能耗空间模糊集，可能丢失航向间相关性和物理支撑结构。

## Insight

将有效风变量压缩到二维潜在空间 \(z\)，并通过能耗映射 \(G(z)\) 与巡检聚合 \(a(x)=Ax\) 表示决策相关违约事件，可以把已有 Wasserstein DRCC 工具连接到风-能耗-巡检结构。

## Contribution Hypotheses

1. 一个风-能耗相关不确定性到 DRCC 违约事件的可审计建模接口。
2. 一个二维 \(z\) 网格上的 DRCC-MILP 巡检规划候选模型。
3. 一套防止 DRCC 公式、文献边界和实验验证越权的审计与输出闭环。

## Advantage Hypotheses

- 保留风-能耗相关性，而不是把多航向能耗视为独立盒约束。
- 使用已有 DRCC 理论作为安全基础，降低理论越权风险。
- 通过网格与 MILP 接口，使模型可进入巡检优化流程。

## Fallback Narrative

若 C-010/C-011 无法构成强理论贡献，论文可降级为：

```text
一个面向风不确定无人机巡检的 DRCC-MILP 建模与审计框架，强调结构化适配、可解性和安全边界。
```

## Figure / Experiment Planning Hooks

- Pipeline figure：风样本 \(\to\) \(z\) 空间 \(\to\) \(G(z)\) 能耗映射 \(\to\) 巡检聚合 \(a(x)\) \(\to\) DRCC-MILP。
- Key table：contribution evidence matrix。
- First validation figure/table：W1 小规模一致性测试和 C-011/W1 网格验证候选。
