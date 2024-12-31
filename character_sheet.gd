extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	for traits in Global.temp_traits:
		create_trait_item_button(traits)
	for abilities in Global.temp_abilities:
		create_ability_item_button(abilities)
	for abilities in Global.bio_bonus_abilities:
		create_ability_item_button(abilities)
	for skills in Global.total_skills:
		create_skill_label(skills)
	for customs in Global.custom_traits:
		create_custom_item_button(customs)
	for actions in Global.total_actions:
		create_action_button(actions)
	for items in Global.equip_purchased:
		create_item_button(items)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PanelContainer/HBoxContainer/Name.text = "Name: " + str(Global.charname)
	$PanelContainer/HBoxContainer/Bioform.text = "Bioform: " + str(Global.bioform)
	$PanelContainer/HBoxContainer/Profession.text = "Profession: " + str(Global.profession)
	$PanelContainer2/HBoxContainer/VBoxContainer2/FortLevel.text = str(Global.fort_level)
	$PanelContainer2/HBoxContainer/VBoxContainer2/FinLevel.text = str(Global.fin_level)
	$PanelContainer2/HBoxContainer/VBoxContainer2/FocLevel.text = str(Global.foc_level)
	$PanelContainer2/HBoxContainer/VBoxContainer3/FortSD.text = str(Global.fort_sd)
	$PanelContainer2/HBoxContainer/VBoxContainer3/FinSD.text = str(Global.fin_sd)
	$PanelContainer2/HBoxContainer/VBoxContainer3/FocSD.text = str(Global.foc_sd)
	$PanelContainer2/HBoxContainer/VBoxContainer4/FortRes.text = str(Global.fort_res)
	$PanelContainer2/HBoxContainer/VBoxContainer4/FinRes.text = str(Global.fin_res)
	$PanelContainer2/HBoxContainer/VBoxContainer4/FocRes.text = str(Global.foc_res)
	$PanelContainer3/TextureRect/Level.text = str(Global.charlevel)
	$"PanelContainer3/TextureRect/Skill Tier".text = str(Global.charst)
	$PanelContainer3/TextureRect/Vigor.text = str(Global.max_vigor)
	$PanelContainer3/TextureRect/Energy.text = "/" + str(Global.max_energy)
	$PanelContainer3/TextureRect/tempvigor.placeholder_text = str(0)
	$PanelContainer3/TextureRect/tempenergy.placeholder_text = str(Global.max_energy)
	$PanelContainer3/TextureRect/wounds.placeholder_text = str(Global.total_wounds)
	$Inventory/VBoxContainer/Label/Gold.text = "Gold: " + str(Global.gold)


func create_trait_item_button(traits):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = traits
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_trait_button_pressed").bind(button,traits))
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
	$Traits/VBoxContainer/TraitsContainer/VBoxContainer.add_child(button)

func create_custom_item_button(customs):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = customs
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_customs_button_pressed").bind(button,customs))
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
	$Traits/VBoxContainer/TraitsContainer/VBoxContainer.add_child(button)

func create_ability_item_button(abilities):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = abilities
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_ability_button_pressed").bind(button,abilities))
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
	$Abilities/VBoxContainer/AbilitiesContainer/VBoxContainer.add_child(button)

func create_skill_label(skills):
	var label = Label.new()
	label.add_theme_font_size_override("font_size", 15)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.text = skills + ": " + str(Global.total_skills[skills])
	label.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	var style_normal = StyleBoxTexture.new()
# Set the texture for the normal state
	var textureN = load("res://Assets/UI/panel_grey_bolts_blue.svg")  # Replace with your texture file

	style_normal.texture = textureN
# Optionally, adjust the margin (padding) of the StyleBox
	style_normal.texture_margin_left = 20
	style_normal.texture_margin_top = 20
	style_normal.texture_margin_right = 20
	style_normal.texture_margin_bottom = 20
	

	label.add_theme_stylebox_override("normal", style_normal)
	$Skills/VBoxContainer/SkillsContainer/VBoxContainer.add_child(label)

func create_action_button(actions):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = actions
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_action_button_pressed").bind(button, actions))
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
	$Actions/VBoxContainer/ActionsContainer/VBoxContainer.add_child(button)

func create_item_button(items):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = items["name"]
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_item_button_pressed").bind(button, items))
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
	$Inventory/VBoxContainer/ActionsContainer/GridContainer.add_child(button)



func _on_trait_button_pressed(button: Button, traits):

		$CharacterSheetPopupWindow.show()
		$CharacterSheetPopupWindow/name.text = traits
		$CharacterSheetPopupWindow/description.text = Global.available_traits[traits]

func _on_customs_button_pressed(button: Button, customs):

		$CharacterSheetPopupWindow.show()
		$CharacterSheetPopupWindow/name.text = customs
		$CharacterSheetPopupWindow/description.text = Global.available_traits[Global.custom_traits[customs]]

func _on_ability_button_pressed(button: Button, abilities):

		$CharacterSheetPopupWindow.show()
		if Global.FMA_abilities.has(abilities):
			$CharacterSheetPopupWindow/name.text = abilities
			$CharacterSheetPopupWindow/description.text = Global.FMA_abilities[abilities]
		elif Global.EMA_abilities.has(abilities):
			$CharacterSheetPopupWindow/name.text = abilities
			$CharacterSheetPopupWindow/description.text = Global.EMA_abilities[abilities]

func _on_action_button_pressed(button: Button, actions):

		$CharacterSheetPopupWindow.show()
		$CharacterSheetPopupWindow/name.text = actions
		$CharacterSheetPopupWindow/description.text = Global.total_actions[actions]

func _on_item_button_pressed(button: Button, items):

		$CharacterSheetPopupWindow.show()
		$CharacterSheetPopupWindow/name.text = items["name"]
		$CharacterSheetPopupWindow/description.text = str(items["slot"]) + "\n" + str(items["bonus"]) + "\n" + str(items["cost"]) + " Gold."


func _on_wounds_text_changed(new_text: String) -> void:
	Global.wounds = int(new_text)


func _on_button_pressed() -> void:
		$CharacterSheetPopupWindow.show()
		$CharacterSheetPopupWindow/name.text = "Starting Traits"
		$CharacterSheetPopupWindow/description.text = (", ".join(Global.starting_traits))


func _on_save_pressed() -> void:
	Character_Data.save_character_data()
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	print("pressed")


func _on_edit_items_pressed() -> void:
	get_tree().change_scene_to_file("res://edit_equipment_tab.tscn")
