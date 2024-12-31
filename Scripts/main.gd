extends Control

func _ready() -> void:
	var save_slots = Character_Data.list_save_slots()  # Get the list of save slots (character files)
	for save_file in save_slots:
		# Extract the character name and level from the file name (assuming format "CharacterName_Level_data.json")
		var name_and_level = save_file.split("_")  # Splitting like "CharacterName_1_data.json"
		var character_name = name_and_level[0]  # The character name
		var character_level = int(name_and_level[1])  # The character level
		
		create_character_button(character_name, character_level)
		delete_character_button(character_name, character_level)
# Create a button for each character save
func create_character_button(character_name: String, character_level: int):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = str(character_name) + ": Level " + str(character_level)  # Display the character name on the button
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_character_button_pressed").bind(button, character_name, character_level))
	
	# Add the styles for the button (normal, hovered, pressed, disabled)
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()

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
	
	# Add the button to the VBoxContainer
	$SavedCharacterPopupWindow/ScrollContainer/VBoxContainer.add_child(button)

# When a character button is pressed, load the character's data and switch scenes
func _on_character_button_pressed(button: Button, character_name: String, character_level: int):
	# Load the character data
	Character_Data.load_character_data(character_name, character_level)
	
	# Switch to the character sheet scene
	get_tree().change_scene_to_file("res://Scenes/Misc/character_sheet.tscn")






func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_new_character_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Bioform Windows/Name.tscn")
	Global.reset_character()



func _on_view_character_button_pressed() -> void:
	$SavedCharacterPopupWindow.show()
	Global.reset_character()

func _on_view_delete_character_button_pressed() -> void:
	$DeleteCharacterPopupWindow.show()
	Global.reset_character()



# Create a button for each character save
func delete_character_button(character_name: String, character_level: int):
	var button = Button.new()
	button.add_theme_font_size_override("font_size", 15)
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.mouse_filter = Control.MOUSE_FILTER_PASS
	button.text = str(character_name) + ": Level " + str(character_level)
	button.custom_minimum_size = Vector2(100, 30)  # Adjust button size if needed
	button.pressed.connect(Callable(self, "_on_delete_character_button_pressed").bind(button, character_name, character_level))
	
	# Add the styles for the button (normal, hovered, pressed, disabled)
	var style_normal = StyleBoxTexture.new()
	var style_hovered = StyleBoxTexture.new()
	var style_pressed = StyleBoxTexture.new()
	var style_dis = StyleBoxTexture.new()

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
	
	# Add the button to the VBoxContainer
	$DeleteCharacterPopupWindow/ScrollContainer/VBoxContainer.add_child(button)

# When a delete character button is pressed, ask for confirmation
func _on_delete_character_button_pressed(button: Button, character_name: String, character_level: int):
	# Show the delete warning window
	$DeleteWarningWindow.show()
	
	# Connect 'Yes' button with bind() to pass arguments
	$DeleteWarningWindow/Yes.connect("pressed", Callable(self, "_on_confirm_delete").bind(character_name, character_level))
	
	# Connect 'No' button to cancel deletion
	$DeleteWarningWindow/No.connect("pressed", Callable(self, "_on_cancel_delete"))

# Handle confirming character deletion
func _on_confirm_delete(character_name: String, character_level: int):
	# Delete the character data
	Character_Data.delete_character(character_name, character_level)
	
	# Refresh the character buttons after deletion
	_refresh_character_buttons()
	print("Character deleted: " + character_name)
	
	# Hide the delete confirmation window
	$DeleteWarningWindow.hide()

# Handle canceling the deletion
func _on_cancel_delete():
	print("Character deletion canceled.")
	$DeleteWarningWindow.hide()
	
	
# Refresh the character buttons list after deletion
func _refresh_character_buttons():
	# Clear the previous character buttons
	var vbox = $SavedCharacterPopupWindow/ScrollContainer/VBoxContainer
	var vbox2 = $DeleteCharacterPopupWindow/ScrollContainer/VBoxContainer

	for child in vbox.get_children():
		child.queue_free()  # Remove each child node from the VBoxContainer
		
	for child in vbox2.get_children():
		child.queue_free()  # Remove each child node from the VBoxContainer

	# Repopulate the list after deletion
	var save_slots = Character_Data.list_save_slots()  # Get the updated list of save slots (character files)
	for save_file in save_slots:
		# Extract the character name and level from the file name
		var name_and_level = save_file.split("_")  # Splitting like "CharacterName_1_data.json"
		var character_name = name_and_level[0]  # The character name
		var character_level = int(name_and_level[1])  # The character level
		
		create_character_button(character_name, character_level)
		delete_character_button(character_name, character_level)
