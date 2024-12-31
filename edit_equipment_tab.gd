extends Control
func _process(delta: float) -> void:
	if $Categories/Label2/OptionButton.selected == 0:
		$Fortitude.visible = true
		$Finesse.visible = false
		$Focus.visible = false
		$Accessories.visible = false
		$Inventory.visible = false
	elif $Categories/Label2/OptionButton.selected == 1:
		$Fortitude.visible = false
		$Finesse.visible = true
		$Focus.visible = false
		$Accessories.visible = false
		$Inventory.visible = false
	elif $Categories/Label2/OptionButton.selected == 2:
		$Fortitude.visible = false
		$Finesse.visible = false
		$Focus.visible = true
		$Accessories.visible = false
		$Inventory.visible = false
	elif $Categories/Label2/OptionButton.selected == 3:
		$Fortitude.visible = false
		$Finesse.visible = false
		$Focus.visible = false
		$Accessories.visible = true
		$Inventory.visible = false
	elif $Categories/Label2/OptionButton.selected == 4:
		$Fortitude.visible = false
		$Finesse.visible = false
		$Focus.visible = false
		$Accessories.visible = false
		$Inventory.visible = true

func _ready():
	for item_name in Global.fort_equip.keys():
		var item_data = Global.fort_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_fort_item_button(item_name, item_slot, item_desc, item_cost, item_data, true)

	for item_name in Global.fin_equip.keys():
		var item_data = Global.fin_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_fin_item_button(item_name, item_slot, item_desc, item_cost, item_data, true)

	for item_name in Global.foc_equip.keys():
		var item_data = Global.foc_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_foc_item_button(item_name, item_slot, item_desc, item_cost, item_data, true)

	for item_name in Global.acc_equip.keys():
		var item_data = Global.acc_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_acc_item_button(item_name, item_slot, item_desc, item_cost, item_data, true)
		
	for purchased_item in Global.equip_purchased:
		create_inv_item_button(purchased_item["name"], purchased_item["slot"], purchased_item["bonus"], purchased_item["cost"], purchased_item)


func create_fort_item_button(item_name: String, item_slot: String, item_desc: String, item_cost: int, item_data: Dictionary, is_purchased: bool = false):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_pressed_color", "00ff00")
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.toggle_mode = true
	button.text = item_name + "    " + item_slot + "    " + item_desc + "    " + str(item_cost) + " Gold" # Set button text to item name
	button.custom_minimum_size = Vector2(200, 40)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_item_button_pressed").bind(button, item_name, item_slot, item_desc, item_cost, item_data))
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()
# Set the texture for the normal state
	var textureN = load("res://Assets/UI/panel_grey_bolts_blue.svg")  # Replace with your texture file
	var textureH = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureP = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureD = load("res://Assets/UI/panel_grey_bolts_red.svg")  # Replace with your texture file

	style_normal.texture = textureN
	style_hovered.texture = textureH
	style_pressed.texture = textureP
	style_dis.texture = textureD
# Optionally, adjust the margin (padding) of the StyleBox
	style_normal.texture_margin_left = 20
	style_normal.texture_margin_top = 20
	style_normal.texture_margin_right = 20
	style_normal.texture_margin_bottom = 20
	
	style_hovered.texture_margin_left = 20
	style_hovered.texture_margin_top = 20
	style_hovered.texture_margin_right = 20
	style_hovered.texture_margin_bottom = 20
	
	style_pressed.texture_margin_left = 20
	style_pressed.texture_margin_top = 20
	style_pressed.texture_margin_right = 20
	style_pressed.texture_margin_bottom = 20
	
	style_dis.texture_margin_left = 20
	style_dis.texture_margin_top = 20
	style_dis.texture_margin_right = 20
	style_dis.texture_margin_bottom = 20


	button.add_theme_stylebox_override("normal", style_normal)
	button.add_theme_stylebox_override("hover", style_hovered)
	button.add_theme_stylebox_override("pressed", style_pressed)
	button.add_theme_stylebox_override("disabled", style_dis)
	$Fortitude/VBoxContainer.add_child(button)

func create_fin_item_button(item_name: String, item_slot: String, item_desc: String, item_cost: int, item_data: Dictionary, is_purchased: bool = false):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_pressed_color", "00ff00")
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.toggle_mode = true
	button.text = item_name + "    " + item_slot + "    " + item_desc + "    " + str(item_cost) + " Gold" # Set button text to item name
	button.custom_minimum_size = Vector2(200, 40)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_item_button_pressed").bind(button, item_name, item_slot, item_desc, item_cost, item_data))
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()
# Set the texture for the normal state
	var textureN = load("res://Assets/UI/panel_grey_bolts_blue.svg")  # Replace with your texture file
	var textureH = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureP = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureD = load("res://Assets/UI/panel_grey_bolts_red.svg")  # Replace with your texture file

	style_normal.texture = textureN
	style_hovered.texture = textureH
	style_pressed.texture = textureP
	style_dis.texture = textureD
