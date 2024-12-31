extends Window
@onready var trait_options: OptionButton = $TraitOptions
@onready var temp_index = -1
@onready var trait_st = Global.charst + 1
@onready var confirm: Button = $HBoxContainer/Confirm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	confirm.disabled = true
	trait_options.selected = -1
	
func _on_confirm_pressed() -> void:
	if Global.temp_trait == "Elemental Specialist":
		Global.elements.erase(trait_options.get_item_text(temp_index))
		Global.chosen_elements.append(trait_options.get_item_text(temp_index))
		Global.trait_bonus_skills[trait_options.get_item_text(temp_index) + " Attrition"] = Global.charst + 1
		
	elif Global.temp_trait == "Gambler":
		Global.gambler.erase(trait_options.get_item_text(temp_index))
		Global.chosen_gambler.append(trait_options.get_item_text(temp_index))
		if trait_options.get_item_text(temp_index) == "Fortitude":
			Global.total_actions["Fortitude " + Global.temp_trait] = "You may reroll your Fortitude SD " + str(Global.charst + 1) + " times per day."
		if trait_options.get_item_text(temp_index) == "Finesse":
			Global.total_actions["Finesse " + Global.temp_trait] = "You may reroll your Finesse SD " + str(Global.charst + 1) + " times per day."
		if trait_options.get_item_text(temp_index) == "Focus":
			Global.total_actions["Focus " + Global.temp_trait] = "You may reroll your Focus SD " + str(Global.charst + 1) + " times per day."

	elif Global.temp_trait == "Martial Artist":
			Global.martial_artist.erase(trait_options.get_item_text(temp_index))
			Global.chosen_martial_artist.append(trait_options.get_item_text(temp_index))
			Global.trait_bonus_skills[trait_options.get_item_text(temp_index) + " Attrition"] = Global.charst + 1

	elif Global.temp_trait == "Natural Resistance":
			Global.natural_resistance.erase(trait_options.get_item_text(temp_index))
			Global.chosen_natural_resistance.append(trait_options.get_item_text(temp_index))
			if trait_options.get_item_text(temp_index) == "Fortitude":
				Global.trait_bonus_fort_res += ((Global.charst + 1)*2)
			if trait_options.get_item_text(temp_index) == "Finesse":
				Global.trait_bonus_fin_res += ((Global.charst + 1)*2)
			if trait_options.get_item_text(temp_index) == "Focus":
				Global.trait_bonus_foc_res += ((Global.charst + 1)*2)
				
			
	elif Global.temp_trait == "Prodigy":
			Global.prodigy.erase(trait_options.get_item_text(temp_index))
			Global.chosen_prodigy.append(trait_options.get_item_text(temp_index))
			Global.trait_bonus_skills[trait_options.get_item_text(temp_index) + " Ability rolls"] = -(Global.charst + 1)
			
	elif Global.temp_trait == "Professional":
			Global.professional.erase(trait_options.get_item_text(temp_index))
			Global.chosen_professional.append(trait_options.get_item_text(temp_index))
			Global.trait_bonus_skills[trait_options.get_item_text(temp_index)] = -(Global.charst + 1)

	elif Global.temp_trait == "Reckless":
			Global.reckless.erase(trait_options.get_item_text(temp_index))
			Global.chosen_reckless.append(trait_options.get_item_text(temp_index))
			if trait_options.get_item_text(temp_index) == "Fortitude":
				Global.trait_bonus_fort_sd += 1
				Global.trait_bonus_fort_res -= ((Global.charst + 1)*2)
			if trait_options.get_item_text(temp_index) == "Finesse":
				Global.trait_bonus_fin_sd += 1
				Global.trait_bonus_fin_res -= ((Global.charst + 1)*2)
			if trait_options.get_item_text(temp_index) == "Focus":
				Global.trait_bonus_foc_sd += 1
				Global.trait_bonus_foc_res -= ((Global.charst + 1)*2)
				
				
	elif Global.temp_trait == "Specialist":
			Global.specialist.erase(trait_options.get_item_text(temp_index))
			Global.chosen_specialist.append(trait_options.get_item_text(temp_index))
			Global.trait_bonus_skills[trait_options.get_item_text(temp_index) + " Ability Attrition"] = Global.charst + 1
			
	elif Global.temp_trait == "Veteran":
			Global.veteran.erase(trait_options.get_item_text(temp_index))
			Global.chosen_veteran.append(trait_options.get_item_text(temp_index))
			Global.trait_bonus_skills[trait_options.get_item_text(temp_index) + " Attack rolls"] = -(Global.charst + 1)
			
	elif Global.temp_trait == "Weapon Expert":
			Global.weapon_expert.erase(trait_options.get_item_text(temp_index))
			Global.chosen_weapon_expert.append(trait_options.get_item_text(temp_index))
			Global.trait_bonus_skills[trait_options.get_item_text(temp_index) + " Weapon Attrition"] = Global.charst + 1
			if trait_options.get_item_text(temp_index) == "Fortitude":
				Global.trait_bonus_fort_att += Global.charst + 1
			if trait_options.get_item_text(temp_index) == "Finesse":
				Global.trait_bonus_fin_att += Global.charst + 1
			if trait_options.get_item_text(temp_index) == "Focus":
				Global.trait_bonus_foc_att += Global.charst + 1


	if Global.used_trait_points < Global.trait_points:
		Global.used_trait_points += 1
	elif Global.used_trait_points == Global.trait_points and Global.used_perk_points < Global.perk_points:
		Global.perk_trait_points += 1
		
	Global.custom_traits[Global.temp_trait + ": " + trait_options.get_item_text(temp_index)] = str(Global.temp_trait)
	$".".hide()

	


func _on_trait_options_item_selected(index: int) -> void:
	confirm.disabled = false
	temp_index = index
func _on_cancel_pressed() -> void:
	$".".hide()

func _on_trait_options_pressed() -> void:
	trait_options.clear()
	if Global.temp_trait == "Elemental Specialist":
		for element in Global.elements:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Gambler":
		for element in Global.gambler:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Martial Artist":
		for element in Global.martial_artist:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Natural Resistance":
		for element in Global.natural_resistance:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Prodigy":
		for element in Global.prodigy:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Professional":
		for element in Global.professional:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Reckless":
		for element in Global.reckless:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Specialist":
		for element in Global.specialist:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Veteran":
		for element in Global.veteran:
			trait_options.add_item(element)
		trait_options.selected = -1
	elif Global.temp_trait == "Weapon Expert":
		for element in Global.weapon_expert:
			trait_options.add_item(element)
		trait_options.selected = -1
		pass

func _on_visibility_changed() -> void:
	confirm.disabled = true
	trait_options.selected = -1
