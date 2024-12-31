extends Window

@onready var window = $"."
@onready var bioform = Global.bioform


func _on_back_button_pressed() -> void:
	window.hide()


func _on_fortitude_pressed() -> void:
	Global.reset_bio_defaults()
	Global.bioform = "Delta Genosian (Fortitude)"  # Set the global variable
	window.hide()


func _on_finesse_pressed() -> void:
	Global.reset_bio_defaults()
	Global.bioform = "Delta Genosian (Finesse)"  # Set the global variable
	window.hide()
