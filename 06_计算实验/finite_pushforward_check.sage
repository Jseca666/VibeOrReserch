# 有限空间推前模糊集检查样例
# 需要在 SageMath 环境中运行：
#   sage finite_pushforward_check.sage

from collections import defaultdict

# 有限风状态点，用二维坐标表示
W = [(0, 0), (1, 0), (0, 1), (1, 1)]
w_nominal = [(0, 0), (1, 1)]
pi = [0.5, 0.5]

# 简单推前映射：按坐标和分组
def Phi(w):
    return w[0] + w[1]

Xi = sorted(set(Phi(w) for w in W))

def sqdist(a, b):
    return sum((a[k] - b[k]) ** 2 for k in range(len(a)))

# 计算 c_i(xi)
c = []
for wi in w_nominal:
    ci = {}
    for xi in Xi:
        fiber = [w for w in W if Phi(w) == xi]
        ci[xi] = min(sqdist(w, wi) for w in fiber)
    c.append(ci)

print("Xi =", Xi)
print("c_i(xi) =", c)

# 这个脚本只是最小 sanity check；后续可加入 LP 求解来验证 lift 成本等式。
