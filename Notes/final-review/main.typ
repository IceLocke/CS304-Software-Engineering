#import "@preview/ori:0.2.2": *

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#let font = (
  main: "IBM Plex Serif",
  mono: "IBM Plex Mono",
  cjk: "Noto Serif CJK SC",
  emph-cjk: "KaiTi SC",
  math: "New Computer Modern Math",
  math-cjk: "Noto Serif CJK SC",
)

#show: ori.with(
  title: "复习笔记",
  author: "龚凌琥",
  subject: "CS304 软件工程",
  semester: "2025 春",
  date: datetime.today(),
  maketitle: true,
  font: font
)

#emph[
  本文档由南方科技大学 CS304 软件工程课程课件整理而成，授课老师：TAO Yida。
]

= 介绍

== 代码作业 v.s. 软件

#figure(
  three-line-table[
    | *项目* | *代码作业* | *软件* |
    | --- | --- | --- |
    | Artifact | 源代码 | 源代码、测试、文档、构建脚本、可执行文件 |
    | Life span | 短期、不会更新 | 长期、经常更新 |
    | 人力资源 | 1-3 人 | \~10k+ 人 |
    | 计算资源 | 笔记本电脑 | 可扩展的大型计算资源 |
    | 用户数量 | 自己、同学、老师助教 | 数百万 |
    | 质量标准 | 正确性、运行时间 | 代码质量、工程质量、经济效率、计算资源等 |
  ]
)

== 什么是软件工程

#definition[
*软件工程*是工程学的一个分支，涉及软件应用程序的设计、开发、测试和维护，同时确保所构建的软件具备正确性、一致性、成本可控、按时交付和符合需求。
]

- *工程*：确保结果化、系统化的软件开发方法
- *技术*：提供平台和工具来构建和实现软件解决方案
- *管理*：管理团队和进展，以高效运作

== 软件工程的目标

- *质量*：提升软件质量
- *效率*：提升构建软件的效率

= 软件过程和DevOps

== 软件过程

#definition[
  Software process (软件过程) is a set of related phases/activities that take place in certain order, and leads to the production of a software product. 
]

#figure(
  image("assets/software-process-cycle.png", height: 17%)
)

软件过程将复杂混乱的开发过程有序化，决定了*不同开发阶段的顺序*，以及*阶段转移的标准*。

=== 为什么需要软件过程？

开发组织需要良定义的、易于理解的、可以重复执行的软件过程。可以让新成员知道有什么工作需要执行，可以知道目前已经完成了什么，可以协助估计完成工作的时间和成本，可以遵循最佳实践。

=== 敏捷开发（Agile）和计划驱动（Plan-driven）

软件过程模型存在于一个*连续统*（_conitunuum_）中。

#remark[
  - *敏捷开发（Agile）*：计划是增量的、迭代的，更易于应对客户的需求做出计划的改变。敏捷开发团队针对小的但是有用的增量进行工作交付。需求、计划和结果都被持续的评估，因此队伍对于快速的改变具有天然的机制。
  - *计划驱动（Plan-driven）*：所有的开发活动都提前规划好，项目进度会严格对照这个预先制定的计划来衡量。
]

没有理想的软件过程。大多数组织都在*计划驱动和敏捷开发之间寻找一个平衡点。*

== 过程模型

=== 瀑布模型（Waterfall Model）

瀑布模型是*序列的、线性的*软件开发过程。

#figure(
  image("assets/waterfall.png", height: 20%)
)

- 原则上，每一个阶段都需要编写文档并通过。
- 前一个阶段必须结束，后一个阶段才能开始。阶段之间不存在重叠。

#warning-box[
  瀑布模型只有在需求明确且相对稳定时，才适合采用（或需要调整后使用）。
]

=== 增量过程模型（Incremental Process Models）

增量模型结合了线性、平行的过程流。

- 每一个线性序列对软件进行一系列的改进。
- 第一个增量常常是核心产品的基本要求。后续会继续增加辅助的特性。

#figure(
  image("assets/incremental-process.png", height: 25%)
)

#tip-box[
  增量模型通常可以：

  - 减少因需求改变的成本；
  - 有益于采取用户反馈，并改进；
  - 在一个较为小的迭代中进行测试和 debug；
  - 更快速地交付和部署可用的软件；
  - 在无法配备足够人员完成完整实施时尤其有用。

  但是，增量模型需要更好的计划和设计，随着新增功能的不断加入，系统架构往往*会逐步退化*。除非投入精力进行*重构*以优化软件，否则频繁的变更容易破坏其结构完整性。后续软件变更的整合会变得越来越困难且成本高昂。
]

=== 进化过程模型（Evolutionary Process Models）

进化模型是*迭代的*（_iterative_），设计初衷就是支持产品随时间逐步演进。

1. *原型开发（Proptotyping）*：适用于客户只给了一些宽泛的软件目标，没有功能和特性的详细需求。
  1. 开发者经常为了让原型快速工作在实现上妥协。
  2. 原型常常被舍弃，实际的软件在质量上有明显提升。
#figure(
  image("assets/prototyping.png", height: 20%)
)
#tip-box[
   原型设计可以用于设计 UI，或者高技术含量的系统，用来快速进行 demo 展示。
]

2. *螺旋模型（Spiral Model）*：结合了瀑布模型可控的、系统化的方面，以及迭代的性质。
  1. 螺旋模型中，软件在一系列的进化的发行中开发。
  2. 在早期的迭代中，发行可能是一个模型或者原型。
  3. 在之后的迭代中，会有更加完善的版本。
#figure(
  image("assets/spiral.png", height: 30%)
)

#tip-box[
  螺旋模型通常可以：

  - 高效的减少潜在的风险；
  - 出于迭代的性质，特性可以更新；
  - 适用于高风险项目，比如银行、医疗系统。

  但是，螺旋模型的风险评估高度依赖专家，复杂且成本高昂。
]

== Scrum 模型

=== Scrum 角色

- *产品负责人*（Product Owner）：定义和调整产品结构，选择接受或者拒绝工作结果。
- *Scrum Master*：教导团队，实施 Scrum 价值和原理。
- *Scrum Team*：跨职能（设计、开发、测试等）的自组织小团队（通常5-9人），负责交付可用的产品增量。

=== Scrum 过程模型

- *Product backlog*：项目负责人制定并优化一些用户的需求。
- *Sprint backlog*：接着，整个团队参加 *Sprint Planning Meeting*，来选择他们将在下一个 sprint 中需要交付的物品，形成了 sprint backlog。
- *Sprint*：一个时间段，通常为 1-4 周，scrum team 专注于交付潜在可发布的产品增量。‘
- *Daily scrum*：每天队伍进行一个 15 分钟的短会来交流进展，和后续计划，还有分锅。
- *Sprint review*：Scrum Team 向客户展示他们在 sprint 中已经完成的东西，来判断实现是否正确，最后制定下一个 sprint 中改进的计划。

#figure(
  image("assets/scrum.png")
)

#tip-box[
  *Scrum 工具*
  - *Scrum 看板*：可视化 sprint backlog，按照传统分成 todo、进行中和完成。
  - *燃尽图*（Burndown charts），展示随着时间，剩余的任务量。
  #figure(image("assets/burndown-chart.png"))
]

=== 总结

- *角色*：产品负责人、scrum master、scrum Team
- *仪式*：sprint planning、daily scrum、sprint review、sprint retrospective
- *制品*：product backlog、sprint backlog、burndown charts

== DevOps

