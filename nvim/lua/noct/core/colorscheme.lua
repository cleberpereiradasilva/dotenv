local status, _ = pcall(vim.cmd,[[ colorscheme nightfly ]]) 
if not status then
  print("Colorsheme not found!!!")
  return
end
