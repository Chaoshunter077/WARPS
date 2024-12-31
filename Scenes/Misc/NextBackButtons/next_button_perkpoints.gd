extends Button

func _on_pressed() -> void:
	if Global.used_perk_points == Global.perk_points:
		get_tree().change_scene_to_file("res://Scenes/Misc/equipment_selection.tscn")
	else:
		$"../PerkPointWarningWindow".show()
