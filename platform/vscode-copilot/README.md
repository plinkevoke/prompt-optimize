# VS Code / GitHub Copilot 适配说明

GitHub Copilot 支持 Custom Instructions（自定义指令），可以将本 Skill 的核心逻辑配置为 Copilot 的自定义指令，让 Copilot 输出更专业。

## 限制说明

GitHub Copilot 的 Custom Instructions 有以下限制：
- ❌ 不支持斜杠命令（没有 `/optimize` 触发方式）
- ❌ 不支持渐进式加载（全量加载到上下文）
- ❌ 不支持技能目录结构和模板文件
- ❌ 不支持自动触发和多版本选择
- ✅ 支持纯文本系统指令

因此，VS Code / Copilot 适配采用「精简版系统指令」方案，将核心优化逻辑提炼为一段系统指令，配置到 Copilot 中使用。

## 安装方式

### 步骤 1：打开 Copilot 设置

1. 打开 VS Code
2. 按 `Ctrl+Shift+P`（Mac: `Cmd+Shift+P`）打开命令面板
3. 输入 "Copilot: Open Custom Instructions"
4. 或通过菜单：文件 → 首选项 → 设置 → 搜索 "Copilot Custom Instructions"

### 步骤 2：配置自定义指令

将 `copilot-instructions.txt` 文件中的内容复制到 Custom Instructions 的第二个输入框（"How would you like Copilot to respond?"）中。

### 步骤 3：保存并生效

保存设置，Copilot 会自动在所有对话中使用这些指令。

## 使用方式

在 Copilot Chat 中，用自然语言说明你要优化 prompt：

```
请帮我优化这个提示词：帮我写一个奶茶店的宣传文案
```

或者直接描述需求：

```
我要写一篇小红书种草笔记，帮我优化一下 prompt，让 AI 输出质量更好
```

## 与完整版的差异

| 功能 | 完整版（Skill） | Copilot 版 |
|------|---------------|-----------|
| 斜杠命令触发 | ✅ | ❌ |
| 渐进式追问 | ✅ | ⚠️ 部分（需手动说明） |
| 多版本输出 | ✅ | ⚠️ 需手动要求 |
| 框架切换 | ✅ | ⚠️ 需手动说明 |
| 模板库 | ✅ | ❌ |
| 版本融合 | ✅ | ❌ |

## 使用技巧

1. **明确说"优化 prompt"**：开头说明"我需要优化一个提示词"，让 Copilot 进入优化模式
2. **提供充分信息**：尽量一次性说清需求，减少来回沟通
3. **要求多版本**：可以说"给我 2-3 个不同深度的版本"
4. **指定框架**：可以说"用 CRISPE 框架优化"或"用 ROSES 框架"
