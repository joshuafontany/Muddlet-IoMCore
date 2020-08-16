Character.RDMPStatus = "OFF"
GUI.HpBar:setValue(0, 100, "")
GUI.SpBar:setValue(0, 100, "")
GUI.EpBar:setValue(0, 100, "")
GUI.EHpBar:setValue(0, 100, "")

GUI.HpBarLabel:echo("<b>RDMP OFF</b>")
GUI.SpBarLabel:echo("<b>RDMP OFF</b>")
GUI.EpBarLabel:echo("<b>RDMP OFF</b>")
GUI.EHpBarLabel:echo("<b>RDMP OFF</b>")

send("RDMP OFF", false)