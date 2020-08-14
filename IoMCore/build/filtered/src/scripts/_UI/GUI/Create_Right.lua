function GUI.CreateRight()
    GUI.BoxRightCSS = CSSMan.new([[
      background-color: rgba(0,0,0,0);
        qproperty-wordWrap: true;
    ]])
    
    GUI.BoxCSS = CSSMan.new([[
      background-color: rgba(0,0,0,0);
      border-style: solid;
      border-width: 1px;
      border-radius: 5px;
      border-color: white;
      margin: 2px;
    ]])
      
      GUI.ProgressLabelCSS = CSSMan.new([[
      background-color: rgba(0,0,0,0);
          color: rgbs(255,255,255,255)
        qproperty-wordWrap: true;
          qproperty-alignment: 'AlignTop | AlignLeft';
          padding: 5px;
    ]])
      
      GUI.MoneyLabelCSS = CSSMan.new([[
      background-color: rgba(0,0,0,0);
          color: rgbs(255,255,255,255)
        qproperty-wordWrap: true;
          qproperty-alignment: 'AlignLeft | AlignTop';
          padding: 5px;
    ]])
      
      GUI.MoneyBoxCSS = CSSMan.new([[
      background-color: rgba(0,0,0,0);
    ]])
      
      GUI.TooltipLabelCSS = CSSMan.new([[
      background-color: rgba(0,0,0,0);
        qproperty-wordWrap: true;
          qproperty-alignment: 'AlignLeft | AlignTop';
          padding: 5px;
    ]])
      
  end