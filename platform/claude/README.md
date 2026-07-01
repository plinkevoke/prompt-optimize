# Claude Code 适配说明

本 Skill 遵循 [Agent Skills](https://agentskills.io) 开放规范，Claude Code 原生支持，无需额外转换。

## 安装方式

### 方式一：项目级安装（推荐）
将整个 Skill 目录复制/链接到项目的 `.claude/skills/` 目录下：

```bash
# Windows (PowerShell)
Copy-Item -Recurse . "$env:USERPROFILE\.claude\skills\prompt-optimizer"

# 或项目级
New-Item -ItemType Directory -Force -Path .claude\skills
Copy-Item -Recurse . .claude\skills\prompt-optimizer
```

### 方式二：全局安装
复制到用户全局目录，所有项目都可用：

```bash
# Windows
Copy-Item -Recurse . "$env:USERPROFILE\.claude\skills\prompt-optimizer"

# macOS / Linux
cp -r . ~/.claude/skills/prompt-optimizer
```

## 使用方式

### 斜杠命令调用
```
/optimize 帮我写一个奶茶店的宣传文案
/optimize --roses --detail 写一篇品牌故事
```

### 自动触发
当你提到"优化 prompt"、"改进提示词"等相关内容时，Claude Code 会自动识别并加载该 Skill。

## 支持的扩展字段

本 Skill 使用了以下 Claude Code 扩展字段：

| 字段 | 值 | 说明 |
|------|---|------|
| `when_to_use` | 用户要求优化提示词时 | 帮助 Claude 自动判断何时加载 |
| `allowed-tools` | Read Grep Glob | 预批准 Skill 可使用的工具 |
| `license` | MIT | 开源协议 |

## 目录结构

```
prompt-optimizer/
├── SKILL.md              # 入口指令
├── references/           # 框架详解（按需加载）
├── templates/            # 场景模板
│   ├── copywriting/
│   └── creative/
├── assets/               # 静态资源
└── scripts/              # 辅助脚本
```
