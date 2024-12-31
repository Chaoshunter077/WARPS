extends Window

@onready var window = $"."


func _on_back_button_pressed() -> void:
	window.hide()

func _on_land_pressed() -> void:
	Global.reset_bio_defaults()
	Global.bioform = "Gamma Virekai (Land)"  # Set the global variable
	window.hide()


func _on_sea_pressed() -> void:
	Global.reset_bio_defaults()
	Global.bioform = "Gamma Virekai (Sea)"  # Set the global variable
	window.hide()


func _on_air_pressed() -> void:
	Global.reset_bio_defaults()
	Global.bioform = "Gamma Virekai (Air)"  # Set the global variable
	window.hide()
