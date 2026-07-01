# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-07-01

### Added
- **跨平台支持**：遵循 Agent Skills 开放规范，支持多平台部署
- **平台适配层**：
  - Claude Code（原生兼容）
  - TRAE（原生兼容）
  - VS Code / GitHub Copilot（纯文本自定义指令）
- **构建系统**：`build.ps1` 一键构建所有平台包
- **安装脚本**：`install.ps1` 一键安装到当前项目或全局
- **渐进式披露架构**：SKILL.md 瘦身，详细内容拆分到 `references/` 目录
- **标准化 Frontmatter**：遵循 Agent Skills 规范，添加 `when_to_use`、`allowed-tools`、`license`、`metadata` 等字段
- **平台文档**：各平台独立的安装和使用说明

### Changed
- 重构目录结构，符合 Agent Skills 标准
- SKILL.md 从 460+ 行精简至 ~100 行（入口文件）
- 模板库移至项目根目录 `templates/`
- 设计文档和使用指南移至 `docs/`

### Fixed
- 修复 PowerShell 脚本中文编码问题

## [1.1.0] - 2026-07-01

### Added
- **渐进式追问机制**：信息不足时主动提问补充，最多 1-2 轮，可随时跳过
- **多版本输出**：默认生成 3 个版本（专业深度版 / 平衡实用版 / 简洁高效版）
- **版本融合**：支持融合多个版本的特点（如"用A的详细+B的语气"）
- **版本控制参数**：`--single`、`--detail`、`--quick` 控制输出版本数量
- **版本对比总结表**：三版本对比一目了然

### Changed
- 优化交互流程：解析 → 评估 → 追问 → 生成 → 对比 → 确认
- 增强 SKILL.md 的结构和可读性

## [1.0.0] - 2026-06-30

### Added
- 初始版本发布
- 三大优化框架：CRISPE、ROSES、结构化多层优化
- 自动框架识别：根据内容智能匹配最佳框架
- 10 个场景模板（5 个文案类 + 5 个创意类）
- `/optimize` 前缀触发
- 对比展示 + 确认修改交互
- 完整的项目文档和使用指南
