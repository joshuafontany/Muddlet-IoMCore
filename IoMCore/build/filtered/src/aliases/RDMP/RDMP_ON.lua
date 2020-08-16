if matches[2] then
    Character.RDMPCode = matches[2]
      Character.RDMPStatus = "ON"
    send("RDMP ON "..2332, false)
  end