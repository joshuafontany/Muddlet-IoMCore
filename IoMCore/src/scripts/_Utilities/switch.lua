switch = function (choice, cases)
    -- accepts both number as well as string
    choice = choice and tonumber(choice) or choice     -- returns a number if the choic is a number or string. 
      --display(cases)
      --echo(choice)
    -- Define your cases
    cases = cases or
     {
       [1] = function ( )                              -- case 1 : 
               print("your choice is Number 1 ")       -- code block
       end,                                            -- break statement
  
       add = function ( )                              -- case 'add' : 
               print("your choice is string add ")     -- code block
       end,                                            -- break statement
  
      ['+'] = function ( )                             -- case '+' : 
               print("your choice is char + ")         -- code block
       end,                                            -- break statement
  
       default = function ( )                          -- default case
               print("no match for "..choice)   
       end,                                            -- u cant exclude end hear :-P
     }
       
      if not cases["default"] then cases["default"] = print("no match for "..choice.." provided") end
  
      
    -- execution section
    if cases[choice] then
       return cases[choice]
    else
       return cases["default"]
    end
  
  end
  -- Now you can use it as a regular function. Tadaaa..!!
  --switch(mychoice)