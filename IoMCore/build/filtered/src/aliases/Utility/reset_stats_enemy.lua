if matches[2] == " stats" then
    enableTrigger("Character.ResetStats")
    send("do remove all;stats")
  elseif matches[3] == " enemy" then
      GUI.resetEnemy()
  else
  
  end
  
  function GUI.resetEnemy()
      cecho("<sky_blue>enemy reset...")
      Character.Enemy = "No Enemy"
      Character.EHp = 0
      GUI.EHpBar:setValue(Character.EHp)
      GUI.EHpBarLabel:echo("<b>"..Character.Enemy.." ("..Character.EHp.."%)</b>")
  end