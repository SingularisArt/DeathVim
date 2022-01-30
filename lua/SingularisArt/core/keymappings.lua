local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- Unmap a couple of mappings
map { 'n', '<Space>', '<NOP>' }
map { 'n', '<Enter>', '<NOP>' }
map { 'n', '<C-y>', '<NOP>' }
map { 'n', '<C-e>', '<NOP>' }
map { 'n', '<C-b>', '<NOP>' }
map { 'n', '<C-Space>', '<NOP>' }
map { 'n', '<C-s>', '<NOP>' }

-- fine-cmdline
-- map { 'n', ':', '<cmd>FineCmdline<CR>' }

-- leader key
vim.g.mapleader = ' '

-- format on save
map { 'n', '<C-s>', ':write | lua vim.lsp.buf.formatting_sync()<CR>' }

-- easymotion
map { 'n', '<Leader>y', '<Plug>(easymotion-bd-f)' }

-- explorer
map { 'n', '<Leader>e', ':NvimTreeToggle<CR>' }

-- better window movement
map { 'n', '<C-h>',     '<C-w>h' }
map { 'n', '<C-j>',     '<C-w>j' }
map { 'n', '<C-k>',     '<C-w>k' }
map { 'n', '<C-l>',     '<C-w>l' }

-- tab switch buffer and tab edit
map { 'n', '<Tab>',   ':BufferLineCycleNext<CR>'  }
map { 'n', '<S-Tab>', ':BufferLineCyclePrev<CR>'  }
map { 'n', '<A-w>',   ':bdelete<CR>'              }
map { 'n', '<A-t>',   ':tabnew<CR>'               }

-- buffers
map { 'n', '<Leader>bp',    ':BufferLinePick<CR>'                     }
map { 'n', '<Leader>bcl',   ':BufferLineCloseLeft<CR>'                }
map { 'n', '<Leader>bcr',   ':BufferLineCloseRight<CR>'               }
map { 'n', '<Leader>bmn',   ':BufferLineMoveNext<CR>'                 }
map { 'n', '<Leader>bmp',   ':BufferLineMovePrev<CR>'                 }
map { 'n', '<Leader>bsd',   ':BufferLineSortByDirectory<CR>'          }
map { 'n', '<Leader>bse',   ':BufferLineSortByExtension<CR>'          }
map { 'n', '<Leader>bsr',   ':BufferLineSortByRelativeDirectory<CR>'  }
map { 'n', '<Leader>bst',   ':BufferLineSortByTabs<CR>'               }
map { 'n', '<Leader>bst',   ':BufferLineSortByTabs<CR>'               }

-- move selected line / block of text in visual mode
map { 'v', 'K', ':move \'<-2<CR>gv-gv' }
map { 'v', 'J', ':move \'>+1<CR>gv-gv' }

-- spell correction
map { 'i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u' }

-- highlight everything
map { 'n', '<C-a>', 'ggVG',     }
map { 'i', '<C-a>', '<Esc>ggVG' }

-- windows/panes/tabs/buffers
map { 'n', '<Leader>v', ':vsplit<CR>' }
map { 'n', '<Leader>h', ':split<CR>'  }
map { 'n', '<Leader>o', ':only<CR>'   }

-- dashbaord
map { 'n', '<Leader>d', ':Dashboard<CR>' }

-- git
map { 'n', '<Leader>gs', ':Git<CR>'             }
map { 'n', '<Leader>ga', ':Git add .<CR>'       }
map { 'n', '<Leader>gd', ':Git diff<CR>'        }
map { 'n', '<Leader>gc', ':Git commit<CR>'      }
map { 'n', '<Leader>gp', ':Git push<CR>'        }
map { 'n', '<Leader>gP', ':Git pull<CR>'        }
map { 'n', '<Leader>gl', ':Git log<CR>'         }
map { 'n', '<Leader>gL', ':LazyGit<CR>'         }
map { 'n', '<Leader>gf', ':LazyGitFilter<CR>'   }

-- translate
map { 'n', '<Leader>rt', ':Translate<CR>'   }
map { 'n', '<Leader>rw', ':TranslateW<CR>'  }
map { 'n', '<Leader>rr', ':TranslateR<CR>'  }

-- vimtex
map { 'n', '<Leader>lll', ':VimtexClean<CR>'            }
map { 'n', '<Leader>llc', ':VimtexCache<CR>'            }
map { 'n', '<Leader>lcc', ':VimtexCompile<CR>'          }
map { 'n', '<Leader>lco', ':VimtexCompileOutput<CR>'    }
map { 'n', '<Leader>lcs', ':VimtexCompileSS<CR>'        }
map { 'n', '<Leader>lce', ':VimtexCompileSelected<CR>'  }
map { 'n', '<Leader>lrr', ':VimtexReload<CR>'           }
map { 'n', '<Leader>lrs', ':VimtexReloadState<CR>'      }
map { 'n', '<Leader>lop', ':VimtexStop<CR>'             }
map { 'n', '<Leader>loa', ':VimtexStopAll<CR>'          }
map { 'n', '<Leader>lto', ':VimtexTocOpen<CR>'          }
map { 'n', '<Leader>ltt', ':VimtexTocToggle<CR>'        }

map { 'n', '<Leader>lm',  ':VimtexContextMenu<CR>',     }
map { 'n', '<Leader>lu',  ':VimtexCountLetters<CR>',    }
map { 'n', '<Leader>lw',  ':VimtexCountWords<CR>',      }
map { 'n', '<Leader>ld',  ':VimtexDocPackage<CR>',      }
map { 'n', '<Leader>le',  ':VimtexErrors<CR>',          }
map { 'n', '<Leader>ls',  ':VimtexStatus<CR>',          }
map { 'n', '<Leader>la',  ':VimtexToggleMain<CR>',      }
map { 'n', '<Leader>lv',  ':VimtexView<CR>',            }
map { 'n', '<Leader>li',  ':VimtexInfo<CR>',            }

