local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg & Pet",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local S1 = T2:AddSection({
Name = "Hatch & Craft | Egg"
})

local S2 = T2:AddSection({
Name = "Gold | Pet"
})

S2:AddLabel("Chance of Failure in making pets into gold 0%")

local T3 = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local a = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")
local egg = {}
local pc = {}
local enemy = {}
local pets = {}
local ptc = {}
local autodelete = {}
OrionLib:AddTable(workspace["Eggs"],egg)
OrionLib:AddTable(workspace.Computers,pc)
OrionLib:AddTable(a.Pets,pets)
OrionLib:AddTable(a.Hatched,ptc)
OrionLib:AddTable(a.AutoDelete,autodelete)

OrionLib:AddTable(workspace.Bosses["Zone1"],enemy)
OrionLib:AddTable(workspace.Bosses["Zone2"],enemy)
OrionLib:AddTable(workspace.Bosses["Zone3"],enemy)
OrionLib:AddTable(workspace.Bosses["Zone4"],enemy)
OrionLib:AddTable(workspace.Bosses["Zone5"],enemy)

local selectionBox = Instance.new("SelectionBox")
selectionBox.Color3 = Color3.new(1, 0, 0)
selectionBox.LineThickness = 0.05
selectionBox.Parent = workspace

--[[
T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(_)
   _G._click = _
      while wait() do
      if _G._click == false then break end
      k
    end
  end    
})
]]

function GetWins()
  return a.leaderstats.Wins.Value -- IQ, Rebirths, TypingSpeed, Wins
end

T1:AddDropdown({
  Name = "Select Computer",
  Default = "Computer1",
  Options = pc,
  Callback = function(Value)
    _G._pc = Value
    selectionBox.Adornee = workspace.Computers[Value].HitBox
  end    
})

T1:AddDropdown({
  Name = "Choose an enemy to fight",
  Default = "Bacon Hair",
  Options = enemy,
  Callback = function(Value)
    _G._e = Value
  end    
})

T1:AddToggle({
  Name = "Auto Fight",
  Default = false,
  Callback = function(c_)
    game:GetService("ReplicatedStorage")["Remotes"]["AutoFight"]:FireServer(c_,_G._e)
  end    
})

T1:AddToggle({
  Name = "Instant Win",
  Default = false,
  Callback = function(_)
   _G._iw = _
      while wait() do
      if _G._iw == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["FinishBossFight"]:FireServer(_G._e)
    end
  end    
})

T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(_)
   _G._click = _
      while wait() do
      if _G._click == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Click"]:FireServer(a)
    end
  end    
})

T1:AddToggle({
  Name = "Auto type",
  Default = false,
  Callback = function(_)
   _G._type = _
      while wait() do
      if _G._type == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Type"]:FireServer(_G._pc)
    end
  end    
})

--[[
T1:AddToggle({
  Name = "Auto train",
  Default = false,
  Callback = function(_)
   _G._train = _
      while wait() do
      if _G._train == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["AutoTrainIQRemote"]:FireServer(false)
    end
  end    
})
]]

T1:AddToggle({
  Name = "Instant gift",
  Default = false,
  Callback = function(_)
   _G._gift = _
      while wait() do
      if _G._gift == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift1")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift2")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift3")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift4")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift5")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift6")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift7")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift8")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift9")
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGift"]:FireServer("Gift10")
    end
  end    
})

T1:AddToggle({
  Name = "Auto rebirth",
  Default = false,
  Callback = function(_)
   _G._r = _
      while wait() do
      if _G._r == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Rebirth"]:FireServer()
    end
  end    
})

local EggPrice = S1:AddParagraph("Egg Price","Error #505")

S1:AddDropdown({
  Name = "Select Egg",
  Default = "Grass Egg",
  Options = egg,
  Callback = function(Value)
    _G._table_egg = Value
    EggPrice:Set(string.format("Currency: %s\nPrice: %s %s (%s %s)",tostring(workspace.Eggs[Value].Currency.Value),tostring(game.Workspace.Eggs[Value].Price.Value),tostring(workspace.Eggs[Value].Currency.Value),tostring(game.Workspace.Eggs[Value].UpperCost.BillboardGui.Frame.TextLabel.Text),tostring(workspace.Eggs[Value].Currency.Value)),Value .. " Price")
  end    
})

