local M = {}

function M.highlight()
  -- if dvim.lsp.document_highlight then
  autocmds.clear_augroup "lsp_document_highlight"
  -- end
  -- if dvim.lsp.code_lens_refresh then
    -- autocmds.clear_augroup "lsp_code_lens_refresh"
  -- end
end

return M