# Optionally, adjust the margin (padding) of the StyleBox
	style_normal.texture_margin_left = 20
	style_normal.texture_margin_top = 20
	style_normal.texture_margin_right = 20
	style_normal.texture_margin_bottom = 20
	
	style_hovered.texture_margin_left = 20
	style_hovered.texture_margin_top = 20
	style_hovered.texture_margin_right = 20
	style_hovered.texture_margin_bottom = 20
	
	style_pressed.texture_margin_left = 20
	style_pressed.texture_margin_top = 20
	style_pressed.texture_margin_right = 20
	style_pressed.texture_margin_bottom = 20
	
	style_dis.texture_margin_left = 20
	style_dis.texture_margin_top = 20
	style_dis.texture_margin_right = 20
	style_dis.texture_margin_bottom = 20


	button.add_theme_stylebox_override("normal", style_normal)
	button.add_theme_stylebox_override("hover", style_hovered)
	button.add_theme_stylebox_override("pressed", style_pressed)
	button.add_theme_stylebox_override("disabled", style_dis)
	$Finesse/VBoxContainer.add_child(button)

func create_foc_item_button(item_name: String, item_slot: String, item_desc: String, item_cost: int, item_data: Dictionary, is_purchased: bool = false):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_pressed_color", "00ff00")
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.toggle_mode = true
	button.text = item_name + "    " + item_slot + "    " + item_desc + "    " + str(item_cost) + " Gold" # Set button text to item name
	button.custom_minimum_size = Vector2(200, 40)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_item_button_pressed").bind(button, item_name, item_slot, item_desc, item_cost, item_data))
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()
# Set the texture for the normal state
	var textureN = load("res://Assets/UI/panel_grey_bolts_blue.svg")  # Replace with your texture file
	var textureH = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureP = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureD = load("res://Assets/UI/panel_grey_bolts_red.svg")  # Replace with your texture file

	style_normal.texture = textureN
	style_hovered.texture = textureH
	style_pressed.texture = textureP
	style_dis.texture = textureD
# Optionally, adjust the margin (padding) of the StyleBox
	style_normal.texture_margin_left = 20
	style_normal.texture_margin_top = 20
	style_normal.texture_margin_right = 20
	style_normal.texture_margin_bottom = 20
	
	style_hovered.texture_margin_left = 20
	style_hovered.texture_margin_top = 20
	style_hovered.texture_margin_right = 20
	style_hovered.texture_margin_bottom = 20
	
	style_pressed.texture_margin_left = 20
	style_pressed.texture_margin_top = 20
	style_pressed.texture_margin_right = 20
	style_pressed.texture_margin_bottom = 20
	
	style_dis.texture_margin_left = 20
	style_dis.texture_margin_top = 20
	style_dis.texture_margin_right = 20
	style_dis.texture_margin_bottom = 20


	button.add_theme_stylebox_override("normal", style_normal)
	button.add_theme_stylebox_override("hover", style_hovered)
	button.add_theme_stylebox_override("pressed", style_pressed)
	button.add_theme_stylebox_override("disabled", style_dis)
	$Focus/VBoxContainer.add_child(button)

func create_acc_item_button(item_name: String, item_slot: String, item_desc: String, item_cost: int, item_data: Dictionary, is_purchased: bool = false):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_pressed_color", "00ff00")
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.toggle_mode = true
	button.text = item_name + "    " + item_slot + "    " + item_desc + "    " + str(item_cost) + " Gold" # Set button text to item name
	button.custom_minimum_size = Vector2(200, 40)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_item_button_pressed").bind(button, item_name, item_slot, item_desc, item_cost, item_data))
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()
# Set the texture for the normal state
	var textureN = load("res://Assets/UI/panel_grey_bolts_blue.svg")  # Replace with your texture file
	var textureH = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureP = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureD = load("res://Assets/UI/panel_grey_bolts_red.svg")  # Replace with your texture file

	style_normal.texture = textureN
	style_hovered.texture = textureH
	style_pressed.texture = textureP
	style_dis.texture = textureD
