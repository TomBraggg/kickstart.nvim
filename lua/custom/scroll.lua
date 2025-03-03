local M = {}

-- Scroll and center cursor after moving down/up half the page with animation
function M.smooth_scroll(direction)
  local lines = vim.api.nvim_win_get_height(0) -- Get the window height
  local steps = 10 -- Number of scroll steps
  local step_size = math.floor(lines / steps) -- Calculate the number of lines per step

  for i = 1, steps do
    vim.defer_fn(function()
      -- Scroll by step size and center cursor after each scroll
      if direction == 'down' then
        vim.cmd('normal! ' .. step_size .. 'j')
      elseif direction == 'up' then
        vim.cmd('normal! ' .. step_size .. 'k')
      end
      vim.cmd 'normal! zz' -- Center the cursor
    end, i * 20) -- Delay each scroll by 20ms
  end
end

return M
