# Config

个人开发工具配置仓库，用于快速同步和备份开发环境。

## 包含的配置

- [Ghostty](./ghostty/) - 终端模拟器配置

---

## Ghostty 配置

[Ghostty](https://ghostty.org/) 是一个快速、功能丰富的终端模拟器。

### 功能特性

- **视觉特效**: 使用 GLSL 着色器实现光标拖尾和扭曲效果
- **透明背景**: 85% 透明度 + 20px 模糊半径
- **快捷键**: 类 Vim 的分屏导航，快速终端下拉
- **字体**: Monaco 16px，优化行高
- **主题**: Dracula

### 快捷键速查

| 快捷键 | 功能 |
|--------|------|
| `Cmd+T` | 新建标签页 |
| `Cmd+Shift+←/→` | 切换标签页 |
| `Cmd+W` | 关闭标签页 |
| `Cmd+D` | 水平分屏 |
| `Cmd+Shift+D` | 垂直分屏 |
| `Super+H/J/K/L` | 分屏导航（左/下/上/右）|
| `Cmd+Shift+E` | 均等化分屏 |
| `Cmd+Shift+F` | 切换分屏全屏 |
| `Cmd++/-` | 调整字体大小 |
| `Option+Space` | 切换快速终端（全局）|

### 安装步骤

#### 1. 克隆仓库

```bash
git clone https://github.com/aidenz0/config.git ~/dev/config
cd ~/dev/config
git submodule update --init --recursive
```

#### 2. 备份现有配置（如有）

```bash
mv ~/.config/ghostty ~/.config/ghostty.backup.$(date +%Y%m%d)
```

#### 3. 创建软链接

```bash
ln -s ~/dev/config/ghostty ~/.config/ghostty
```

#### 4. 验证安装

```bash
ghostty +show-config --default --docs | head -20
```

#### 5. 重新加载配置

在 Ghostty 中按 `Cmd+Shift+,` 重新加载配置，或重启 Ghostty。

### 着色器说明

着色器通过 git submodule 管理，来源：[sahaj-b/ghostty-cursor-shaders](https://github.com/sahaj-b/ghostty-cursor-shaders)

当前启用的着色器：
- `cursor_sweep.glsl` - 光标扫过效果
- `cursor_warp.glsl` - 光标扭曲效果

如需更新着色器：

```bash
cd ~/dev/config
git submodule update --remote
```

### 依赖

- macOS（配置针对 macOS 优化）
- [Ghostty](https://ghostty.org/download) 终端模拟器

---

## 贡献

这是一个个人配置仓库，但欢迎提交 Issue 或 PR 提出建议。

## License

MIT
