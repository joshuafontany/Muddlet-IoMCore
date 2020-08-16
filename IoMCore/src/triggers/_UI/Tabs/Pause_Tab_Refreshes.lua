if GUI.TabRefresh == true then
    cecho("<sky_blue>Pausing tab refresh...<reset>\n")
    killAllTabTimers()
    enableTrigger("Resume Tab Refresh")
    disableTrigger("Pause Tab Refresh")
    GUI.TabRefresh = false
  end