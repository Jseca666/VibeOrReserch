# Codex 角色调用协议

本文件是对现有 agents 工作流的增量补充，用于规定 Codex 如何按任务类型调用项目角色和 EvoSkills。

本协议不重写 `角色职责矩阵.md`、`研究债务队列.md`、`角色变更记录.md` 和 `README.md` 中已有规则。若发生冲突，以 `AGENTS.md` 的全局指令、`角色职责矩阵.md` 的职责边界和 `研究债务队列.md` 的债务严重性机制为准。

当前主线仍为 DRCC-MILP。C-010/C-011 是当前优先 claim 示例，不是调度协议边界；未来新 claim、新理论方向、新实验任务和新反例任务均按本协议进入。

本协议规定 T1-T7 如何调度；每轮任务如何从输入触发运行到 evolution report 和下一轮任务包，见 `自进化自动工作闭环协议.md`。

## 1. 四层边界

| 层级 | 定位 | 边界 |
|---|---|---|
| Codex | 执行与推理主体 | 负责组织任务、生成草案、调用角色和技能，但不拥有最终裁决权 |
| 项目角色系统 | 责任、门禁、审计和裁决层 | 负责签收、审查、阻断、建议和 PI 裁决 |
| EvoSkills | 能力工具箱 | 只增强检索、推导、证明、实验、写作和记忆能力；不签收、不裁决、不关闭债务 |
| EvoScientist/evo-memory | 长期记忆层 | 记录跨周期经验，不替代研究债务队列、claim 审批表和 PI 裁决 |

## 2. 调用包轻重分级

### 2.1 轻量任务调用包

适用于普通整理、局部问答、公式清理、文献小结和实验草案初拟等不改变 claim 状态、不关闭关键债务、不改变角色结构的任务。

```text
任务类型：
调用角色：
产物：
新增或更新债务：无 / 有
```

### 2.2 关键任务调用包

以下情况必须使用关键任务调用包：claim 状态变化、论文强 claim 升级、关闭 `阻塞` 或 `claim阻断` 债务、修改 DRCC-MILP 主线、新增/弱化/合并/暂缓/激活角色、将实验结论写成论文贡献、将理论命题写入论文主定理/主模型/主 claim。

```text
任务类型：
当前对象：
关联 claim：
是否可能产生新 claim：
调用角色：
调用 EvoSkills：
手工项目角色审查：
必须产物：
门禁检查：
研究债务影响：
研究记忆写回：
是否需要 PI导师 裁决：
```

## 3. 上层任务类型

