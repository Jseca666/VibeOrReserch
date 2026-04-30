设 $W_t\in\mathbb R^d$ 为任务相关时空位置上的未来风矢量随机变量，其未知概率分布记为 $P_t=\mathrm{Law}(W_t)$。给定当前时次的集合预报成员 $\{w_t^{(m)}\}_{m=1}^M$，本文以其诱导的离散经验分布
$$
\hat Q_t=\sum_{m=1}^M \pi_{m,t}\delta_{w_t^{(m)}}
$$
作为名义预测分布中心，并构造 Wasserstein ambiguity set
$$
\mathcal P_t=
\left\{
P\in\mathcal P_2(\mathbb R^d):
W_1(P,\hat Q_t)\le \rho_t,\ 
\operatorname{supp}(P)\subseteq \mathcal W_t
\right\}.
$$
其中，半径 $\rho_t$ 由历史 forecast–verification 数据校准，支撑集合 $\mathcal W_t$ 由当前 ensemble 的几何结构、历史分布失配尺度以及物理边界共同确定。该构造使得当前预测信息能够作为名义中心进入模型，同时允许真实风分布在一个数据驱动且物理合理的范围内偏离名义预测分布。