function Gen_files()
  for i = 1, 10 do
    local file = io.open("file" .. i .. ".txt", "w")
    if file then
      file:write("This is file number " .. i)
      file:close()
    else
      print("Error creating file" .. i)
    end
  end
end

function Cleanup_files()
  -- for i = 1, 10 do
  --   local filename = "file" .. i .. ".txt"
  --   local success, err = os.remove(filename)
  --   if not success then
  --     print("Error deleting file: " .. filename .. " - " .. err)
  --   end
  -- end
  os.execute("del file*.txt")
end

return {
  Generate = Gen_files,
  Cleanup = Cleanup_files
}