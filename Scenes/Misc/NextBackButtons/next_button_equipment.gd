extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	if Global.temp_ability_points == 0:
		Global.perk_points = (Global.charlevel - 1) * 2
		get_tree().change_scene_to_file("res://Scenes/Misc/perk_point_selection.tscn")
	else:
		$"../AbilityWarningWindow".show()
