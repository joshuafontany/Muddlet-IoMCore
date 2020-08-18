if GUI.TabRefresh == true then
    cecho("<sky_blue>Pausing tab refresh...<reset>\n")
    killAllTabTimers()
    enableTrigger("Resume_Tab_Refresh")
    disableTrigger("Pause_Tab_Refresh")
    GUI.TabRefresh = false
  end