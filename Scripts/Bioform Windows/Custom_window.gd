extends Window

@export var temp_size = -1
@export var temp_vigor = 0
@export var temp_sd = 0
@export var attribute_points = 0 
@export var remaining_attribute_points = 0
@export var resistance_points = 0
@export var remaining_resistance_points = 0
@onready var fort_attribute = 0
@onready var fin_attribute = 0
@onready var foc_attribute = 0
@onready var fort_resistance = 0
@onready var fin_resistance = 0
@onready var foc_resistance = 0

func _ready() -> void:
	$VBoxContainer2/Label.text = "Attribute Levels: " + str(remaining_attribute_points)
	$VBoxContainer2/Label2.text = "Resistance Levels: " + str(remaining_resistance_points)
func _process(_delta: float) -> void:
	$VBoxContainer2/Label.text = "Attribute Levels: " + str(remaining_attribute_points)
	$VBoxContainer2/Label2.text = "Resistance Levels: " + str(remaining_resistance_points)



func _on_level_select_item_selected(index: int) -> void:
	$VBoxContainer2/HBoxContainer/Fortitude/Label/Fortitude_Atr_Button.selected = 0
	fort_attribute = 0
	$VBoxContainer2/HBoxContainer/Finesse/Label/Finesse_Atr_Button.selected = 0
	fin_attribute = 0
	$VBoxContainer2/HBoxContainer/Focus/Label/Focus_Atr_Button.selected = 0
	foc_attribute = 0
	
	$VBoxContainer2/HBoxContainer2/Fortitude/Label/Fortitude_Res_Button.selected = 0
	fort_resistance = 0
	$VBoxContainer2/HBoxContainer2/Finesse/Label/Finesse_Res_Button.selected = 0
	fin_resistance = 0
	$VBoxContainer2/HBoxContainer2/Focus/Label/Focus_Res_Button.selected = 0
	foc_resistance = 0

	
	temp_size = index
	if temp_size == 0:
		temp_vigor = 15
		temp_sd = 2
		attribute_points = 28
		resistance_points = 8

	elif temp_size == 1:
		temp_vigor = 23
		temp_sd = 3
		attribute_points = 27
		resistance_points = 9
	
	elif temp_size == 2:
		temp_vigor = 30
		temp_sd = 4
		attribute_points = 26
		resistance_points = 10
	else:
		pass
	$Size2/Label.text = "Vigor: " + str(temp_vigor)
	$Size2/Label2.text = "SD: " + str(temp_sd)
	remaining_attribute_points = attribute_points
	remaining_resistance_points = resistance_points
	
	$VBoxContainer2/Label.text = "Attribute Levels: " + str(attribute_points)
	$VBoxContainer2/Label2.text = "Resistance Levels: " + str(resistance_points)

func _on_select_button_pressed() -> void:
	Global.reset_bio_defaults()
	Global.charsize = temp_size
	Global.bioform = $LineEdit.text
	Global.bio_bonus_fort_level = fort_attribute
	Global.bio_bonus_fin_level = fin_attribute
	Global.bio_bonus_foc_level= foc_attribute
	Global.bio_bonus_fort_res = fort_resistance
	Global.bio_bonus_fin_res = fin_resistance
	Global.bio_bonus_foc_res = foc_resistance
	
	if Global.charsize == 0:
		Global.bio_bonus_vigor = 15
		Global.bio_bonus_sd = 2
	elif Global.charsize == 1:
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
	elif Global.charsize == 2:
		Global.bio_bonus_vigor = 30
		Global.bio_bonus_sd = 4
	else:
		pass
	$".".hide()
	print(Global.bio_bonus_sd)


func _on_back_button_pressed() -> void:
	$".".hide()


















func _on_trait_type_item_selected(index: int) -> void:
	if index == 5:
		$HBoxContainer/TraitDescription.hide()
		$HBoxContainer/CustomText.show()
		$HBoxContainer/TraitModifier.clear()
		$HBoxContainer/TraitModifier.add_item(str("+"))
		$HBoxContainer/TraitModifier.selected = -1
	else:
		$HBoxContainer/TraitDescription.show()
		$HBoxContainer/CustomText.hide()
		$HBoxContainer/CustomText.clear()
		
