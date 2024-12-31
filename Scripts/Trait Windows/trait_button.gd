extends TextureButton
@onready var Trait = $"../Label".text


@onready var multi_choice_prompt_window: Window = $"../../../../../Multi Choice Prompt Window"



func _process(_delta: float) -> void:
	if Global.temp_traits.has("Ability Expert") == true:
		%"Ability Expert".disabled = false
		%"Ability Expert".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("All or Nothing") == true:
		$"../../../All or Nothing/Panel/TextureButton".disabled = false
		$"../../../All or Nothing/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Ambidextrous") == true:
		$"../../../Ambidextrous/Panel/TextureButton".disabled = false
		$"../../../Ambidextrous/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Aquatic") == true:
		$"../../../Aquatic/Panel/TextureButton".disabled = false
		$"../../../Aquatic/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Beast Whisperer") == true:
		$"../../../Beast Whisperer/Panel/TextureButton".disabled = false
		$"../../../Beast Whisperer/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Braveheart") == true:
		$"../../../Braveheart/Panel/TextureButton".disabled = false
		$"../../../Braveheart/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Breathless") == true:
		$"../../../Breathless/Panel/TextureButton".disabled = false
		$"../../../Breathless/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Charger") == true:
		$"../../../Charger/Panel/TextureButton".disabled = false
		$"../../../Charger/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Climber") == true:
		$"../../../Climber/Panel/TextureButton".disabled = false
		$"../../../Climber/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Combo Fiend") == true:
		$"../../../Combo Fiend/Panel/TextureButton".disabled = false
		$"../../../Combo Fiend/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Craftsman") == true:
		$"../../../Craftsman/Panel/TextureButton".disabled = false
		$"../../../Craftsman/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Diviner") == true:
		$"../../../Diviner/Panel/TextureButton".disabled = false
		$"../../../Diviner/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Double Tap") == true:
		$"../../../Double Tap/Panel/TextureButton".disabled = false
		$"../../../Double Tap/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Energy Conduit") == true:
		$"../../../Energy Conduit/Panel/TextureButton".disabled = false
		$"../../../Energy Conduit/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Harbinger") == true:
		$"../../../Harbinger/Panel/TextureButton".disabled = false
		$"../../../Harbinger/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Insomniac") == true:
		$"../../../Insomniac/Panel/TextureButton".disabled = false
		$"../../../Insomniac/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Invigorated") == true:
		$"../../../Invigorated/Panel/TextureButton".disabled = false
		$"../../../Invigorated/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Juggernaut") == true:
		$"../../../Juggernaut/Panel/TextureButton".disabled = false
		$"../../../Juggernaut/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("MacGyver") == true:
		$"../../../MacGyver/Panel/TextureButton".disabled = false
		$"../../../MacGyver/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Medic") == true:
		$"../../../Medic/Panel/TextureButton".disabled = false
		$"../../../Medic/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Monk") == true:
		$"../../../Monk/Panel/TextureButton".disabled = false
		$"../../../Monk/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Pathfinder") == true:
		$"../../../Pathfinder/Panel/TextureButton".disabled = false
		$"../../../Pathfinder/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Poised") == true:
		$"../../../Poised/Panel/TextureButton".disabled = false
		$"../../../Poised/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Resilient") == true:
		$"../../../Resilient/Panel/TextureButton".disabled = false
		$"../../../Resilient/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Resourceful") == true:
		$"../../../Resourceful/Panel/TextureButton".disabled = false
		$"../../../Resourceful/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Rogue") == true:
		$"../../../Rogue/Panel/TextureButton".disabled = false
		$"../../../Rogue/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Sentry") == true:
		$"../../../Sentry/Panel/TextureButton".disabled = false
		$"../../../Sentry/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Stalwart") == true:
		$"../../../Stalwart/Panel/TextureButton".disabled = false
		$"../../../Stalwart/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Stoic") == true:
		$"../../../Stoic/Panel/TextureButton".disabled = false
		$"../../../Stoic/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Supercharged") == true:
		$"../../../Supercharged/Panel/TextureButton".disabled = false
		$"../../../Supercharged/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Telepath") == true:
		$"../../../Telepath/Panel/TextureButton".disabled = false
		$"../../../Telepath/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Tradesman") == true:
		$"../../../Tradesman/Panel/TextureButton".disabled = false
		$"../../../Tradesman/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Unyielding") == true:
		$"../../../Unyielding/Panel/TextureButton".disabled = false
		$"../../../Unyielding/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
	if Global.temp_traits.has("Wild Card") == true:
		$"../../../Wild Card/Panel/TextureButton".disabled = false
		$"../../../Wild Card/Panel/TextureButton".set_pressed_no_signal(true)
	else:
		pass
