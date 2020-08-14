for i = 1, #Party.Roster do
    send("party invite " .. Party.Roster[i])
 end