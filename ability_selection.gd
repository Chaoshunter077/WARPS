extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Label2/OptionButton.selected = -1
	
func _process(_delta: float) -> void:
	$Label.text = "Character Abilities: " + str(Global.temp_ability_points)
	if $VBoxContainer/Label2/OptionButton.selected == 0:
		$FMA.visible = true
		$EMA.visible = false
	elif $VBoxContainer/Label2/OptionButton.selected == 1:
		$FMA.visible = false
		$EMA.visible = true
