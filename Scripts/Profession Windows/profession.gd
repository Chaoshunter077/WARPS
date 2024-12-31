extends Control



func _ready() -> void:
	$VBoxContainer/profession.text = "Profession: " + Global.profession
	$VBoxContainer2/Label.text = "Skill Dice Allocation: " + str(Global.temp_sd)

func _process(_delta: float) -> void:
	$VBoxContainer/profession.text = "Profession: " + Global.profession
	$VBoxContainer2/Label.text = "Skill Dice Allocation: " + str(Global.temp_sd)
	$VBoxContainer2/HBoxContainer/Fortitude/Label/Fortitude_SD_Button.selected = Global.bio_fort_sd 
	$VBoxContainer2/HBoxContainer/Finesse/Label/Finesse_SD_Button.selected = Global.bio_fin_sd
	$VBoxContainer2/HBoxContainer/Focus/Label/Focus_SD_Button.selected = Global.bio_foc_sd
	Global.temp_sd = Global.max_sd - (Global.bio_fort_sd + Global.bio_fin_sd + Global.bio_foc_sd)
	
	
func _on_biochemist_button_pressed() -> void:
	$BiochemistWindow.show()
func _on_metalsmith_button_pressed() -> void:
	$MetalsmithWindow.show()
func _on_technician_button_pressed() -> void:
	$TechnicianWindow.show()
func _on_mechanizer_button_pressed() -> void:
	$MechanizerWindow.show()
func _on_augmenter_button_pressed() -> void:
	$AugmenterWindow.show()
func _on_performer_button_pressed() -> void:
	$PerformerWindow.show()
func _on_custom_button_pressed() -> void:
	pass
