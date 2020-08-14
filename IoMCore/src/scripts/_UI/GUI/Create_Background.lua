function GUI.CreateBackground()
    GUI.BackgroundCSS = CSSMan.new([[
      background-color: rgb(20,0,20);
    ]])
    
    GUI.Right = Geyser.Label:new({
      name = "Right",
      x = "-40%", y = 0,
      width = "40%",
      height = "100%",
    })
    GUI.Right:setStyleSheet(GUI.BackgroundCSS:getCSS())
    
    GUI.Top = Geyser.Label:new({
      name = "Top",
      x = 0, y = 0,
      width = "60%",
      height = "5%",
    })
    GUI.Top:setStyleSheet(GUI.BackgroundCSS:getCSS())
    
    GUI.Bottom = Geyser.Label:new({
      name = "Bottom",
      x = 0, y = "90%",
      width = "60%",
      height = "10%",
    })
    GUI.Bottom:setStyleSheet(GUI.BackgroundCSS:getCSS())
  end