| 任务类型 | 名称 | 适用场景 | 默认角色组合 | 可调用 EvoSkills | 必须产物 | 门禁检查 | 研究债务记录 | PI裁决条件 |
|---|---|---|---|---|---|---|---|---|
| T1 | 公式推导整理 | 整理变量、映射、违约事件、距离表达、符号冲突和公式链条 | `风-能耗物理建模专家`、`符号-假设账本管理员`；涉及 DRCC 时加入 `DRCC reformulation 专家` 和 `Wasserstein-DRO副导师` | `formula-derivation`、`mermaid-diagram` | 公式链条、符号冲突清单、假设缺口清单、候选后续任务 | 域和值域明确；维度一致；等价、近似、保守替代分开写；\(W_1/W_2\) 与半径阶数不得混用 | 未补假设、未验证恒等式、支撑集不清、符号冲突进入 `待补假设` 或 `待做反例` | 改变主线对象或 claim 强度时 |
| T2 | 理论命题推进 | 将公式整理推进为定义、引理、命题、定理、证明包或反例任务 | `DRCC reformulation 专家`、`Wasserstein-DRO副导师`、`证明审计员`、`反例搜索员`、`符号-假设账本管理员` | `formula-derivation`、`proof-writer`、`research-lit`、`research-review` | 命题卡、证明草案、假设清单、反例审查记录、审计意见 | 坏集闭性、支撑集、强对偶、半径阶数、有限/连续支撑差异和离散化条件必须写清 | 缺证明、缺外部定理、缺反例审查、仅有直觉推导时登记 `阻塞`；影响强 claim 时登记 `claim阻断` | 命题进入 claim 升级、主定理或论文强贡献时 |
| T3 | 优化模型推进 | 将 DRCC reformulation、能耗违约事件、网格化或路径决策嵌入 MILP/算法模型 | `大规模MILP算法专家`、`运筹最优化副导师`、`DRCC reformulation 专家`、`计算实验与Benchmark设计专家` | `formula-derivation`、`proof-writer`、`research-lit`、`experiment-plan`、`mermaid-diagram` | 模型卡、变量表、约束表、目标函数说明、离散化说明、求解流程图、可解性风险清单 | 连续精确、离散精确、保守近似必须区分；big-M 来源必须说明；不能把网格模型写成连续支撑精确 reformulation | big-M 无依据、离散支撑覆盖不足、规模不可控、求解器行为不明时登记 `待补假设` 或 `待验证实验` | 模型成为论文主贡献、替换主线或改变 claim 强度时 |
| T4 | 计算实验与反例验证 | 小规模 LP/MILP 验证、反例搜索、消融实验、benchmark 设计、求解器日志分析、out-of-sample 风险检查 | `离散DRCC验证实验员`、`反例搜索员`、`计算实验与Benchmark设计专家`、`实验与Benchmark副导师` | `experiment-plan`、`experiment-pipeline`、`experiment-craft`、`analyze-results`、`result-to-claim` | 实验协议、脚本说明、输入输出表、求解日志摘要、异常记录、结论边界 | 小规模实验不能替代理论证明；实验指标必须对应 claim；随机种子、实例来源、MIP gap、违约率、运行时间等信息要可复查 | 实验失败、反例出现、基线缺失、不可复现、指标不对应 claim 时登记 `待验证实验` 或 `待做反例` | 实验结果支持或否定强 claim、改变主线或触发角色变更时 |
| T5 | 文献边界与新颖性审查 | 判断理论命题、模型、算法或实验 claim 是否已有，确定 related work 边界和审稿风险 | `论文边界与新颖性副导师`、相关副导师；风不确定性/无人机文献加入 `风-能耗物理建模专家` | `paper-navigator`、`research-survey`、`research-lit`、`novelty-check`、`research-review` | 文献分类索引、文献卡、文献边界表、已有结果对照表、新颖性风险清单 | 不得把已有 DRCC/DRO 结果、已有无人机巡检模型或已有 routing 结果包装为原创强 claim | 文献覆盖不足、核心结果可能已有、related work 未定位时登记 `待查文献`；影响强 claim 时登记 `claim阻断` | claim 升级、降级、改名、删除或贡献重划时 |
| T6 | 论文 claim 升级 | 将命题、模型、实验结果或文献边界结论升级为论文 claim | `PI导师`、相关副导师、`证明审计员`、`论文边界与新颖性副导师`、`研究债务协调员` | `result-to-claim`、`paper-planning`、`paper-review`、`paper-write`、`paper-compile`、`novelty-check`、`research-review` | claim 升级建议、证据包链接、未关闭债务清单、PI待裁决项 | 存在未关闭 `claim阻断` 债务时不得升级强 claim；证明审计、文献边界、实验支撑必须与 claim 类型匹配 | 升级被阻断时记录阻断原因、负责人角色、关闭条件和 PI 裁决需求 | 必须由 `PI导师` 裁决 |
| T7 | 角色/主线自进化 | 角色职责不匹配、任务反复卡住、主线需要调整、需要新增或暂缓角色、需要整理跨周期经验 | `PI导师`、`研究债务协调员`、相关副导师 | `evo-memory`、`research-review`、`paper-planning`、`mermaid-diagram` | 角色变更提案、影响 claim 清单、关联债务、PI裁决记录、记忆写回建议 | 角色变更必须落档；副导师、执行专家、研究债务协调员和 EvoSkills 不能自行改变角色结构 | 角色缺口、职责冲突、反复失败模式登记为 `待更新角色` 或写入研究记忆 | 必须由 `PI导师` 裁决 |

