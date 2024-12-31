extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Misc/character_sheet.tscn")
	accumulate_skills(Global.bio_bonus_skills)
	accumulate_skills(Global.trait_bonus_skills)
	accumulate_skills(Global.equip_bonus_skills)
	accumulate_actions(Global.bio_bonus_actions)
	accumulate_actions(Global.trait_bonus_actions)
	accumulate_actions(Global.equip_bonus_actions)
	recalculate_weapon_attrition()
	
	
func accumulate_skills(source_dict):
	for skill_name in source_dict.keys():
		var modifier = source_dict[skill_name]
		# If the skill already exists in total_skills, accumulate the modifier
		if skill_name in Global.total_skills:
			Global.total_skills[skill_name] += modifier
		else:
			# If the skill doesn't exist, initialize it with the modifier
			Global.total_skills[skill_name] = modifier

func accumulate_actions(source_dict):
	for action_name in source_dict.keys():
		var modifier = source_dict[action_name]
		Global.total_actions[action_name] = modifier


func recalculate_weapon_attrition():
	
	Global.equip_bonus_actions.clear()
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Main Hand":  # Check if the item is in the Main Hand slot
			var item_name = item_data["name"]  # Access the item name stored in item_data
			var bonus = item_data["bonus"]  # Extract the bonus
			if "Fortitude" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str(Global.fort_att) + " " + bonus
			if "Finesse" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fin_sd) + str(Global.dice_type) + " + " + str(Global.fin_att) + " " + bonus
			if "Focus" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.foc_sd) + str(Global.dice_type) + " + " + str(Global.foc_att) + " " + bonus
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Both Hands":  # Check if the item is in the Main Hand slot
			var item_name = item_data["name"]  # Access the item name stored in item_data
			var bonus = item_data["bonus"]  # Extract the bonus
			if "Fortitude" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str(Global.fort_att) + " " + bonus
			if "Finesse" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fin_sd) + str(Global.dice_type) + " + " + str(Global.fin_att) + " " + bonus
			if "Focus" in bonus:
				Global.equip_bonus_actions[item_name] = "Deal " + str(Global.foc_sd) + str(Global.dice_type) + " + " + str(Global.foc_att) + " " + bonus
	for item_data in Global.equip_purchased:
		if item_data["slot"] == "Off-Hand":  # Check if the item is in the "Off-Hand" slot
			var item_name = item_data["name"]
			var bonus = item_data["bonus"]  # Extract the bonus
			for items in Global.chosen_martial_artist:
				if items in item_name:
					Global.equip_bonus_actions[item_name] = "Deal " + str(Global.fort_sd) + str(Global.dice_type) + " + " + str((Global.fort_att + Global.charst + 1)) + " Fortitude Attrition. \n" + bonus