# Optionally, adjust the margin (padding) of the StyleBox
	style_normal.texture_margin_left = 20
	style_normal.texture_margin_top = 20
	style_normal.texture_margin_right = 20
	style_normal.texture_margin_bottom = 20
	
	style_hovered.texture_margin_left = 20
	style_hovered.texture_margin_top = 20
	style_hovered.texture_margin_right = 20
	style_hovered.texture_margin_bottom = 20
	
	style_pressed.texture_margin_left = 20
	style_pressed.texture_margin_top = 20
	style_pressed.texture_margin_right = 20
	style_pressed.texture_margin_bottom = 20
	
	style_dis.texture_margin_left = 20
	style_dis.texture_margin_top = 20
	style_dis.texture_margin_right = 20
	style_dis.texture_margin_bottom = 20


	button.add_theme_stylebox_override("normal", style_normal)
	button.add_theme_stylebox_override("hover", style_hovered)
	button.add_theme_stylebox_override("pressed", style_pressed)
	button.add_theme_stylebox_override("disabled", style_dis)
	$Accessories/VBoxContainer.add_child(button)

func create_inv_item_button(item_name: String, item_slot: String, item_desc: String, item_cost: int, item_data: Dictionary, is_purchased: bool = false):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_pressed_color", "ff261e")
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.toggle_mode = true
	button.text = item_name + "    " + item_slot + "    " + item_desc + "    " + str(item_cost) + " Gold" # Set button text to item name
	button.custom_minimum_size = Vector2(200, 40)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_item_button_pressed").bind(button, item_name, item_slot, item_desc, item_cost, item_data))
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()
# Set the texture for the normal state
	var textureN = load("res://Assets/UI/panel_grey_bolts_blue.svg")  # Replace with your texture file
	var textureH = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureP = load("res://Assets/UI/panel_grey_bolts_green.svg")  # Replace with your texture file
	var textureD = load("res://Assets/UI/panel_grey_bolts_red.svg")  # Replace with your texture file

	style_normal.texture = textureN
	style_hovered.texture = textureH
	style_pressed.texture = textureP
	style_dis.texture = textureD
# Optionally, adjust the margin (padding) of the StyleBox
	style_normal.texture_margin_left = 20
	style_normal.texture_margin_top = 20
	style_normal.texture_margin_right = 20
	style_normal.texture_margin_bottom = 20
	
	style_hovered.texture_margin_left = 20
	style_hovered.texture_margin_top = 20
	style_hovered.texture_margin_right = 20
	style_hovered.texture_margin_bottom = 20
	
	style_pressed.texture_margin_left = 20
	style_pressed.texture_margin_top = 20
	style_pressed.texture_margin_right = 20
	style_pressed.texture_margin_bottom = 20
	
	style_dis.texture_margin_left = 20
	style_dis.texture_margin_top = 20
	style_dis.texture_margin_right = 20
	style_dis.texture_margin_bottom = 20


	button.add_theme_stylebox_override("normal", style_normal)
	button.add_theme_stylebox_override("hover", style_hovered)
	button.add_theme_stylebox_override("pressed", style_pressed)
	button.add_theme_stylebox_override("disabled", style_dis)
	$Inventory/VBoxContainer.add_child(button)

func _on_item_button_pressed(button: Button, item_name, item_slot, item_desc, item_cost, item_data):
	var purchased_item = {"name": item_name}

	if $Inventory.visible == true:
		if button.button_pressed == true:	# Add the rest of the item data to the new dictionary
			for key in item_data.keys():
				purchased_item[key] = item_data[key]
			Global.equip_purchased.erase(purchased_item)  # Add to the purchased items list
			populate_buttons()
	else:
		if button.button_pressed == true and $Inventory.visible == false:	# Add the rest of the item data to the new dictionary
			for key in item_data.keys():
				purchased_item[key] = item_data[key]
			Global.equip_purchased.append(purchased_item)  # Add to the purchased items list
			populate_buttons()
			
	update_equip_stats()

func populate_buttons():
	clear_buttons()
	for item_name in Global.fort_equip.keys():
		var item_data = Global.fort_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_fort_item_button(item_name, item_slot, item_desc, item_cost, item_data)
			
	for item_name in Global.fin_equip.keys():
		var item_data = Global.fin_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_fin_item_button(item_name, item_slot, item_desc, item_cost, item_data)

	for item_name in Global.foc_equip.keys():
		var item_data = Global.foc_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_foc_item_button(item_name, item_slot, item_desc, item_cost, item_data)

	for item_name in Global.acc_equip.keys():
		var item_data = Global.acc_equip[item_name]
		var item_slot = item_data["slot"]
		var item_desc = item_data["bonus"]
		var item_cost = item_data["cost"]
		create_acc_item_button(item_name, item_slot, item_desc, item_cost, item_data)

	for purchased_item in Global.equip_purchased:
		create_inv_item_button(purchased_item["name"], purchased_item["slot"], purchased_item["bonus"], purchased_item["cost"], purchased_item)

