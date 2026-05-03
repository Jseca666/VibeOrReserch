# Reviewer Risk Register

状态：论文策略草案 / T0 产物
来源：paper-planning 预拒稿思路；文献边界表；EVO-20260502-016；EVO-20260502-019

| 风险 | 可能审稿意见 | 当前应对 | 后续证据需求 |
|---|---|---|---|
| 新颖性不足 | Wasserstein DRCC reformulation 已有，不构成理论贡献 | 降级 C-010/W1 为技术基础或附录候选 | related work map 明确“已有理论 + 本项目结构化适配” |
| 模型贡献不清 | 风-能耗映射和巡检 MILP 的新增点不明确 | 用 contribution evidence matrix 绑定 \(G(z)\)、\(a(x)=Ax\)、C-011/W1 | C-011/W1 模型卡、脚本验证和文献对照 |
| 实验支撑不足 | 只有小规模一致性测试，没有正式 benchmark | 小规模测试只作验证日志 | 设计 UAV 巡检实例、baseline、指标和 stress test |
| 理论条件不完整 | 坏集闭性、支撑、对偶和 \(W_1/W_2\) 边界可能不清 | 保留 RD，不升级 claim | 证明审计报告和 proof package |
| 论文叙事过散 | 技术材料很多，但主线不聚焦 | T0 先固定 task、challenge、insight、contribution、advantage | paper storyline canvas 和 pipeline figure 草图 |

## 保守策略

- 先窄后宽：优先写风-能耗-巡检结构化适配，不写通用 DRCC 创新。
- 先证据后输出：没有文献边界、证明审计或实验支撑，不进入成果型 paper progress。
- 先相关性后性能：若 benchmark 暂不成熟，先证明模型能保留风-能耗相关结构并可解。
