# Lean 风格陈述：命题1

## 目标

本文件不声称已经 Lean 形式化。它只把命题拆成形式化友好的对象，并指出第一版 Lean 化障碍。

## Lean 风格对象

```text
W : Type
metric_space W
compact_space W

Xi : Type
metric_space Xi

Phi : W -> Xi
continuous Phi

N : Nat
pi : Fin N -> Real
w : Fin N -> W
sum_pi : sum pi = 1
pi_nonneg : forall i, 0 <= pi i

Qhat : ProbabilityMeasure W
Qhat = sum_i pi_i * dirac (w i)
```

需要定义：

```text
pushforward_ambiguity_set eps
latent_cost_set eps
c i xi = inf { dist w (w i)^2 | Phi w = xi }
```

## 形式化难点

1. Mathlib 中概率测度、pushforward、Wasserstein 距离和紧空间选择定理的接口需要确认。
2. `c_i` 作为 fiber 上 infimum 的可测性需要单独形式化。
3. 从 \(R_i\) 构造 lift \(\mu_i\) 需要可测选择，Lean 形式化成本高。
4. 若先做有限版本，形式化会简单很多：把 \(\mathcal W\)、\(\Xi\) 都设为有限类型，推前和成本都变成有限和。

## 建议形式化路线

第一阶段：形式化有限空间版本，验证结构和等价方向。

第二阶段：形式化紧度量空间版本的命题陈述，不强求完整证明。

第三阶段：根据 Mathlib 可用定理决定是否推进可测选择与 Wasserstein 正式证明。