-- markdown
map { 'n', '<Leader>mp', ':MarkdownPreview<CR>' }

-- inkscape
map { 'i', '<C-f>', '<Esc>:silent exec \'.!inkscape-figures create "\'.getline(\'.\').\'" "\'.b:vimtex.root.\'/figures/"\'<CR>'       }
map { 'n', '<C-f>', ':silent exec \'!inkscape-figures edit "\'.b:vimtex.root.\'/figures/" > /dev/null 2>&1 &\'<CR><CR>:redraw!<CR>'   }

-- table
map { 'n', '<Leader>tt',  ':TableModeToggle<CR>'  }
map { 'n', '<Leader>taf', ':TableAddFormula<CR>'  }
map { 'n', '<Leader>tdr', '<Leader>tdr'           }
map { 'n', '<Leader>tdc', '<Leader>tdc'           }
map { 'n', '<Leader>tic', '<Leader>tic'           }

-- package manager
map { 'n', '<Leader>pi', ':PackerInstall<CR>' }
map { 'n', '<Leader>pu', ':PackerUpdate<CR>'  }
map { 'n', '<Leader>pc', ':PackerClean<CR>'   }
map { 'n', '<Leader>pl', ':PackerLoad<CR>'    }
map { 'n', '<Leader>ps', ':PackerSync<CR>'    }

-- telescope
map { 'n', '<Leader>fff', ':Telescope find_files<CR>'                                                 }
map { 'n', '<Leader>ffb', ':lua require("telescope").extensions.file_browser.file_browser()<CR>'      }
map { 'n', '<Leader>fo',  ':Telescope oldfiles<CR>'                                                   }
map { 'n', '<Leader>fc',  ':Telescope colorscheme<CR>'                                                }
map { 'n', '<Leader>fb',  ':Telescope buffers<CR>'                                                    }
map { 'n', '<Leader>fm',  ':Telescope commands<CR>'                                                   }
map { 'n', '<Leader>fq',  ':Telescope quick_fix<CR>'                                                  }
map { 'n', '<Leader>fl',  ':Telescope live_grep<CR>'                                                  }
map { 'n', '<Leader>fr',  ':Telescope marks<CR>'                                                      }
map { 'n', '<Leader>fp',  ':Telescope projects<CR>'                                                   }
map { 'n', '<Leader>fgs', ':Telescope git_status<CR>'                                                 }
map { 'n', '<Leader>fgf', ':Telescope git_files<CR>'                                                  }
map { 'n', '<Leader>fgc', ':Telescope git_commits<CR>'                                                }
map { 'n', '<Leader>fgb', ':Telescope git_branches<CR>'                                               }
map { 'n', '<Leader>fgt', ':Telescope git_stash<CR>'                                                  }

-- mini map
map { 'n', '<Leader>ic', ':MinimapClose<CR>'    }
map { 'n', '<Leader>io', ':MinimapOpen<CR>'     }
map { 'n', '<Leader>ir', ':MinimapRefresh<CR>'  }
map { 'n', '<Leader>it', ':MinimapToggle<CR>'   }

-- lsp
map { 'n', '<Leader>sdd', '<cmd>lua vim.lsp.buf.definition()<CR>'                 }
map { 'n', '<Leader>sdf', ':Lspsaga lsp_finder<CR>'                               }
map { 'n', '<Leader>sdr', '<cmd>lua vim.lsp.buf.references()<CR>'                 }
map { 'n', '<Leader>sdt', '<cmd>lua vim.lsp.buf.type_definition()<CR>'            }
map { 'n', '<Leader>sdp', ':Lspsaga preview_definition<CR>'                       }
map { 'n', '<Leader>swa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'       }
map { 'n', '<Leader>swr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'    }
map { 'n', '<Leader>sh',  ':Lspsaga hover_doc<CR>'                                }
map { 'n', '<Leader>sc',  ':Lspsaga code_action<CR>'                              }
map { 'n', '<Leader>se',  ':Lspsaga show_line_diagnostics<CR>'                    }
map { 'n', '<Leader>sq',  ':lua vim.lsp.diagnostic.set_loclist()<CR>'             }
map { 'n', '<Leader>sf',  ':Lspsaga format<CR>'                                   }
map { 'n', '<Leader>sr',  ':Lspsaga rename<CR>'                                   }
map { 'n', '<Leader>si',  ':Lspsaga implement<CR>'                                }
map { 'n', '<Leader>sj',  ':Lspsaga diagnostic_jump_prev'                         }
map { 'n', '<Leader>sk',  ':Lspsaga diagnostic_jump_next'                         }
map { 'n', '<A-d>',       ':ToggleTerm<CR>'                                       }
map { 't', '<A-d>',       '<C-\\><C-n>:ToggleTerm<CR>'                            }

-- misc
map { 'i', '<C-H>', '<C-W>' }

-- Resize with arrows
map { 'n', '<C-Up>',      ':resize -2<CR>',         }
map { 'n', '<C-Down>',    ':resize +2<CR>',         }
map { 'n', '<C-Left>',    ':vertical resize -2<CR>' }
map { 'n', '<C-Right>',   ':vertical resize +2<CR>' }

-- config
map { 'n', '<Leader>Dc',   ':e ~/.config/nvim/init.lua<CR>' }
-- map { 'n', '<Leader>Df',   ':vertical resize +2<CR>'        }
map { 'n', '<Leader>Dg',   ':vertical resize +2<CR>'        }
map { 'n', '<Leader>Dk',   ':vertical resize +2<CR>'        }
