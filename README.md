# Prompt Optimizer · 提示词优化器

> 一键优化你的提示词，让 AI 输出更专业、更准确、更高质量
>
> 遵循 [Agent Skills](https://agentskills.io) 开放规范，支持多平台部署

---

## 核心特性

- 🚀 **一键优化**：输入 `/optimize` + 原始 prompt，即刻获得专业优化版本
- 🎯 **三大框架**：CRISPE（全面型）、ROSES（创意文案型）、结构化多层优化（通用型）
- 🤖 **智能识别**：自动分析内容，匹配最佳优化框架
- 💬 **渐进式追问**：信息不足时主动提问补充，优化效果更精准
- 📊 **多版本输出**：一次生成 3 个不同深度版本（专业/平衡/简洁），按需选择
- ✏️ **灵活调整**：支持版本融合、修改调整、切换框架，直到满意
- 📚 **模板库**：内置 10 个常用场景专业模板（文案 + 创意）
- 🌐 **跨平台**：支持 TRAE / Claude Code / VS Code (Copilot) 等多平台
- ⚡ **直接执行**：确认后可直接用优化后的 prompt 执行任务

---

## 支持平台

| 平台 | 支持方式 | 斜杠命令 | 渐进式加载 | 模板库 |
|------|---------|---------|-----------|--------|
| **TRAE** | 原生 Skill | ✅ `/optimize` | ✅ | ✅ |
| **Claude Code** | 原生 Skill | ✅ `/optimize` | ✅ | ✅ |
| **VS Code (Copilot)** | 自定义指令 | ❌ | ❌ | ❌ |

---

## 快速开始

### TRAE / Claude Code

```bash
# 克隆仓库
git clone https://github.com/plinkevoke/prompt-optimize.git
cd prompt-optimize

# 一键安装到当前项目
.\install.ps1
```

然后在对话中使用：
```
/optimize 帮我写一个奶茶店的宣传文案
```

### VS Code / GitHub Copilot

1. 打开 VS Code 设置
2. 搜索 "Copilot Custom Instructions"
3. 将 `platform/vscode-copilot/copilot-instructions.txt` 的内容复制到自定义指令中

使用方式：
```
请帮我优化这个提示词：帮我写一个奶茶店的宣传文案
```

---

## 参数说明

| 参数 | 作用 |
|------|------|
| `--crispe` / `--roses` / `--structured` | 指定优化框架 |
| `--quick` / `--fast` | 快速模式：不追问 + 只输出简洁版 |
| `--single` | 单版本输出（默认平衡实用版） |
| `--detail` / `--full` | 仅输出专业深度版 |

### 示例

```
/optimize --roses --detail 写一篇品牌故事
/optimize --quick 想几个广告语
/optimize --single --crispe 写产品需求文档
```

---

## 三版本策略

| 版本 | 定位 | 详细程度 | 适用人群 |
|------|------|---------|---------|
| **A · 专业深度版** | 详细全面 | ⭐⭐⭐⭐⭐ | 追求极致质量、复杂任务 |
| **B · 平衡实用版** ⭐推荐 | 均衡适中 | ⭐⭐⭐ | 大多数用户 |
| **C · 简洁高效版** | 精简快速 | ⭐ | 简单任务、追求效率 |

---

## 模板库

### 文案写作类
1. 公众号/自媒体文章
2. 小红书种草文案
3. 产品广告语/品牌 Slogan
4. 短视频脚本/口播文案
5. 邮件/通知/公告

### 创意生成类
1. 故事/小说创作
2. 品牌命名/标语
3. 活动策划方案
4. 广告语创意
5. 诗歌/歌词创作

---

## 项目结构

```
prompt-optimizer/
├── SKILL.md                  # Skill 入口文件（Agent Skills 标准）
├── README.md                 # 本文件
├── CHANGELOG.md              # 版本变更记录
├── build.ps1                 # 构建脚本
├── install.ps1               # 安装脚本
├── .gitignore
├── references/               # 参考资料（按需加载）
│   ├── crispe-framework.md   # CRISPE 框架详解
│   ├── roses-framework.md    # ROSES 框架详解
│   ├── structured-framework.md  # 结构化优化框架详解
│   ├── clarification-mechanism.md  # 渐进式追问机制
│   └── multi-version-output.md    # 多版本输出机制
├── templates/                # 场景模板库
│   ├── copywriting/          # 文案写作类（5个）
│   └── creative/             # 创意生成类（5个）
├── assets/                   # 静态资源
├── scripts/                  # 辅助脚本
├── docs/                     # 项目文档
│   ├── design.md             # 设计文档
│   └── usage-guide.md        # 使用指南
└── platform/                 # 平台适配层
    ├── trae/                 # TRAE 适配说明
    ├── claude/               # Claude Code 适配说明
    └── vscode-copilot/       # VS Code / Copilot 适配
```

---

## 构建与发布

```bash
# 构建所有平台包
.\build.ps1

# 输出到 dist/ 目录
# dist/
# ├── prompt-optimizer/    # Agent Skills 标准包
# ├── claude-code/         # Claude Code 版
# ├── trae/                # TRAE 版
# └── vscode-copilot/      # VS Code / Copilot 版
```

---

## 文档

- [设计文档](docs/design.md) — 架构设计、框架说明、实现原理
- [使用指南](docs/usage-guide.md) — 详细用法、技巧、常见问题
- [CHANGELOG](CHANGELOG.md) — 版本变更记录

---

## 后续规划

- [ ] 新增代码开发类模板
- [ ] 新增数据分析类模板
- [ ] 提示词质量评分功能
- [ ] 用户自定义模板功能
- [ ] 历史优化记录
- [ ] 更多平台适配（Cursor / Windsurf / ChatGPT GPTs）

---

## License

MIT
