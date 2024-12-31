extends OptionButton

@onready var custom = $"../../../../.."



func _on_item_selected(index: int) -> void:
	custom.fort_attribute = index
	custom.remaining_attribute_points -= custom.fort_attribute
	



func _on_pressed() -> void:
	$".".clear()
	$".".selected = -1
	custom.fort_attribute = 0
	custom.remaining_attribute_points = custom.attribute_points - (custom.fort_attribute + custom.fin_attribute + custom.foc_attribute)
	for i in range(clampi(custom.remaining_attribute_points + 1, 1, 13)):
		$".".add_item(str(i))
