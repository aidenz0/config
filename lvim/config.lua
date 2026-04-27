-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "dracula"

lvim.plugins = {
  { "Mofiqul/dracula.nvim",
    config = function()
      require("dracula").setup({
        -- customize dracula color scheme
        colors = {
          bg = "#282a36",
          fg = "#f8f8f2",
          selection = "#44475a",
          comment = "#6272a4",
          red = "#ff5555",
          orange = "#ffb86c",
          yellow = "#f1fa8c",
          green = "#50fa7b",
          purple = "#bd93f9",
          cyan = "#8be9fd",
          pink = "#ff79c6",
        },
        show_end_of_buffer = false,
        transparent_bg = false,
        lualine_bold = false,
      })
    end
  },
  { "nvim-tree/nvim-tree.lua", version = "*" },
  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("markview").setup({
        modes = { "n", "no", "c" }, -- 普通模式、操作符等待模式、命令行模式
        hybrid_modes = { "n" },     -- 混合模式
      })
    end,
  }
}

-- 禁用 vim-illuminate 避免 treesitter 兼容性错误
lvim.builtin.illuminate.active = false

-- 确保 treesitter 安装常用 parser 并启用高亮
lvim.builtin.treesitter.ensure_installed = {
  "lua", "vim", "vimdoc", "bash", "python", "javascript", "typescript"
}
lvim.builtin.treesitter.highlight.enable = true

-- 跳过 LunarVim 默认的 Python LSP，让 nvim 配置接管
lvim.lsp.skip = { "pylsp" }

-- 禁用诊断信息中的 import 排序警告
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
})

-- 标签页快捷键配置
lvim.keys.normal_mode["<C-t>"] = ":tabnew<CR>"           -- Ctrl+t 新建标签页
lvim.keys.normal_mode["<C-w>"] = ":tabclose<CR>"         -- Ctrl+w 关闭标签页

-- leader + 数字跳转到缓冲区（已打开的文件）
lvim.keys.normal_mode["<leader>1"] = ":b1<CR>"
lvim.keys.normal_mode["<leader>2"] = ":b2<CR>"
lvim.keys.normal_mode["<leader>3"] = ":b3<CR>"
lvim.keys.normal_mode["<leader>4"] = ":b4<CR>"
lvim.keys.normal_mode["<leader>5"] = ":b5<CR>"
lvim.keys.normal_mode["<leader>6"] = ":b6<CR>"
lvim.keys.normal_mode["<leader>7"] = ":b7<CR>"
lvim.keys.normal_mode["<leader>8"] = ":b8<CR>"
lvim.keys.normal_mode["<leader>9"] = ":b9<CR>"

-- 缓冲区前后切换
lvim.keys.normal_mode["<leader>bn"] = ":bnext<CR>"         -- 下一个缓冲区
lvim.keys.normal_mode["<leader>bp"] = ":bprevious<CR>"     -- 上一个缓冲区
lvim.keys.normal_mode["<leader>bd"] = ":bprevious<CR>:bdelete #<CR>"  -- 删除当前缓冲区并回到上一个
lvim.keys.normal_mode["<leader>bl"] = ":ls<CR>:b "         -- 列出缓冲区并跳转

-- 标签页前后切换
lvim.keys.normal_mode["<leader>tp"] = ":tabprevious<CR>"  -- 上一个标签页
lvim.keys.normal_mode["<leader>tn"] = ":tabnext<CR>"      -- 下一个标签页
lvim.keys.normal_mode["<leader>to"] = ":tabonly<CR>"      -- 关闭其他标签页

-- 跳转列表快捷键
lvim.keys.normal_mode["<C-o>"] = "<C-o>"                  -- 跳回上一个位置（默认已有，这里显式声明）
lvim.keys.normal_mode["<C-i>"] = "<C-i>"                  -- 跳到下一个位置

-- 插入模式下 jj 退出到普通模式
lvim.keys.insert_mode["jj"] = "<Esc>"                     -- jj 退出插入模式

-- 普通模式下按 Enter 进入插入模式并换行
lvim.keys.normal_mode["<CR>"] = "o<Esc>"                   -- Enter 在当前行下方新建空行
lvim.keys.normal_mode["<S-CR>"] = "O<Esc>"                 -- Shift+Enter 在当前行上方新建空行

-- 取消搜索高亮
lvim.keys.normal_mode["<leader>h"] = ":nohlsearch<CR>"     -- Space+h 取消搜索高亮

-- 新建命名文件快捷键
lvim.keys.normal_mode["<leader>nf"] = ":e "                 -- Space+nf 新建文件并输入文件名
