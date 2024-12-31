extends OptionButton


	
func _on_item_selected(index: int) -> void:
	Global.bio_fort_sd = index
	Global.temp_sd -= Global.bio_fort_sd
	print(Global.temp_sd)


func _on_pressed() -> void:
	$".".clear()
	$".".selected = -1
	Global.bio_fort_sd = 0
	Global.temp_sd = Global.max_sd - (Global.bio_fort_sd + Global.bio_fin_sd + Global.bio_foc_sd)
	for i in range(Global.temp_sd + 1):
		$".".add_item(str(i))
	print(Global.temp_sd)
