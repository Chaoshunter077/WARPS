extends Window

@onready var window = $"."


func _on_back_button_pressed() -> void:
	window.hide()


func _on_select_button_pressed() -> void:
	Global.reset_bio_defaults()
	Global.bioform = "Zeta Genosian"  # Set the global variable
	window.hide()