S1:AddDropdown({
  Name = "Number of Hatches",
  Default = "1",
  Options = {"1","3","8"},
  Callback = function(Value)
    _G._table_mh = Value
  end    
})

local PetSelector = S2:AddDropdown({
  Name = "Select Pet",
  Default = "",
  Options = pets,
  Callback = function(Value)
    _G._table_pet = Value
  end    
})

--[[
Dropdown:Refresh(List<table>,true)
Dropdown:Set("dropdown option")
]]

S2:AddDropdown({
  Name = "Select Pet Type",
  Default = "Baby",
  Options = {"Baby","Big","Huge"},
  Callback = function(Value)
    _G._table_type = Value
  end    
})

S2:AddDropdown({
  Name = "How many pets do you want to turn into gold?",
  Default = "1",
  Options = {"1","2","3","4","5"},
  Callback = function(Value)
    _G._table_many = Value
  end    
})

S1:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(_)
   _G._htc = _
  if tostring(GetWins()) < tostring(workspace.Eggs[_G._table_egg].Price.Value) then
       OrionLib:MakeNotification({Name = "Not enough",Content = 'Its not enough to buy "' .. tostring(_G._table_egg) .. '" because your wins are less',Image = tostring(workspace.Eggs[_G._table_egg].UpperCost.BillboardGui.Frame.ImageLabel.Image),Time = 5})
  end
  
      while wait() do
      if _G._htc == false then break end
        if tostring(GetWins()) < tostring(workspace.Eggs[_G._table_egg].Price.Value) then break end
        if tostring(GetWins()) > tostring(workspace.Eggs[_G._table_egg].Price.Value) then
      game:GetService("ReplicatedStorage")["Remotes"]["EggHatchingRemotes"]["HatchingEgg"]:FireServer(workspace["Eggs"][_G._table_egg],tonumber(_G._table_mh))
       end
    end
  end    
})

S1:AddToggle({
  Name = "Auto equip best",
  Default = false,
  Callback = function(_)
   _G._bp = _
      while wait() do
      if _G._bp == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["PetEquippingRemotes"]["EquipBest"]:FireServer()
    end
  end    
})

local args = {
    [1] = "Dominus Emperius",
    [2] = 3,
    [3] = 60,
    [4] = "Baby"
}

S2:AddToggle({
  Name = "Auto Golden",
  Default = false,
  Callback = function(_)
   _G._g = _
      while wait() do
      if _G._g == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["CraftGoldenPet"]:FireServer(_G._table_pet,tonumber(_G._table_many),100,_G._table_type)
    end
  end    
})

S2:AddButton({
  Name = "Refresh Pet Selection",
  Callback = function()
      pets = {}
      PetSelector:Refresh({"Refreshing.."},true)
      wait(0.1)
      OrionLib:AddTable(a.Pets,pets)
      wait(0.1)
      PetSelector:Refresh(pets,true)
      PetSelector:Set("Dominus Emperius")
  end    
})

S1:AddToggle({
  Name = "Auto craft",
  Default = false,
  Callback = function(_)
   _G._c = _
      while wait() do
      if _G._c == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["CraftAll"]:FireServer(a)
    end
  end    
})

T3:AddToggle({
  Name = "Auto Luck Boost",
  Default = false,
  Callback = function(_)
   _G._LB = _
      while wait() do
      if _G._LB == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["UseBoost"]:FireServer("LuckBoost")
    end
  end    
})

T3:AddToggle({
  Name = "Auto Wins Boost",
  Default = false,
  Callback = function(_)
   _G._WB = _
      while wait() do
      if _G._WB == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["UseBoost"]:FireServer("WinsBoost")
    end
  end    
})
--[[
T1:AddToggle({
  Name = "Auto Redeem all codes",
  Default = false,
  Callback = function(_)
   _G._rac = _
      while wait() do
      if _G._rac == false then break end
      k
    end
  end    
})]]