#break

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_elements.size() > 0:
		$"../../../+Elemental Specialist/Panel/TextureButton".disabled = false
		$"../../../+Elemental Specialist/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_elements.size() > 0:
		$"../../../+Elemental Specialist/Panel/TextureButton".disabled = false
		$"../../../+Elemental Specialist/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_gambler.size() > 0:
		$"../../../+Gambler/Panel/TextureButton".disabled = false
		$"../../../+Gambler/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_gambler.size() > 0:
		$"../../../+Gambler/Panel/TextureButton".disabled = false
		$"../../../+Gambler/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_martial_artist.size() > 0:
		$"../../../+Martial Artist/Panel/TextureButton".disabled = false
		$"../../../+Martial Artist/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_martial_artist.size() > 0:
		$"../../../+Martial Artist/Panel/TextureButton".disabled = false
		$"../../../+Martial Artist/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_natural_resistance.size() > 0:
		$"../../../+Natural Resistance/Panel/TextureButton".disabled = false
		$"../../../+Natural Resistance/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_natural_resistance.size() > 0:
		$"../../../+Natural Resistance/Panel/TextureButton".disabled = false
		$"../../../+Natural Resistance/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_prodigy.size() > 0:
		$"../../../+Prodigy/Panel/TextureButton".disabled = false
		$"../../../+Prodigy/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_prodigy.size() > 0:
		$"../../../+Prodigy/Panel/TextureButton".disabled = false
		$"../../../+Prodigy/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_professional.size() > 0:
		$"../../../+Professional/Panel/TextureButton".disabled = false
		$"../../../+Professional/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_professional.size() > 0:
		$"../../../+Professional/Panel/TextureButton".disabled = false
		$"../../../+Professional/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_reckless.size() > 0:
		$"../../../+Reckless/Panel/TextureButton".disabled = false
		$"../../../+Reckless/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_reckless.size() > 0:
		$"../../../+Reckless/Panel/TextureButton".disabled = false
		$"../../../+Reckless/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_specialist.size() > 0:
		$"../../../+Specialist/Panel/TextureButton".disabled = false
		$"../../../+Specialist/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_specialist.size() > 0:
		$"../../../+Specialist/Panel/TextureButton".disabled = false
		$"../../../+Specialist/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_veteran.size() > 0:
		$"../../../+Veteran/Panel/TextureButton".disabled = false
		$"../../../+Veteran/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_veteran.size() > 0:
		$"../../../+Veteran/Panel/TextureButton".disabled = false
		$"../../../+Veteran/Panel/TextureButton".set_pressed_no_signal(false)

	if Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points and Global.chosen_weapon_expert.size() > 0:
		$"../../../+Weapon Expert/Panel/TextureButton".disabled = false
		$"../../../+Weapon Expert/Panel/TextureButton".set_pressed_no_signal(true)
	elif Global.used_trait_points < Global.trait_points or Global.used_perk_points < Global.perk_points and Global.chosen_weapon_expert.size() > 0:
		$"../../../+Weapon Expert/Panel/TextureButton".disabled = false
		$"../../../+Weapon Expert/Panel/TextureButton".set_pressed_no_signal(false)

		
		
	if Global.temp_trait_points == 0 and Global.temp_perk_points == 0 and $".".button_pressed == false:
		$".".disabled = true
	elif Global.temp_trait_points > 0 or Global.temp_perk_points > 0 and $".".disabled == true:
		$".".disabled = false
	






