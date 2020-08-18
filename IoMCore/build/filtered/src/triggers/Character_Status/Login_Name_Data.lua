--display(multimatches)
if multimatches[2][2] then
    Character.Name = multimatches[2][2]
    --echo(Character.Name.." true\n")
end
GUI.DataInitialized = Character_io("Load")