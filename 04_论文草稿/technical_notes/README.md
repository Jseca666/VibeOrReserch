# Technical Notes

本目录是项目的中间技术产物层，存放内部 LaTeX 技术说明、证明链、proof package、theorem card 和 appendix candidate。

这里的产物用于沉淀可审计技术链，不属于论文草稿层，不等于成果型组会 PPT，不自动升级 claim，不关闭研究债务。

## 承接对象

- 已验证推理片段。
- 系统内候选命题。
- 反例测试通过片段。
- 逐步数学推导日志。
- 反例或失败机制推理笔记。
- 推导、文献、脚本结果和 RD 的验证索引。
- 文献支撑矩阵和文献边界说明。
- 待审计证明链。
- 需要证明审计员复核的 technical note 或 proof package。

## 子目录

| 子目录 | 用途 |
|---|---|
| `derivation_logs/` | 记录逐步数学推导，每一步标注类型、假设、来源和待审计边界 |
| `counterexample_notes/` | 记录反例构造、失败机制、击穿对象和修正方式 |
| `validation_records/` | 串联推导、文献、测试结果、EVO、OUT 和未关闭 RD |
| `theorem_cards/` | 单个命题的 LaTeX 状态卡 |
| `proof_packages/` | 供证明审计员复核的证明包 |
| `appendix_candidates/` | 尚未进入论文附录的候选材料 |

## 状态标签

- `系统内候选`
- `待审计`
- `文献已有`
- `不可写强 claim`
- `可内部汇报`
- `被 RD 阻断`

## 使用规则

- 未通过证明审计和文献边界审查的内容不得进入 `main.tex` 的强定理环境。
- technical note 可以记录条件命题、证明草案、边界例和文献接口，但必须标注 claim 状态。
- derivation log 必须包含具体公式链和步骤分类，不能只写状态摘要。
- counterexample note 必须说明反例构造和失败机制，不能只写“测试失败”。
- validation record 必须能把推导步骤追溯到文献、脚本、EVO、OUT 和 RD。
- proof package 只作为证明审计输入，不代表定理已证。
- appendix candidate 只有经过 Auto-Gate 成果型输出准入后才可进入论文附录草案。
- 中间技术产物进入 `paper_progress/`、`main.tex` 或 `slides/` 前，必须通过证明审计、文献边界、实验或反例门禁，并由 Auto-Gate 标记为成果型输出候选。
