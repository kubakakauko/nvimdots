-- Neovide settings
vim.g.neovide_theme = 'auto'
vim.g.neovide_fullscreen = true
vim.g.neovide_transparency = 1
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = false --Force redrawingd
vim.g.neovide_refresh_rate = 121
vim.g.neovide_cursor_animation_length = 0.02
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_trail_length = 0.2
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125
vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_cursor_vfx_opacity = 400.0
vim.g.neovide_cursor_vfx_particle_lifetime = 5.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 15.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0
-- macos 
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_input_use_logo = true

vim.g.neovide_scale_factor = 1.15
vim.g.guifont = "Hack,Noto_Color_Emoji:h12:b"

local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1/1.25)
end)
