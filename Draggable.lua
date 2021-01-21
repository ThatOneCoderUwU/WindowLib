return function(BaseFrame,DraggableObj)
  if not BaseFrame then
    error("No baseframe specified for draggable.lua")
  end
  DraggableObj = DraggableObj or BaseFrame
  
  local UserInputService = game:GetService("UserInputService")

  local dragPart = i

  local dragging
  local dragInput
  local dragStart
  local startPos

  local function update(input)
      local delta = input.Position - dragStart
      BaseFrame:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y),"Out","Sine",0.2,true)
  end

  DraggableObj.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
          dragging = true
          dragStart = input.Position
          startPos = BaseFrame.Position

          input.Changed:Connect(function()
              if input.UserInputState == Enum.UserInputState.End then
                  dragging = false
              end
          end)
      end
  end)

  BaseFrame.InputChanged:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
          dragInput = input
      end
  end)

  UserInputService.InputChanged:Connect(function(input)
      if input == dragInput and dragging then
          update(input)
      end
  end)
end
