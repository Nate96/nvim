  function ResetColor(color)
			color = color or "vscode"
			vim.cmd.colorscheme(color)

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, 'LineNr', { bg = "none" })
			vim.api.nvim_set_hl(0, 'LineNr', { fg = "gray" })
		end

		ResetColor()
