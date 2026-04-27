# Config

个人开发工具配置仓库，用于快速同步和备份开发环境。

## 包含的配置

- [Ghostty](./ghostty/) - 终端模拟器配置
- [LunarVim](./lvim/) - Neovim IDE 配置

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

## LunarVim 配置

[LunarVim](https://www.lunarvim.org/) 是一个基于 Neovim 的 IDE，拥有强大的插件生态和开箱即用的功能。

### 功能特性

- **文件浏览**: oil.nvim - 内置文件管理器
- **文件搜索**: telescope.nvim - 模糊搜索
- **Git 集成**: gitsigns.nvim - Git 状态显示
- **语法高亮**: nvim-treesitter - 语法解析
- **状态栏**: lualine.nvim - 底部状态栏
- **缩进线**: indent-blankline.nvim - 可视化缩进

### 安装步骤

#### 1. 先决条件

确保已安装 Neovim (>= 0.9.0)：

```bash
brew install neovim
```

#### 2. 克隆仓库

```bash
git clone https://github.com/aidenz0/config.git ~/dev/config
```

#### 3. 备份现有配置（如有）

```bash
mv ~/.config/lvim ~/.config/lvim.backup.$(date +%Y%m%d)
```

#### 4. 创建软链接

```bash
ln -s ~/dev/config/lvim ~/.config/lvim
```

#### 5. 启动 LunarVim

```bash
lvim
```

首次启动时会自动安装插件，可能需要几分钟时间。

### 常用快捷键

| 快捷键 | 功能 |
|--------|------|
| `Space ff` | 查找文件 |
| `Space fg` | 全局搜索 |
| `Space fb` | 搜索已打开的缓冲区 |
| `Space /` | 在文件中搜索 |
| `Space hh` | 切换浮动窗口帮助 |
| `Ctrl h/j/k/l` | 切换分屏 |
| `Space th` | 显示/隐藏文件树 |
| `Space q` | 关闭当前缓冲区 |
| `Space w` | 保存当前文件 |
| `Space S` | 保存所有更改 |
| `gcc` | 注释/取消注释当前行 |

### 插件列表

- `Mofiqul/dracula.nvim` - 主题配色
- `nvim-tree/nvim-tree.lua` - 文件树
- `OXY2DEV/markview.nvim` - Markdown 预览
- `nvim-treesitter/nvim-treesitter` - 语法高亮

### 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+t` | 新建标签页 |
| `Ctrl+w` | 关闭标签页 |
| `<leader>1-9` | 跳转到对应缓冲区 |
| `<leader>bn/bp/bd` | 下一个/上一个/删除缓冲区 |
| `<leader>tp/tn/to` | 上一个/下一个/关闭其他标签页 |
| `<leader>h` | 取消搜索高亮 |
| `<leader>nf` | 新建命名文件 |
| `jj` | 退出插入模式 |
| `Enter` | 在下方插入空行 |
| `Ctrl+o/Ctrl+i` | 跳转历史前进/后退 |

### 依赖

- macOS / Linux
- [Neovim](https://neovim.io/) >= 0.9.0
- [LunarVim](https://www.lunarvim.org/docs/installation) 基础安装

```bash
# 完整安装 LunarVim 基础
bash <(curl -s https://raw.githubusercontent.com/lunarvim/LunarVim/master/utils/installer/install.sh)
```

---

## 贡献

这是一个个人配置仓库，但欢迎提交 Issue 或 PR 提出建议。

## License

MIT
