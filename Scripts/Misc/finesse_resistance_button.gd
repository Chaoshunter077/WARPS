extends OptionButton

@onready var custom = $"../../../../.."



func _on_item_selected(index: int) -> void:
	custom.fin_resistance = index
	custom.remaining_resistance_points -= custom.fin_resistance
	



func _on_pressed() -> void:
	$".".clear()
	$".".selected = -1
	custom.fin_resistance = 0
	custom.remaining_resistance_points = custom.resistance_points - (custom.fort_resistance + custom.fin_resistance + custom.foc_resistance)
	for i in range(clampi(custom.remaining_resistance_points + 1, 1, 9)):
		$".".add_item(str(i))
