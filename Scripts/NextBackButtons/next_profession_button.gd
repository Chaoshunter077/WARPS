extends Button
@export var name_check = 0
@export var level_check = 0
@export var bio_check = 0

func _on_pressed() -> void:
	check_name()
	check_level()
	check_bioform()
	check_bio()
	if name_check == 1 and level_check == 1 and bio_check == 1:
		Global.max_sd = Global.bio_bonus_sd + Global.equip_bonus_sd
		Global.temp_sd = Global.max_sd - (Global.bio_fort_sd + Global.bio_fin_sd + Global.bio_foc_sd)
		Global.gold = ((Global.charlevel - 1)*1000)+500
		get_tree().change_scene_to_file("res://Scenes/Profession Windows/profession.tscn")

	else:
		$"../WarningWindow".show()
	
	
	
func check_bio():
	if Global.bioform == "Not Selected":
		bio_check = 0
	else:
		bio_check = 1
#confirm name input
func check_name():
	if Global.charname == "Character Name":
		name_check = 0
	else:
		name_check = 1
#confirm level selection
func check_level():
	if Global.charlevel == 0:
		level_check = 0
	else:
		level_check = 1
#confirm bioform selection
func check_bioform():
	Global.starting_traits.clear()
	Global.bio_bonus_skills.clear()
	
	if Global.bioform == "Alpha Genosian":
		Global.bio_bonus_fort_level = 9
		Global.bio_bonus_fin_level = 9
		Global.bio_bonus_foc_level = 9
		Global.bio_bonus_fort_res = 3
		Global.bio_bonus_fin_res = 3
		Global.bio_bonus_foc_res = 3
		Global.bio_bonus_vigor = 30
		Global.bio_bonus_sd = 3
		Global.bio_bonus_skills["Resistance Rolls"] = -2
		Global.starting_traits.push_back("Three times per day, you may reroll any failed attribute roll.")
		Global.starting_traits.push_back("You and your Allies deal +2 Attrition when in Close Range of each other. (*Aura)")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Delta Genosian (Fortitude)":
		Global.bio_bonus_fort_level = 9
		Global.bio_bonus_fin_level = 9
		Global.bio_bonus_foc_level = 9
		Global.bio_bonus_fort_res = 5
		Global.bio_bonus_fin_res = 3
		Global.bio_bonus_foc_res = 3
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.bio_bonus_fort_roll = -1
		Global.starting_traits.push_back("Twice per day, you may reroll any failed Fortitude roll.")
		Global.bio_bonus_fort_att = 2
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Delta Genosian (Finesse)":
		Global.bio_bonus_fort_level= 9
		Global.bio_bonus_fin_level = 9
		Global.bio_bonus_foc_level= 9
		Global.bio_bonus_fort_res = 3
		Global.bio_bonus_fin_res = 5
		Global.bio_bonus_foc_res = 3
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.starting_traits.push_back("Twice per day, you may reroll any failed Finesse roll.")
		Global.bio_bonus_fin_roll = -1
		Global.bio_bonus_fin_att = 2
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Zeta Genosian":
		Global.bio_bonus_fort_level= 9
		Global.bio_bonus_fin_level = 9
		Global.bio_bonus_foc_level= 9
		Global.bio_bonus_fort_res = 3
		Global.bio_bonus_fin_res = 3
		Global.bio_bonus_foc_res = 6
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.bio_bonus_energy = 3
		Global.bio_bonus_foc_roll = -1
		Global.starting_traits.push_back("Biokinetic Aura.")
		Global.starting_traits.push_back("Targets within Close Range are constantly affected by one of the following Auras:")
		Global.starting_traits.push_back("-1 to you and your allies Ability Rolls to hit, +1 to enemy Ability Rolls to hit, +2 Attrition to you and your allies Abilities, -2 Attrition to enemy Abilities.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Kosmari":
		Global.bio_bonus_fort_level= 7
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 10
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 4
		Global.bio_bonus_foc_res = 4
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.starting_traits.push_back("Once per day, you may reroll a failed Focus roll.")
		Global.starting_traits.push_back("Once per day you may reroll a failed Finesse roll.")
		Global.bio_bonus_skills["Biochemistry"] = -2
		Global.bio_bonus_fin_att = 2
		Global.bio_bonus_foc_att = 2
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Dark Kosmari":
		Global.bio_bonus_fort_level= 7
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 10
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 4
		Global.bio_bonus_foc_res = 4
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 4
		Global.starting_traits.push_back("Twice per day, you may reroll any failed roll.")
		Global.starting_traits.push_back("+2 to all d20 rolls.")
		Global.starting_traits.push_back("On a Critical Success or Failure, roll on the Cosmic Scales chart.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Aethmir":
		Global.bio_bonus_fort_level= 7
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 11
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 0
		Global.bio_bonus_foc_res = 6
		Global.bio_bonus_vigor = 15
		Global.bio_bonus_sd = 2
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Focus roll.")
		Global.starting_traits.push_back("You may use Focus when using one-handed Fortitude weapons.")
		Global.bio_bonus_skills["Mechanizing"] = -2
		Global.bio_bonus_skills["Technician"] = -2
		Global.starting_traits.push_back("Resurrect after death, remove all Attrition and Wounds. Add 1 SD to all d20 rolls.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Light Aethmir":
		Global.bio_bonus_fort_level= 7
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 11
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 0
		Global.bio_bonus_foc_res = 6
		Global.bio_bonus_vigor = 15
		Global.bio_bonus_sd = 3
		Global.starting_traits.push_back("Twice per day, you may reroll any failed roll.")
		Global.starting_traits.push_back("+2 to all d20 rolls.")
		Global.starting_traits.push_back("On a Critical Success or Failure, roll on the Cosmic Scales chart.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Petroan":
		Global.bio_bonus_fort_level= 11
		Global.bio_bonus_fin_level = 8
		Global.bio_bonus_foc_level= 8
		Global.bio_bonus_fort_res = 8
		Global.bio_bonus_fin_res = 0
		Global.bio_bonus_foc_res = 0
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Fortitude roll.")
		Global.bio_bonus_fort_att = 3
		Global.starting_traits.push_back("You have the Rage FMA and may use it as many times as you would like.")
		Global.starting_traits.push_back("You can see in darkness as though it is dimly lit.")
		Global.bio_bonus_abilities.append("Rage")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Crytoan":
		Global.bio_bonus_fort_level= 11
		Global.bio_bonus_fin_level = 8
		Global.bio_bonus_foc_level= 8
		Global.bio_bonus_fort_res = 6
		Global.bio_bonus_fin_res = 0
		Global.bio_bonus_foc_res = 6
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.bio_bonus_energy = 3
		Global.starting_traits.push_back("Twice per day, you may reroll any failed roll.")
		Global.starting_traits.push_back("You may use Fortitude for EMA's.")
		Global.starting_traits.push_back("You have the Aether Armor EMA and may use it as many times as you would like.")
		Global.bio_bonus_abilities.append("Aether Armor")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Relkin":
		Global.bio_bonus_fort_level= 8
		Global.bio_bonus_fin_level = 11
		Global.bio_bonus_foc_level= 9
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 8
		Global.bio_bonus_foc_res = 0
		Global.bio_bonus_vigor = 15
		Global.bio_bonus_sd = 2
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Finesse roll.")
		Global.bio_bonus_skills["Resistance Rolls"] = -2
		Global.bio_bonus_skills["Pickpocket"] = -2
		Global.bio_bonus_skills["Lockpicking"] = -2
		Global.starting_traits.push_back("You may use Finesse when attacking with One-handed Fortitude weapons.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Felkin":
		Global.bio_bonus_fort_level= 8
		Global.bio_bonus_fin_level = 11
		Global.bio_bonus_foc_level= 9
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 6
		Global.bio_bonus_foc_res = 6
		Global.bio_bonus_vigor = 15
		Global.bio_bonus_sd = 2
		Global.starting_traits.push_back("Twice per day, you may reroll any failed roll.")
		Global.starting_traits.push_back("You may use Finesse when using EMA’s.")
		Global.starting_traits.push_back("You have the Aether Hand EMA and may use it as many times as you would like.")
		Global.bio_bonus_skills["Resistance Rolls"] = -2
		Global.bio_bonus_abilities.append("Aether Hand")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Epsilon Virekai":
		Global.bio_bonus_fort_level= 9
		Global.bio_bonus_fin_level = 9
		Global.bio_bonus_foc_level= 9
		Global.bio_bonus_fort_res = 3
		Global.bio_bonus_fin_res = 3
		Global.bio_bonus_foc_res = 3
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.starting_traits.push_back("When you kill a creature, you harness their essence to expend on any of the following:")
		Global.starting_traits.push_back("+1 Energy, +/-2 on any roll, Stabilize an Ally, -1 Wound from you or an ally.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Gamma Virekai (Land)":
		Global.bio_bonus_fort_level= 10
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 6
		Global.bio_bonus_fort_res = 6
		Global.bio_bonus_fin_res = 6
		Global.bio_bonus_foc_res = 0
		Global.bio_bonus_vigor = 30
		Global.bio_bonus_sd = 4
		Global.bio_bonus_fort_att = 4
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Fortitude Roll.")
		Global.starting_traits.push_back("You may move up to Far for your Movement Action.")
		Global.starting_traits.push_back("Resistance Rolls against Fire always succeed.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Gamma Virekai (Sea)":
		Global.bio_bonus_fort_level= 10
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 6
		Global.bio_bonus_fort_res = 6
		Global.bio_bonus_fin_res = 6
		Global.bio_bonus_foc_res = 0
		Global.bio_bonus_vigor = 30
		Global.bio_bonus_sd = 4
		Global.bio_bonus_fort_att = 4
		Global.bio_bonus_fort_att = 2
		Global.bio_bonus_fin_att = 2
		Global.starting_traits.push_back("Twice per day, you may reroll any failed Roll.")
		Global.starting_traits.push_back("You may swim as part of your Movement Action.")
		Global.starting_traits.push_back("Resistance Rolls against Ice always succeed.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Gamma Virekai (Air)":
		Global.bio_bonus_fort_level= 10
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 6
		Global.bio_bonus_fort_res = 6
		Global.bio_bonus_fin_res = 6
		Global.bio_bonus_foc_res = 0
		Global.bio_bonus_vigor = 30
		Global.bio_bonus_sd = 4
		Global.bio_bonus_fin_att = 4
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Finesse Roll.")
		Global.starting_traits.push_back("You may jump as part of your Movement Action.")
		Global.starting_traits.push_back("Resistance Rolls against Lightning always succeed.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Mecha Armatura":
		Global.bio_bonus_fort_level= 10
		Global.bio_bonus_fin_level = 8
		Global.bio_bonus_foc_level= 8
		Global.bio_bonus_fort_res = 7
		Global.bio_bonus_fin_res = 7
		Global.bio_bonus_foc_res = 7
		Global.bio_bonus_vigor = 30
		Global.bio_bonus_sd = 3
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Fortitude Roll.")
		Global.starting_traits.push_back("-1 to Resistance Rolls for you and allies within Close Range. (*Aura)s.")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Mecha Imperium":
		Global.bio_bonus_fort_level= 8
		Global.bio_bonus_fin_level = 10
		Global.bio_bonus_foc_level= 8
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 3
		Global.bio_bonus_foc_res = 0
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 4
		Global.starting_traits.push_back("Twice per day, you may reroll a failed Finesse Roll.")
		Global.bio_bonus_fin_att = 2
		Global.starting_traits.push_back("You have the Invisibility EMA, can use Finesse when activating it, and you have no usage cap.")
		Global.bio_bonus_abilities.append("Invisibility")
		print(Global.bio_bonus_traits)
	elif Global.bioform == "Mecha Auxilium":
		Global.bio_bonus_fort_level= 8
		Global.bio_bonus_fin_level = 8
		Global.bio_bonus_foc_level= 10
		Global.bio_bonus_fort_res = 0
		Global.bio_bonus_fin_res = 0
		Global.bio_bonus_foc_res = 6
		Global.bio_bonus_vigor = 23
		Global.bio_bonus_sd = 3
		Global.bio_bonus_energy = 3
		Global.bio_bonus_foc_roll = -1
		Global.starting_traits.push_back("Mechakinetic Aura.")
		Global.starting_traits.push_back("Targets within Close Range are constantly affected by one of the following Auras:")
		Global.starting_traits.push_back("-1 to you and your allies Weapon Rolls to hit, +1 to enemy Weapon Rolls to hit, +2 Attrition to you and your allies Weapon Attacks, -2 Attrition to enemy Weapon Attacks.")
		print(Global.bio_bonus_traits)
	else:
		pass
