-- ~/.config/nvim/lua/plugins/git.lua
-- Git integration using gitsigns

return {
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" }, -- Load early to show signs
    opts = {
      signs = { -- Customize the signs shown in the gutter
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signcolumn = true,  -- Always show the signcolumn, otherwise it would shift the text
      numhl = false,     -- Don't highlight line number with git sign color
      linehl = false,    -- Don't highlight the whole line with git sign color
      word_diff = false, -- Don't perform word-level diffs within lines
      watch_gitdir = {
        interval = 1000, -- Check git directory changes every 1000ms
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Turn off blame info on current line by default
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 500, -- Delay before showing blame info
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default formatter
      max_file_length = 40000, -- Disable for large files
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },

      -- Keymaps (configured within on_attach for buffer-local context)
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Next Git Hunk" })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Previous Git Hunk" })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, { desc = '[H]unk [S]tage' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = '[H]unk [R]eset' })
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = '[H]unk [S]tage (Visual)' })
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = '[H]unk [R]eset (Visual)' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = '[H]unk [S]tage Buffer' })
        map('n', '<leader>hU', gs.undo_stage_hunk, { desc = '[H]unk [U]ndo Stage' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = '[H]unk [R]eset Buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = '[H]unk [P]review' })
        map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = '[H]unk [B]lame Line' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle Blame Current Line' }) -- Toggle blame
        map('n', '<leader>hd', gs.diffthis, { desc = '[H]unk [D]iff Against Index' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = '[H]unk [D]iff Against Last Commit' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = '[T]oggle [D]eleted Hunks' })

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select Git Hunk" })
      end
    },
  },
}
