extends Window
@onready var window = $"."

func _on_back_button_pressed() -> void:
	window.hide()


func _on_select_button_pressed() -> void:
	Global.reset_profession_defaults()
	Global.profession = "Performer"
	window.hide()