func clear_buttons():
	# Iterate over all child nodes (buttons) in the VBoxContainer and remove them
	for button in $Fortitude/VBoxContainer.get_children():
		button.queue_free()  # Safely removes the button from the scene

	for button in $Finesse/VBoxContainer.get_children():
		button.queue_free()  # Safely removes the button from the scene

	for button in $Focus/VBoxContainer.get_children():
		button.queue_free()  # Safely removes the button from the scene

	for button in $Accessories/VBoxContainer.get_children():
		button.queue_free()  # Safely removes the button from the scene
		
	for button in $Inventory/VBoxContainer.get_children():
		button.queue_free()  # Safely removes the button from the scene

func update_equip_stats():
	Global.equip_bonus_fort_res = 0
	Global.equip_bonus_fin_res = 0
	Global.equip_bonus_foc_res = 0
	Global.equip_bonus_fort_att = 0
	Global.equip_bonus_fin_att = 0
	Global.equip_bonus_foc_att = 0
	Global.equip_bonus_vigor = 0
	Global.equip_bonus_energy = 0
	Global.equip_bonus_sd = 0
	Global.equip_bonus_skills.clear()
	Global.equip_bonus_fort_roll = 0
	Global.equip_bonus_fin_roll = 0
	Global.equip_bonus_foc_roll = 0
	Global.equip_bonus_fin_level = 0
	Global.equip_bonus_fort_level = 0
	Global.equip_bonus_foc_level = 0
	Global.equip_bonus_actions.clear()


	
		# Iterate over all items in equip_purchased
	for item_data in Global.equip_purchased:
		if "fortitude_resistance" in item_data:
			Global.equip_bonus_fort_res += item_data["fortitude_resistance"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "finesse_resistance" in item_data:
			Global.equip_bonus_fin_res += item_data["finesse_resistance"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "focus_resistance" in item_data:
			Global.equip_bonus_foc_res += item_data["focus_resistance"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "fortitude_attrition" in item_data:
			Global.equip_bonus_fort_att += item_data["fortitude_attrition"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "finesse_attrition" in item_data:
			Global.equip_bonus_fin_att += item_data["finesse_attrition"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "focus_attrition" in item_data:
			Global.equip_bonus_foc_att += item_data["focus_attrition"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "vigor_increase" in item_data:
			Global.equip_bonus_vigor += item_data["vigor_increase"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "energy_bonus" in item_data:
			Global.equip_bonus_energy += item_data["energy_bonus"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "sd_bonus" in item_data:
			Global.equip_bonus_sd += item_data["sd_bonus"]  # Add the resistance value to the total
	for item_data in Global.equip_purchased:
		if "fort_att_roll" in item_data:
			Global.equip_bonus_fort_roll += item_data["fort_att_roll"]  # Apply to fortitude
	for item_data in Global.equip_purchased:
		if "fin_att_roll" in item_data:
			Global.equip_bonus_fin_roll += item_data["fin_att_roll"]  # Apply to fortitude
	for item_data in Global.equip_purchased:
		if "foc_att_roll" in item_data:
			Global.equip_bonus_foc_roll += item_data["foc_att_roll"]  # Apply to fortitude
	for item_data in Global.equip_purchased:
		if "fort_level" in item_data:
			Global.equip_bonus_fort_level += item_data["fort_level"]  # Apply to fortitude
	for item_data in Global.equip_purchased:
		if "fin_level" in item_data:
			Global.equip_bonus_fin_level += item_data["fin_level"]  # Apply to fortitude
	for item_data in Global.equip_purchased:
		if "foc_level" in item_data:
			Global.equip_bonus_foc_level += item_data["foc_level"]  # Apply to fortitude
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Main Hand":  # Check if the item is in the Main Hand slot
			var item_name = item_data["name"]  # Access the item name stored in item_data
			var bonus = item_data["bonus"]  # Extract the bonus
			if "Fortitude" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str(Global.fort_att) + " " + bonus
			if "Finesse" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fin_sd) + str(Global.dice_type) + " + " + str(Global.fin_att) + " " + bonus
			if "Focus" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.foc_sd) + str(Global.dice_type) + " + " + str(Global.foc_att) + " " + bonus
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Both Hands":  # Check if the item is in the Main Hand slot
			var item_name = item_data["name"]  # Access the item name stored in item_data
			var bonus = item_data["bonus"]  # Extract the bonus
			if "Fortitude" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str(Global.fort_att) + " " + bonus
			if "Finesse" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fin_sd) + str(Global.dice_type) + " + " + str(Global.fin_att) + " " + bonus
			if "Focus" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.foc_sd) + str(Global.dice_type) + " + " + str(Global.foc_att) + " " + bonus
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Off-Hand":  # Check if the item is in the "Off-Hand" slot
			var item_name = item_data["name"]
			var bonus = item_data["bonus"]  # Extract the bonus
			for items in Global.chosen_martial_artist:
				if items in item_name:
					Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str((Global.fort_att + Global.charst + 1)) + " Fortitude Attrition. \n" + bonus

# Initialize equip_bonus_skills as a dictionary if not already initialized

# Iterate through the items in equip_purchased to collect skill negatives
	for item_data in Global.equip_purchased:
	# Check if the "skill_negatives" key exists in the item data
		if "skill_negatives" in item_data:
		# Iterate through each key-value pair in the "skill_negatives" dictionary
			for skill_name in item_data["skill_negatives"].keys():
				var modifier = item_data["skill_negatives"][skill_name]

			# Check if the skill is part of available_skills
				if Global.available_skills.has(skill_name):
				# If the skill already exists, accumulate the modifier
					if skill_name in Global.equip_bonus_skills:
						Global.equip_bonus_skills[skill_name] += modifier
					else:
					# If the skill doesn't exist, add it with the modifier
						Global.equip_bonus_skills[skill_name] = modifier

# Now, iterate over the equip_bonus_skills dictionary to apply modifiers




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Misc/character_sheet.tscn")
	accumulate_skills(Global.bio_bonus_skills)
	accumulate_skills(Global.trait_bonus_skills)
	accumulate_skills(Global.equip_bonus_skills)
	accumulate_actions(Global.bio_bonus_actions)
	accumulate_actions(Global.trait_bonus_actions)
	accumulate_actions(Global.equip_bonus_actions)
	recalculate_weapon_attrition()
	
	
func accumulate_skills(source_dict):
	for skill_name in source_dict.keys():
		var modifier = source_dict[skill_name]
		# If the skill already exists in total_skills, accumulate the modifier
		if skill_name in Global.total_skills:
			Global.total_skills[skill_name] += modifier
		else:
			# If the skill doesn't exist, initialize it with the modifier
			Global.total_skills[skill_name] = modifier

func accumulate_actions(source_dict):
	for action_name in source_dict.keys():
		var modifier = source_dict[action_name]
		Global.total_actions[action_name] = modifier


func recalculate_weapon_attrition():
	
	Global.equip_bonus_actions.clear()
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Main Hand":  # Check if the item is in the Main Hand slot
			var item_name = item_data["name"]  # Access the item name stored in item_data
			var bonus = item_data["bonus"]  # Extract the bonus
			if "Fortitude" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str(Global.fort_att) + " " + bonus
			if "Finesse" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fin_sd) + str(Global.dice_type) + " + " + str(Global.fin_att) + " " + bonus
			if "Focus" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.foc_sd) + str(Global.dice_type) + " + " + str(Global.foc_att) + " " + bonus
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Both Hands":  # Check if the item is in the Main Hand slot
			var item_name = item_data["name"]  # Access the item name stored in item_data
			var bonus = item_data["bonus"]  # Extract the bonus
			if "Fortitude" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str(Global.fort_att) + " " + bonus
			if "Finesse" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fin_sd) + str(Global.dice_type) + " + " + str(Global.fin_att) + " " + bonus
			if "Focus" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.foc_sd) + str(Global.dice_type) + " + " + str(Global.foc_att) + " " + bonus
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Off-Hand":  # Check if the item is in the "Off-Hand" slot
			var item_name = item_data["name"]
			var bonus = item_data["bonus"]  # Extract the bonus
			for items in Global.chosen_martial_artist:
				if items in item_name:
					Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str((Global.fort_att + Global.charst + 1)) + " Fortitude Attrition. \n" + bonus


func _on_check_button_toggled(toggled_on: bool) -> void:
	if $Label2/CheckButton.button_pressed == true:
		get_tree().change_scene_to_file("res://edit_equipment_gold_selection.tscn")
		$Label2/CheckButton.button_pressed == false
	else:
		pass
