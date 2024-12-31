extends Control


# Called when the node enters the scene tree for the first time.

	
func _process(_delta: float) -> void:
	$Label.text = "Character Traits: " + str(Global.temp_trait_points)
	
