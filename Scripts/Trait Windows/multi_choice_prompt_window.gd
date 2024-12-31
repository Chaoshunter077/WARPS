extends Window

func _on_cancel_pressed() -> void:
	$".".hide()

func _on_choose_pressed() -> void:
	$".".hide()
	$"../Trait Window".show()

func _on_remove_pressed() -> void:
	$".".hide()
	$"../Trait Remove Window".show()


func _on_visibility_changed() -> void:
	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		$HBoxContainer/Choose.disabled = true
	else:
		$HBoxContainer/Choose.disabled = false
