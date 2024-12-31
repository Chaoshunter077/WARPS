extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Label2/OptionButton.selected = -1
	
func _process(_delta: float) -> void:
	Global.temp_perk_points = Global.perk_points - Global.used_perk_points

	$Label.text = "Perk Points: " + str(Global.temp_perk_points)
	if $VBoxContainer/Label2/OptionButton.selected == 0:
		$ScrollContainer.visible = true
		$FMA.visible = false
		$EMA.visible = false
	elif $VBoxContainer/Label2/OptionButton.selected == 1:
		$ScrollContainer.visible = false
		$FMA.visible = true
		$EMA.visible = false
	elif $VBoxContainer/Label2/OptionButton.selected == 2:
		$ScrollContainer.visible = false
		$FMA.visible = false
		$EMA.visible = true
