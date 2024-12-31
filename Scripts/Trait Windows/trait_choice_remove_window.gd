extends Window
@onready var remove_trait_options: OptionButton = $RemoveTraitOptions
@onready var temp_index = -1
@onready var trait_st = Global.charst + 1
@onready var confirm: Button = $HBoxContainer/Confirm


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	confirm.disabled = true
	remove_trait_options.selected = -1

func _on_confirm_pressed() -> void:
	if Global.temp_trait == "Elemental Specialist":
		Global.chosen_elements.erase(remove_trait_options.get_item_text(temp_index))
		Global.elements.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index) + " Attrition")

		$"../ScrollContainer/GridContainer/+Elemental Specialist/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Gambler":
		Global.chosen_gambler.erase(remove_trait_options.get_item_text(temp_index))
		Global.gambler.insert(0, remove_trait_options.get_item_text(temp_index))
		if remove_trait_options.get_item_text(temp_index) == "Fortitude":
			Global.total_actions.erase("Fortitude " + Global.temp_trait)
		if remove_trait_options.get_item_text(temp_index) == "Finesse":
			Global.total_actions.erase("Finesse " + Global.temp_trait)
		if remove_trait_options.get_item_text(temp_index) == "Focus":
			Global.total_actions.erase("Focus " + Global.temp_trait)

		$"../ScrollContainer/GridContainer/+Gambler/Panel/TextureButton".set_pressed_no_signal(false)
	
	elif Global.temp_trait == "Martial Artist":
		Global.chosen_martial_artist.erase(remove_trait_options.get_item_text(temp_index))
		Global.martial_artist.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index) + " Attrition")

		$"../ScrollContainer/GridContainer/+Martial Artist/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Natural Resistance":
		Global.chosen_natural_resistance.erase(remove_trait_options.get_item_text(temp_index))
		Global.natural_resistance.insert(0, remove_trait_options.get_item_text(temp_index))
		if remove_trait_options.get_item_text(temp_index) == "Fortitude":
			Global.trait_bonus_fort_res -= ((Global.charst + 1)*2)
		if remove_trait_options.get_item_text(temp_index) == "Finesse":
			Global.trait_bonus_fin_res -= ((Global.charst + 1)*2)
		if remove_trait_options.get_item_text(temp_index) == "Focus":
			Global.trait_bonus_foc_res -= ((Global.charst + 1)*2)

		$"../ScrollContainer/GridContainer/+Natural Resistance/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Prodigy":
		Global.chosen_prodigy.erase(remove_trait_options.get_item_text(temp_index))
		Global.prodigy.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index) + " Ability rolls")

		$"../ScrollContainer/GridContainer/+Prodigy/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Professional":
		Global.chosen_professional.erase(remove_trait_options.get_item_text(temp_index))
		Global.professional.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index))

		$"../ScrollContainer/GridContainer/+Professional/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Reckless":
		Global.chosen_reckless.erase(remove_trait_options.get_item_text(temp_index))
		Global.reckless.insert(0, remove_trait_options.get_item_text(temp_index))
		if remove_trait_options.get_item_text(temp_index) == "Fortitude":
			Global.trait_bonus_fort_sd -= 1
			Global.trait_bonus_fort_res += ((Global.charst + 1)*2)
		if remove_trait_options.get_item_text(temp_index) == "Finesse":
			Global.trait_bonus_fin_sd -= 1
			Global.trait_bonus_fin_res += ((Global.charst + 1)*2)
		if remove_trait_options.get_item_text(temp_index) == "Focus":
			Global.trait_bonus_foc_sd -= 1
			Global.trait_bonus_foc_res += ((Global.charst + 1)*2)
		$"../ScrollContainer/GridContainer/+Reckless/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Specialist":
		Global.chosen_specialist.erase(remove_trait_options.get_item_text(temp_index))
		Global.specialist.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index) + " Ability Attrition")
		
		$"../ScrollContainer/GridContainer/+Specialist/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Veteran":
		Global.chosen_veteran.erase(remove_trait_options.get_item_text(temp_index))
		Global.veteran.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index) + " Attack rolls")
		
		$"../ScrollContainer/GridContainer/+Veteran/Panel/TextureButton".set_pressed_no_signal(false)
		
	elif Global.temp_trait == "Weapon Expert":
		Global.chosen_weapon_expert.erase(remove_trait_options.get_item_text(temp_index))
		Global.weapon_expert.insert(0, remove_trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills.erase(remove_trait_options.get_item_text(temp_index) + " Weapon Attrition")
		if remove_trait_options.get_item_text(temp_index) == "Fortitude":
			Global.trait_bonus_fort_att -= Global.charst + 1
		if remove_trait_options.get_item_text(temp_index) == "Finesse":
			Global.trait_bonus_fin_att -= Global.charst + 1
		if remove_trait_options.get_item_text(temp_index) == "Focus":
			Global.trait_bonus_foc_att -= Global.charst + 1
		$"../ScrollContainer/GridContainer/+Weapon Expert/Panel/TextureButton".set_pressed_no_signal(false)


	if Global.used_trait_points == Global.trait_points and Global.perk_trait_points > 0:
		Global.perk_trait_points -= 1
	elif Global.used_trait_points <= Global.trait_points:
		Global.used_trait_points -= 1
	Global.custom_traits.erase(Global.temp_trait + ": " + remove_trait_options.get_item_text(temp_index))
	$".".hide()


func _on_trait_options_item_selected(index: int) -> void:
	confirm.disabled = false
	temp_index = index

func _on_cancel_pressed() -> void:
	$".".hide()
	

func _on_remove_trait_options_pressed() -> void:
	remove_trait_options.clear()
	if Global.temp_trait == "Elemental Specialist":
		for element in Global.chosen_elements:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Gambler":
		for element in Global.chosen_gambler:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Martial Artist":
		for element in Global.chosen_martial_artist:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Natural Resistance":
		for element in Global.chosen_natural_resistance:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Prodigy":
		for element in Global.chosen_prodigy:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Professional":
		for element in Global.chosen_professional:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Reckless":
		for element in Global.chosen_reckless:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Specialist":
		for element in Global.chosen_specialist:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Veteran":
		for element in Global.chosen_veteran:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1
	elif Global.temp_trait == "Weapon Expert":
		for element in Global.chosen_weapon_expert:
			remove_trait_options.add_item(element)
		remove_trait_options.selected = -1

func _on_visibility_changed() -> void:
	confirm.disabled = true
	remove_trait_options.selected = -1