func _on_toggled(_toggled_on: bool) -> void:
	Global.temp_trait = Trait
	if  Trait == "Elemental Specialist" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Gambler" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Martial Artist" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Natural Resistance" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Prodigy" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Professional" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Reckless" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Specialist" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Veteran" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()
	if  Trait == "Weapon Expert" and Global.used_trait_points == Global.trait_points and Global.used_perk_points == Global.perk_points:
		multi_choice_prompt_window.show()


		
		
	if $".".button_pressed == true:
		#assign trait name as temp trait
		if Global.temp_trait != "Elemental Specialist" and Trait != "Gambler" and Trait != "Martial Artist" and Trait != "Natural Resistance" and Trait != "Prodigy" and Trait != "Professional" and Trait != "Reckless" and Trait != "Specialist" and Trait != "Veteran" and Trait != "Weapon Expert":  
			if Global.temp_trait == "Invigorated":
				Global.trait_bonus_vigor += ((Global.charst + 1)*2)
				Global.trait_bonus_energy -= Global.charst
			elif Global.temp_trait == "Monk":
				Global.bio_bonus_actions.erase("Meditate")
				Global.total_actions["Meditate"] = "Your meditation dice is replaced with " + str((Global.charst + 1)*2) + "d4 and you may meditate as long as you have dice in your pool."
			elif Global.temp_trait == "Supercharged":
				Global.base_energy = (Global.charst + 1)*2
				Global.perm_wounds = Global.charst
			elif Global.temp_trait == "Unyielding":
				Global.trait_bonus_skills["Resistance Rolls"] = -(Global.charst)
		
			if Global.used_trait_points < Global.trait_points:
				Global.used_trait_points += 1
			elif Global.used_trait_points == Global.trait_points and Global.used_perk_points < Global.perk_points:
				Global.perk_trait_points += 1
		else:
			pass
		#check if multichoice trait
		if Global.temp_trait == "Elemental Specialist":
			$".".set_pressed_no_signal(false)
			if Global.chosen_elements.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Gambler":
			$".".set_pressed_no_signal(false)
			if Global.chosen_gambler.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Martial Artist":
			$".".set_pressed_no_signal(false)
			if Global.chosen_martial_artist.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Natural Resistance":
			$".".set_pressed_no_signal(false)
			if Global.chosen_natural_resistance.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Prodigy":
			$".".set_pressed_no_signal(false)
			if Global.chosen_prodigy.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Professional":
			$".".set_pressed_no_signal(false)
			if Global.chosen_professional.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Reckless":
			$".".set_pressed_no_signal(false)
			if Global.chosen_reckless.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Specialist":
			$".".set_pressed_no_signal(false)
			if Global.chosen_specialist.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Veteran":
			$".".set_pressed_no_signal(false)
			if Global.chosen_veteran.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		elif Trait == "Weapon Expert":
			$".".set_pressed_no_signal(false)
			if Global.chosen_weapon_expert.size() > 0:
				multi_choice_prompt_window.show()
			else:
				$"../../../../../Trait Window".show()
		else:
			Global.temp_traits.append(Trait)
			Global.traits.append(Trait + ": " + Global.available_traits[Trait])


	elif $".".button_pressed == false and Global.temp_trait != "Elemental Specialist" and Trait != "Gambler" and Trait != "Martial Artist" and Trait != "Natural Resistance" and Trait != "Prodigy" and Trait != "Professional" and Trait != "Reckless" and Trait != "Specialist" and Trait != "Veteran" and Trait != "Weapon Expert":
		if Global.temp_trait == "Invigorated":
			Global.trait_bonus_vigor -= ((Global.charst + 1)*2)
			Global.trait_bonus_energy += Global.charst
		elif Global.temp_trait == "Monk":
			Global.total_actions.erase("Meditate")
			Global.bio_bonus_actions["Meditate"] = "Remove " + str(Global.charst) + "d6 Attrition from your Vigor."
		elif Global.temp_trait == "Supercharged":
			Global.base_energy = Global.charst + 1
			Global.perm_wounds = 0
		elif Global.temp_trait == "Unyielding":
			Global.trait_bonus_skills.erase("Resistance Rolls")


		Global.temp_traits.erase(Trait)
		Global.traits.erase(Trait + ": " + Global.available_traits[Trait])
		if Global.used_trait_points == Global.trait_points and Global.perk_trait_points > 0:
			Global.perk_trait_points -= 1
		elif Global.used_trait_points <= Global.trait_points:
			Global.used_trait_points -= 1

	



func _on_trait_choice_window_visibility_changed() -> void:
	if $"../../../../../Panel".visible == false:
		$"../../../../../Panel".visible = true
	elif $"../../../../../Panel".visible == true:
		$"../../../../../Panel".visible = false

func _on_multi_choice_prompt_window_visibility_changed() -> void:
	if $"../../../../../Panel".visible == false:
		$"../../../../../Panel".visible = true
	elif $"../../../../../Panel".visible == true:
		$"../../../../../Panel".visible = false

func _on_trait_remove_window_visibility_changed() -> void:
	if $"../../../../../Panel".visible == false:
		$"../../../../../Panel".visible = true
	elif $"../../../../../Panel".visible == true:
		$"../../../../../Panel".visible = false
