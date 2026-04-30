# 计算实验

本目录用于 SageMath/Python 反例搜索、有限例子和 DRO 数值验证。

## 第一版目标

1. 构造有限风状态空间与推前映射。
2. 验证命题1在有限空间中的线性规划结构。
3. 为风险约束建立小规模数值检查。

## 工具状态

当前 Windows 侧未检测到 SageMath 和真实 Python 科研环境。已尝试安装 WSL/Ubuntu；WSL 组件安装推进，但 Ubuntu 发行版安装报错 `不能访问网络位置`，因此 SageMath 尚未可用。

后续建议：

1. 重启 Windows 后再次运行 `wsl --install -d Ubuntu`。
2. 完成 Ubuntu 首次用户初始化。
3. 在 Ubuntu 内用 conda-forge 安装 SageMath。
