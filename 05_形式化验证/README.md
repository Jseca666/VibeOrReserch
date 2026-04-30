# 形式化验证

本目录用于 Lean 形式化尝试。

## 第一版目标

- 建立最小 Lean 项目。
- 对核心命题写 Lean 风格陈述。
- 不要求第一版完成所有测度论和 Wasserstein 形式化证明。

## 路线

1. 先做有限空间版本。
2. 再写紧度量空间版本的形式化陈述。
3. 最后评估 Mathlib 对概率测度、pushforward、Wasserstein、measurable selection 的支持。

## 工具状态

已通过 `winget` 安装并初始化 `elan`。当前可用工具链：

- `Lean 4.30.0-rc2`
- `Lake 5.0.0`

验证结果：`lake build` 已通过。

若新开的终端暂时找不到 `lean` 或 `lake`，把下列路径加入当前会话：

```powershell
$env:Path = "$env:USERPROFILE\.elan\bin;$env:Path"
```
