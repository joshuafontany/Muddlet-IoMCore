if matches[2] then
    Character.Target = matches[2]
    send("p' ptarget "..Character.Target)
  else
      Character.Target = ""	
  end
  