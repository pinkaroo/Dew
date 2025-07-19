return function(title, message, duration)
	local tween_service = game:GetService("TweenService")
	local core_gui = gethui()
	local http_service = game:GetService("HttpService")

	local function guid()
		return http_service:GenerateGUID(false)
	end

	local notif_container = core_gui:FindFirstChild("notif_container")
	if not notif_container then
		notif_container = Instance.new("ScreenGui")
		notif_container.Name = "notif_container"
		notif_container.ResetOnSpawn = false
		notif_container.IgnoreGuiInset = true
		notif_container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		notif_container.Parent = core_gui

		local holder = Instance.new("Frame")
		holder.Name = "holder"
		holder.AnchorPoint = Vector2.new(0.5, 0)
		holder.Position = UDim2.new(0.5, 0, 0, 20)
		holder.Size = UDim2.new(0, 220, 1, -40)
		holder.BackgroundTransparency = 1
		holder.BorderSizePixel = 0
		holder.ZIndex = 9
		holder.Parent = notif_container

		local layout = Instance.new("UIListLayout")
		layout.Name = "layout"
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, 6)
		layout.VerticalAlignment = Enum.VerticalAlignment.Top
		layout.Parent = holder
	end

	local id = guid()
	local frame = Instance.new("Frame")
	frame.Name = id
	frame.Size = UDim2.new(1, 0, 0, 60)
	frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	frame.BorderColor3 = Color3.fromRGB(85, 85, 85)
	frame.BorderSizePixel = 1
	frame.ClipsDescendants = true
	frame.ZIndex = 10
	frame.Parent = notif_container.holder

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 48)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
	})
	gradient.Rotation = 90
	gradient.Parent = frame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = frame

	local title_label = Instance.new("TextLabel")
	title_label.Name = "title"
	title_label.Size = UDim2.new(1, -20, 0, 22)
	title_label.Position = UDim2.new(0, 10, 0, 6)
	title_label.BackgroundTransparency = 1
	title_label.Text = title
	title_label.TextSize = 17
	title_label.Font = Enum.Font.SourceSansSemibold
	title_label.TextColor3 = Color3.fromRGB(255, 255, 255)
	title_label.TextXAlignment = Enum.TextXAlignment.Left
	title_label.ZIndex = 11
	title_label.Parent = frame

	local message_label = Instance.new("TextLabel")
	message_label.Name = "message"
	message_label.Size = UDim2.new(1, -20, 0, 18)
	message_label.Position = UDim2.new(0, 10, 0, 28)
	message_label.BackgroundTransparency = 1
	message_label.Text = message
	message_label.TextSize = 15
	message_label.Font = Enum.Font.SourceSans
	message_label.TextColor3 = Color3.fromRGB(204, 204, 204)
	message_label.TextXAlignment = Enum.TextXAlignment.Left
	message_label.TextWrapped = true
	message_label.ZIndex = 11
	message_label.Parent = frame

	local bar = Instance.new("Frame")
	bar.Name = "bar"
	bar.AnchorPoint = Vector2.new(0, 1)
	bar.Position = UDim2.new(0, 0, 1, 0)
	bar.Size = UDim2.new(1, 0, 0, 3)
	bar.BackgroundColor3 = Color3.fromRGB(27, 161, 226)
	bar.BorderSizePixel = 0
	bar.ZIndex = 12
	bar.Parent = frame

	local bar_tween = tween_service:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 0, 3)
	})

	local frame_tween = tween_service:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 0, 0)
	})

	bar_tween:Play()

	task.delay(duration, function()
		if frame and frame.Parent then
			frame_tween:Play()
			frame_tween.Completed:Wait()
			frame:Destroy()
		end
	end)
end
