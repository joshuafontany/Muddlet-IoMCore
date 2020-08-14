if matches[2] ~= "" then
    Character.Target = matches[2]
    send("do x first " .. Character.Target .."; consider first " .. Character.Target)
  elseif matches[2] == "" then
      Character.Target = ""
  end