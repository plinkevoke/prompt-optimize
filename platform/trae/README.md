# TRAE 适配说明

本 Skill 遵循 Agent Skills 开放规范，TRAE 原生支持，直接放入 `.trae/skills/` 目录即可使用。

## 安装方式

### 方式一：项目级安装（推荐）
将整个 Skill 目录复制到项目的 `.trae/skills/` 目录下：

```powershell
# Windows PowerShell
New-Item -ItemType Directory -Force -Path .trae\skills
Copy-Item -Recurse -Path . -Destination .trae\skills\prompt-optimizer
```

### 方式二：安装脚本
运行项目根目录的 `install.ps1` 脚本，自动部署到当前项目：

```powershell
.\install.ps1
```

## 使用方式

### 斜杠命令调用
```
/optimize 帮我写一个奶茶店的宣传文案
/optimize --roses --detail 写一篇品牌故事
/optimize --quick 想几个广告语
```

### 自动触发
当你提到"优化 prompt"、"改进提示词"等相关内容时，TRAE 会自动识别并加载该 Skill。

## 支持的参数

| 参数 | 作用 |
|------|------|
| `--crispe` / `--roses` / `--structured` | 指定优化框架 |
| `--quick` / `--fast` | 快速模式：不追问 + 只输出简洁版 |
| `--single` | 单版本输出（默认平衡实用版） |
| `--detail` / `--full` | 仅输出专业深度版 |
