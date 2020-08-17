loginText = "do "
    if Character.RDMPStatus == "ON" then
        loginText = loginText .. "RDMP ON ".. Character.RDMPCode ..";"
        enableTrigger("RDMP_Zero")
        enableTrigger("RDMP")
    elseif Character.RDMPStatus == "OFF" then
        disableTrigger("RDMP_Zero")
        disableTrigger("RDMP")
    end
    loginText = loginText .. "verbose on;"
    if matches[1] ~= "A dark, sucking portal appears. You fall from it!" then
        loginText = loginText .. "remove all;"
    end
    loginText = loginText .. "x myself;stats;score"
    --enableTrigger("Mute Mud Data")
    enableTrigger("loginData")
    enableTrigger("Character.Score")
    send(loginText)