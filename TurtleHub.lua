local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local a = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")
local egg = {}
OrionLib:AddTable(workspace["Eggs"],egg)
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

T1:AddDropdown({
  Name = "Select Computer",
  Default = "Computer1",
  Options = {"Computer1","Computer2","Computer3","Computer4","Computer5","Computer6","Computer7"},
  Callback = function(Value)
    _G._pc = Value
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

T1:AddToggle({
  Name = "Auto gift",
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

T2:AddDropdown({
  Name = "Select Egg",
  Default = "Grass Egg",
  Options = egg,
  Callback = function(Value)
    _G._table_egg = Value
  end    
})

T2:AddDropdown({
  Name = "Number of Hatches",
  Default = "1",
  Options = {"1","3","10"},
  Callback = function(Value)
    _G._table_mh = Value
  end    
})

T2:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(_)
   _G._htc = _
      while wait() do
      if _G._htc == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["EggHatchingRemotes"]["HatchingEgg"]:FireServer(workspace["Eggs"][_G._table_egg],tonumber(_G._table_mh))
    end
  end    
})

T2:AddToggle({
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