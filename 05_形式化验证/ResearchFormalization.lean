/-!
最小 Lean 项目入口。

当前目标是先保留一个可构建的形式化验证位置。核心数学命题会先写成
Lean 风格陈述，再逐步推进到可检查证明。
-/

namespace ResearchFormalization

theorem sanity_check : True := by
  trivial

end ResearchFormalization
