local module = {}

local InitWindowObject = function()
		local a=Instance.new"ScreenGui"
		a.Name="Window"
		local b=Instance.new"Frame"
		b.Name="Container"
		b.AnchorPoint=Vector2.new(0.5,0.5)
		b.Size=UDim2.new(0.5338284,0,0.4115479,0)
		b.Position=UDim2.new(0.5,0,0.5356265,0)
		b.BorderSizePixel=0
		b.BackgroundColor3=Color3.fromRGB(43,43,43)
		b.Parent=a
		local c=Instance.new"Frame"
		c.AnchorPoint=Vector2.new(0.5,1)
		c.Size=UDim2.new(1,0,0,32)
		c.Position=UDim2.new(0.5,0,0,0)
		c.BorderSizePixel=0
		c.BackgroundColor3=Color3.fromRGB(59,0,255)
		c.Parent=b
		local d=Instance.new"TextLabel"
		d.Name="Title"
		d.AnchorPoint=Vector2.new(0.5,0.5)
		d.Size=UDim2.new(0.8408037,0,0.6875,0)
		d.BackgroundTransparency=1
		d.Position=UDim2.new(0.4868625,0,0.5,0)
		d.BorderSizePixel=0
		d.BackgroundColor3=Color3.fromRGB(255,255,255)
		d.TextColor3=Color3.fromRGB(255,255,255)
		d.Text="Title"
		d.TextWrap=true
		d.Font=17
		d.TextWrapped=true
		d.TextXAlignment=0
		d.TextScaled=true
		d.Parent=c
		local e=Instance.new"ImageButton"
		e.Name="Icon"
		e.Size=UDim2.new(0.0510046,0,1,0)
		e.BackgroundTransparency=1
		e.BorderSizePixel=0
		e.BackgroundColor3=Color3.fromRGB(255,255,255)
		e.Image="rbxasset://textures/ui/GuiImagePlaceholder.png"
		e.Parent=c
		local f=Instance.new"UIAspectRatioConstraint"
		f.DominantAxis=1
		f.Parent=e
		local g=Instance.new"TextButton"
		g.Name="Close"
		g.AnchorPoint=Vector2.new(1,1)
		g.Size=UDim2.new(0.2241113,0,0.1335821,0)
		g.Position=UDim2.new(0.9644513,0,0.961194,0)
		g.BorderSizePixel=0
		g.BackgroundColor3=Color3.fromRGB(31,31,31)
		g.FontSize=5
		g.TextSize=14
		g.TextColor3=Color3.fromRGB(255,255,255)
		g.Text="Close"
		g.TextWrap=true
		g.Font=3
		g.TextWrapped=true
		g.TextScaled=true
		g.Parent=b
		local h=Instance.new"TextLabel"
		h.Name="Description"
		h.AnchorPoint=Vector2.new(0.5,0.5)
		h.Size=UDim2.new(0.815,0,0.6895522,0)
		h.BackgroundTransparency=1
		h.Position=UDim2.new(0.4860896,0,0.4985075,0)
		h.BorderSizePixel=0
		h.BackgroundColor3=Color3.fromRGB(255,255,255)
		h.FontSize=7
		h.TextSize=20
		h.RichText=true
		h.TextColor3=Color3.fromRGB(255,255,255)
		h.Text="Description"
		h.TextWrap=true
		h.TextWrapped=true
		h.Parent=b
		
		return a
end


local cont = InitWindowObject()

function module.new(insertIntoCoreGui)
	local cont = cont:Clone()
	
	local titleFrame = cont.Frame
	local title = titleFrame.Title
	local icon = titleFrame.Icon

	local close = cont.Close
	local desc = cont.Description
	
	if insertIntoCoreGui then
		local gui = Instance.new("ScreenGui")
		cont.Parent=gui
		gui.ResetOnSpawn=false
		gui.IgnoreGuiInset=true
		gui.DisplayOrder=100000
	end

	close.MouseButton1Click:Connect(function()
		game:GetService("RunService").RenderStepped:Wait()
		cont:Destroy()
	end)
	
	local mod = {}
	
	function mod:SetTitle(titleText)
		title.Text=titleText
		return self
	end
	function mod:GetTitle()
		return title.Text
	end
	
	function mod:SetDesc(descText)
		desc.Text=descText
		return self
	end
	function mod:GetDesc()
		return desc.Text
	end
	
	function mod:BindClose(callback)
		close.MouseButton1Click:Connect(function()
			callback()
		end)
	end

	function mod:SetIco(icoLink)
		icon.Link=icoLink
		return self
	end
	function mod:GetIco()
		return icon.Link
	end

	function mod:GetFrame()
		return cont
	end
	
	return mod
end

return module