补充边界：

- T3 中的 `proof-writer` 仅在涉及模型等价、有效不等式、reformulation 正确性或离散化精确性证明时调用；普通模型卡、变量表和约束表不强制调用。
- T4 中的 `result-to-claim` 只能生成候选 claim 线索；任何论文 claim 升级必须转入 T6，并由 `PI导师` 裁决。
- 涉及风预测样本、支撑集、Wasserstein 半径或数据驱动校准时，加入 `风模糊集半径与数据校准专家`。

## 4. 角色-EvoSkills 最小映射

EvoSkills 只增强角色能力，不替代角色职责。下表列出优先使用的真实技能；后续若新增本机真实技能，可经确认后补充。

| 项目角色 | 优先调用技能 | 必须保留的角色判断 |
|---|---|---|
| `PI导师` | `research-review`、`paper-planning`、`result-to-claim` | 最终裁决权不能由技能替代 |
| `DRCC reformulation 专家` | `formula-derivation`、`proof-writer`、`research-lit` | reformulation 是否成立仍需审计 |
| `Wasserstein-DRO副导师` | `paper-navigator`、`research-survey`、`research-lit`、`research-review` | 定理适用条件和 DRO 边界需角色审查 |
| `大规模MILP算法专家` | `formula-derivation`、`research-lit`、`experiment-plan`、`mermaid-diagram` | MILP 可解性、离散化边界和 big-M 依据需角色审查 |
| `证明审计员` | `proof-writer`、`research-review` | 技能可辅助改写证明，但审计结论由角色给出 |
| `反例搜索员` | `formula-derivation`、`experiment-plan`、`analyze-results` | 反例任务以手工项目角色审查为主 |
| `计算实验与Benchmark设计专家` | `experiment-plan`、`experiment-pipeline`、`experiment-craft`、`analyze-results` | 实验是否支撑 claim 仍需角色判断 |
| `论文边界与新颖性副导师` | `paper-navigator`、`research-survey`、`research-lit`、`novelty-check`、`research-review` | 新颖性结论不能由技能单独签收 |
| `论文叙事与审稿策略顾问` | `paper-planning`、`paper-review`、`paper-write`、`paper-compile` | 只能写已过门禁或明确标注为待审的内容 |
| `研究债务协调员` | `evo-memory` | 只能登记、催办、汇总、阶段小结；不做技术证明，不关闭关键债务 |

## 5. EvoSkills 使用原则

- 技能不签收：EvoSkills 输出不能直接标记为 `通过`、`有条件通过` 或 `不通过`。
- 技能不裁决：EvoSkills 不能改变 claim 状态、不能关闭债务、不能改变角色结构。
- 技能不替代 PI：任何 claim 升级、主线改变、角色新增或弱化，必须由 `PI导师` 裁决。
- 技能必须归属角色：每次调用 EvoSkills 应说明服务于哪个角色产物。
- 技能输出要进门禁：公式、证明、实验和文献结果必须进入对应角色验收口径。

## 6. Claim 升级阻断规则

任何论文强 claim 升级前，必须检查：

```text
claim 审批表
研究债务队列
证明审计意见
文献边界意见
实验支撑情况
```

若存在未关闭 `claim阻断` 债务：

```text
不得升级论文强 claim
不得写入摘要、引言贡献列表或主结论
不得由写作角色包装为已完成贡献
必须回到研究债务队列处理
```

## 7. 当前优先 Claim 使用方式

正确写法：

```text
任务类型：T2 理论命题推进
关联 claim：C-010
```

或：

```text
任务类型：T4 计算实验与反例验证
关联 claim：C-011
```

错误写法：

```text
进入 C-010 工作流
进入 C-011 工作流
```

所有未来 claim，例如 C-020、新 DRCC 命题、新实验任务、新文献边界任务，均按 T1-T7 进入。
