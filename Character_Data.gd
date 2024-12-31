extends Node

# Function to save the character data (all variables from Global) to a JSON file
func save_character_data():
	# Define the save file path (for mobile, we use user:// for platform-specific paths)
	var file_path = "user://saves/" + Global.charname + "_" + str(Global.charlevel) + "_data.json"
	
	# Ensure the directory exists
	var dir = DirAccess.open("user://")  # Open the user:// directory
	if dir == null:
		print("Failed to open the user:// directory.")
		return
	
	if not dir.dir_exists("saves"):  # Check if the 'saves' directory exists
		print("Directory doesn't exist, creating it.")
		var result = dir.make_dir("saves")  # Create the 'saves' directory
		if result != OK:
			print("Failed to create the saves directory.")
			return
	
	# Create a new FileAccess object for saving
	var file = FileAccess.open(file_path, FileAccess.WRITE)  # Open file for writing
	
	if file == null:
		print("Failed to open the file for saving.")
		return
	
	# Create the dictionary to save
	var character_data = {
		"bioform": Global.bioform,
		"charname": Global.charname,
		"profession": Global.profession,
		"gold": Global.gold,
		"charlevel": Global.charlevel,
		"charsize": Global.charsize,
		"charst": Global.charst,
		"dice_type": Global.dice_type,
		"base_energy": Global.base_energy,
		"temp_trait": Global.temp_trait,
		"trait_points": Global.trait_points,
		"temp_trait_points": Global.temp_trait_points,
		"used_trait_points": Global.used_trait_points,
		"perk_trait_points": Global.perk_trait_points,
		"temp_ability": Global.temp_ability,
		"ability_points": Global.ability_points,
		"temp_ability_points": Global.temp_ability_points,
		"used_ability_points": Global.used_ability_points,
		"perk_ability_points": Global.perk_ability_points,
		"perk_points": Global.perk_points,
		"temp_perk_points": Global.temp_perk_points,
		"used_perk_points": Global.used_perk_points,
		"max_vigor": Global.max_vigor,
		"max_energy": Global.max_energy,
		"energy_bonus": Global.energy_bonus,
		"perm_wounds": Global.perm_wounds,
		"wounds": Global.wounds,
		"total_wounds": Global.total_wounds,
		"fort_level": Global.fort_level,
		"fin_level": Global.fin_level,
		"foc_level": Global.foc_level,
		"max_sd": Global.max_sd,
		"temp_sd": Global.temp_sd,
		"fort_sd": Global.fort_sd,
		"fin_sd": Global.fin_sd,
		"foc_sd": Global.foc_sd,
		"fort_res": Global.fort_res,
		"fin_res": Global.fin_res,
		"foc_res": Global.foc_res,
		"fort_att": Global.fort_att,
		"fin_att": Global.fin_att,
		"foc_att": Global.foc_att,
		"starting_traits": Global.starting_traits,
		"traits": Global.traits,
		"abilities": Global.abilities,
		"equipment": Global.equipment,
		"total_skills": Global.total_skills,
		"total_actions": Global.total_actions,
		
		# Bioform Bonuses
		"bio_bonus_fort_level": Global.bio_bonus_fort_level,
		"bio_bonus_fin_level": Global.bio_bonus_fin_level,
		"bio_bonus_foc_level": Global.bio_bonus_foc_level,
		"bio_bonus_vigor": Global.bio_bonus_vigor,
		"bio_bonus_energy": Global.bio_bonus_energy,
		"bio_bonus_sd": Global.bio_bonus_sd,
		"bio_bonus_fort_roll": Global.bio_bonus_fort_roll,
		"bio_bonus_fin_roll": Global.bio_bonus_fin_roll,
		"bio_bonus_foc_roll": Global.bio_bonus_foc_roll,
		"bio_bonus_fort_att": Global.bio_bonus_fort_att,
		"bio_bonus_fin_att": Global.bio_bonus_fin_att,
		"bio_bonus_foc_att": Global.bio_bonus_foc_att,
		"bio_bonus_fort_res": Global.bio_bonus_fort_res,
		"bio_bonus_fin_res": Global.bio_bonus_fin_res,
		"bio_bonus_foc_res": Global.bio_bonus_foc_res,
		"bio_fort_sd": Global.bio_fort_sd,
		"bio_fin_sd": Global.bio_fin_sd,
		"bio_foc_sd": Global.bio_foc_sd,
		"bio_bonus_abilities": Global.bio_bonus_abilities,
		"bio_bonus_traits": Global.bio_bonus_traits,
		"bio_bonus_skills": Global.bio_bonus_skills,
		"bio_bonus_actions": Global.bio_bonus_actions,
		
		# Profession Bonuses
		"profession_bonus_skills": Global.profession_bonus_skills,
		
		# Trait Bonuses
		"trait_bonus_fort_level": Global.trait_bonus_fort_level,
		"trait_bonus_fin_level": Global.trait_bonus_fin_level,
		"trait_bonus_foc_level": Global.trait_bonus_foc_level,
		"trait_bonus_vigor": Global.trait_bonus_vigor,
		"trait_bonus_energy": Global.trait_bonus_energy,
		"trait_bonus_fort_sd": Global.trait_bonus_fort_sd,
		"trait_bonus_fin_sd": Global.trait_bonus_fin_sd,
		"trait_bonus_foc_sd": Global.trait_bonus_foc_sd,
		"trait_bonus_fort_roll": Global.trait_bonus_fort_roll,
		"trait_bonus_fin_roll": Global.trait_bonus_fin_roll,
		"trait_bonus_foc_roll": Global.trait_bonus_foc_roll,
		"trait_bonus_fort_att": Global.trait_bonus_fort_att,
		"trait_bonus_fin_att": Global.trait_bonus_fin_att,
		"trait_bonus_foc_att": Global.trait_bonus_foc_att,
		"trait_bonus_fort_res": Global.trait_bonus_fort_res,
		"trait_bonus_fin_res": Global.trait_bonus_fin_res,
		"trait_bonus_foc_res": Global.trait_bonus_foc_res,
		"trait_bonus_abilities": Global.trait_bonus_abilities,
		"trait_bonus_traits": Global.trait_bonus_traits,
		"trait_bonus_skills": Global.trait_bonus_skills,
		"custom_traits": Global.custom_traits,
		"trait_bonus_actions": Global.trait_bonus_actions,
		
		# Equipment Bonuses
		"equip_bonus_fort_level": Global.equip_bonus_fort_level,
		"equip_bonus_fin_level": Global.equip_bonus_fin_level,
		"equip_bonus_foc_level": Global.equip_bonus_foc_level,
		"equip_bonus_vigor": Global.equip_bonus_vigor,
		"equip_bonus_energy": Global.equip_bonus_energy,
		"equip_bonus_sd": Global.equip_bonus_sd,
		"equip_bonus_fort_roll": Global.equip_bonus_fort_roll,
		"equip_bonus_fin_roll": Global.equip_bonus_fin_roll,
		"equip_bonus_foc_roll": Global.equip_bonus_foc_roll,
		"equip_bonus_fort_att": Global.equip_bonus_fort_att,
		"equip_bonus_fin_att": Global.equip_bonus_fin_att,
		"equip_bonus_foc_att": Global.equip_bonus_foc_att,
		"equip_bonus_fort_res": Global.equip_bonus_fort_res,
		"equip_bonus_fin_res": Global.equip_bonus_fin_res,
		"equip_bonus_foc_res": Global.equip_bonus_foc_res,
		"equip_bonus_abilities": Global.equip_bonus_abilities,
		"equip_bonus_traits": Global.equip_bonus_traits,
		"equip_bonus_skills": Global.equip_bonus_skills,
		"equip_purchased": Global.equip_purchased,
		"equip_bonus_actions": Global.equip_bonus_actions,
		
		# Custom Traits and Abilities
		"chosen_traits": Global.chosen_traits,
		"temp_traits": Global.temp_traits,
		"elements": Global.elements,
		"chosen_elements": Global.chosen_elements,
		"gambler": Global.gambler,
		"chosen_gambler": Global.chosen_gambler,
		"martial_artist": Global.martial_artist,
		"chosen_martial_artist": Global.chosen_martial_artist,
		"natural_resistance": Global.natural_resistance,
		"chosen_natural_resistance": Global.chosen_natural_resistance,
		"prodigy": Global.prodigy,
		"chosen_prodigy": Global.chosen_prodigy,
		"professional": Global.professional,
		"chosen_professional": Global.chosen_professional,
		"reckless": Global.reckless,
		"chosen_reckless": Global.chosen_reckless,
		"specialist": Global.specialist,
		"chosen_specialist": Global.chosen_specialist,
		"veteran": Global.veteran,
		"chosen_veteran": Global.chosen_veteran,
		"weapon_expert": Global.weapon_expert,
		"chosen_weapon_expert": Global.chosen_weapon_expert,
		"chosen_abilities": Global.chosen_abilities,
		"temp_abilities": Global.temp_abilities
	}
	
	# Convert the dictionary to a JSON string
	var json_string = JSON.stringify(character_data)
	
	# Write the JSON string to the file
	file.store_string(json_string)
	
	# Close the file
	file.close()
	
	# Confirm that the save was successful
	print("Character data saved successfully to: ", file_path)





func load_character_data(character_name: String, character_level: int):
	# Construct the file path based on the character name and level
	var file_path = "user://saves/" + character_name + "_" + str(character_level) + "_data.json"

	# Open the file for reading
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	if file == null:
		print("Failed to open the file for reading.")
		return

	# Read the JSON string from the file
	var json_string = file.get_as_text()
	
	# Create an instance of the JSON parser
	var json = JSON.new()
	
	# Parse the JSON string
	var parse_result = json.parse(json_string)
	
	# Check if the parsing was successful (parse_result should be OK, which is 0)
	if parse_result == OK:
		var character_data = json.get_data()  # Get the parsed dictionary directly
		
		# Populate all the Global variables with the loaded data
		Global.bioform = character_data.get("bioform", "Not Selected")
		Global.charname = character_data.get("charname", "Character Name")
		Global.profession = character_data.get("profession", "Not Selected")
		Global.gold = character_data.get("gold", 0)
		Global.charlevel = character_data.get("charlevel", 1)
		Global.charsize = character_data.get("charsize", -1)
		Global.charst = character_data.get("charst", 0)
		Global.dice_type = character_data.get("dice_type", "")
		Global.base_energy = character_data.get("base_energy", 0)
		Global.temp_trait = character_data.get("temp_trait", "")
		Global.trait_points = character_data.get("trait_points", 4)
		Global.temp_trait_points = character_data.get("temp_trait_points", 0)
		Global.used_trait_points = character_data.get("used_trait_points", 0)
		Global.perk_trait_points = character_data.get("perk_trait_points", 0)
		Global.temp_ability = character_data.get("temp_ability", "")
		Global.ability_points = character_data.get("ability_points", 3)
		Global.temp_ability_points = character_data.get("temp_ability_points", 0)
		Global.used_ability_points = character_data.get("used_ability_points", 0)
		Global.perk_ability_points = character_data.get("perk_ability_points", 0)
		Global.perk_points = character_data.get("perk_points", 2)
		Global.temp_perk_points = character_data.get("temp_perk_points", 0)
		Global.used_perk_points = character_data.get("used_perk_points", 0)
		Global.max_vigor = character_data.get("max_vigor", 0)
		Global.max_energy = character_data.get("max_energy", 0)
		Global.energy_bonus = character_data.get("energy_bonus", 0)
		Global.perm_wounds = character_data.get("perm_wounds", 0)
		Global.wounds = character_data.get("wounds", 0)
		Global.total_wounds = character_data.get("total_wounds", 0)
		Global.fort_level = character_data.get("fort_level", 0)
		Global.fin_level = character_data.get("fin_level", 0)
		Global.foc_level = character_data.get("foc_level", 0)
		Global.max_sd = character_data.get("max_sd", 0)
		Global.temp_sd = character_data.get("temp_sd", 0)
		Global.fort_sd = character_data.get("fort_sd", 0)
		Global.fin_sd = character_data.get("fin_sd", 0)
		Global.foc_sd = character_data.get("foc_sd", 0)
		Global.fort_res = character_data.get("fort_res", 0)
		Global.fin_res = character_data.get("fin_res", 0)
		Global.foc_res = character_data.get("foc_res", 0)
		Global.fort_att = character_data.get("fort_att", 0)
		Global.fin_att = character_data.get("fin_att", 0)
		Global.foc_att = character_data.get("foc_att", 0)
		Global.starting_traits = character_data.get("starting_traits", [])
		Global.traits = character_data.get("traits", [])
		Global.abilities = character_data.get("abilities", [])
		Global.equipment = character_data.get("equipment", [])
		Global.total_skills = character_data.get("total_skills", {})
		Global.total_actions = character_data.get("total_actions", {})
		
		# Bioform Bonuses
		Global.bio_bonus_fort_level = character_data.get("bio_bonus_fort_level", 0)
		Global.bio_bonus_fin_level = character_data.get("bio_bonus_fin_level", 0)
		Global.bio_bonus_foc_level = character_data.get("bio_bonus_foc_level", 0)
		Global.bio_bonus_vigor = character_data.get("bio_bonus_vigor", 0)
		Global.bio_bonus_energy = character_data.get("bio_bonus_energy", 0)
		Global.bio_bonus_sd = character_data.get("bio_bonus_sd", 0)
		Global.bio_bonus_fort_roll = character_data.get("bio_bonus_fort_roll", 0)
		Global.bio_bonus_fin_roll = character_data.get("bio_bonus_fin_roll", 0)
		Global.bio_bonus_foc_roll = character_data.get("bio_bonus_foc_roll", 0)
		Global.bio_bonus_fort_att = character_data.get("bio_bonus_fort_att", 0)
		Global.bio_bonus_fin_att = character_data.get("bio_bonus_fin_att", 0)
		Global.bio_bonus_foc_att = character_data.get("bio_bonus_foc_att", 0)
		Global.bio_bonus_fort_res = character_data.get("bio_bonus_fort_res", 0)
		Global.bio_bonus_fin_res = character_data.get("bio_bonus_fin_res", 0)
		Global.bio_bonus_foc_res = character_data.get("bio_bonus_foc_res", 0)
		Global.bio_fort_sd = character_data.get("bio_fort_sd", 0)
		Global.bio_fin_sd = character_data.get("bio_fin_sd", 0)
		Global.bio_foc_sd = character_data.get("bio_foc_sd", 0)
		Global.bio_bonus_abilities = character_data.get("bio_bonus_abilities", [])
		Global.bio_bonus_traits = character_data.get("bio_bonus_traits", [])
		Global.bio_bonus_skills = character_data.get("bio_bonus_skills", {})
		Global.bio_bonus_actions = character_data.get("bio_bonus_actions", {})
		
		# Profession Bonuses
		Global.profession_bonus_skills = character_data.get("profession_bonus_skills", [])
		
		# Trait Bonuses
		Global.trait_bonus_fort_level = character_data.get("trait_bonus_fort_level", 0)
		Global.trait_bonus_fin_level = character_data.get("trait_bonus_fin_level", 0)
		Global.trait_bonus_foc_level = character_data.get("trait_bonus_foc_level", 0)
		Global.trait_bonus_vigor = character_data.get("trait_bonus_vigor", 0)
		Global.trait_bonus_energy = character_data.get("trait_bonus_energy", 0)
		Global.trait_bonus_fort_sd = character_data.get("trait_bonus_fort_sd", 0)
		Global.trait_bonus_fin_sd = character_data.get("trait_bonus_fin_sd", 0)
		Global.trait_bonus_foc_sd = character_data.get("trait_bonus_foc_sd", 0)
		Global.trait_bonus_fort_roll = character_data.get("trait_bonus_fort_roll", 0)
		Global.trait_bonus_fin_roll = character_data.get("trait_bonus_fin_roll", 0)
		Global.trait_bonus_foc_roll = character_data.get("trait_bonus_foc_roll", 0)
		Global.trait_bonus_fort_att = character_data.get("trait_bonus_fort_att", 0)
		Global.trait_bonus_fin_att = character_data.get("trait_bonus_fin_att", 0)
		Global.trait_bonus_foc_att = character_data.get("trait_bonus_foc_att", 0)
		Global.trait_bonus_fort_res = character_data.get("trait_bonus_fort_res", 0)
		Global.trait_bonus_fin_res = character_data.get("trait_bonus_fin_res", 0)
		Global.trait_bonus_foc_res = character_data.get("trait_bonus_foc_res", 0)
		Global.trait_bonus_abilities = character_data.get("trait_bonus_abilities", [])
		Global.trait_bonus_traits = character_data.get("trait_bonus_traits", [])
		Global.trait_bonus_skills = character_data.get("trait_bonus_skills", {})
		Global.custom_traits = character_data.get("custom_traits", {})
		Global.trait_bonus_actions = character_data.get("trait_bonus_actions", {})
		
		# Equipment Bonuses
		Global.equip_bonus_fort_level = character_data.get("equip_bonus_fort_level", 0)
		Global.equip_bonus_fin_level = character_data.get("equip_bonus_fin_level", 0)
		Global.equip_bonus_foc_level = character_data.get("equip_bonus_foc_level", 0)
		Global.equip_bonus_vigor = character_data.get("equip_bonus_vigor", 0)
		Global.equip_bonus_energy = character_data.get("equip_bonus_energy", 0)
		Global.equip_bonus_sd = character_data.get("equip_bonus_sd", 0)
		Global.equip_bonus_fort_roll = character_data.get("equip_bonus_fort_roll", 0)
		Global.equip_bonus_fin_roll = character_data.get("equip_bonus_fin_roll", 0)
		Global.equip_bonus_foc_roll = character_data.get("equip_bonus_foc_roll", 0)
		Global.equip_bonus_fort_att = character_data.get("equip_bonus_fort_att", 0)
		Global.equip_bonus_fin_att = character_data.get("equip_bonus_fin_att", 0)
		Global.equip_bonus_foc_att = character_data.get("equip_bonus_foc_att", 0)
		Global.equip_bonus_fort_res = character_data.get("equip_bonus_fort_res", 0)
		Global.equip_bonus_fin_res = character_data.get("equip_bonus_fin_res", 0)
		Global.equip_bonus_foc_res = character_data.get("equip_bonus_foc_res", 0)
		Global.equip_bonus_abilities = character_data.get("equip_bonus_abilities", [])
		Global.equip_bonus_traits = character_data.get("equip_bonus_traits", [])
		Global.equip_bonus_skills = character_data.get("equip_bonus_skills", {})
		Global.equip_purchased = character_data.get("equip_purchased", [])
		Global.equip_bonus_actions = character_data.get("equip_bonus_actions", {})
		
		# Custom Traits and Abilities
		Global.chosen_traits = character_data.get("chosen_traits", [])
		Global.temp_traits = character_data.get("temp_traits", [])
		Global.elements = character_data.get("elements", [])
		Global.chosen_elements = character_data.get("chosen_elements", [])
		Global.gambler = character_data.get("gambler", [])
		Global.chosen_gambler = character_data.get("chosen_gambler", [])
		Global.martial_artist = character_data.get("martial_artist", [])
		Global.chosen_martial_artist = character_data.get("chosen_martial_artist", [])
		Global.natural_resistance = character_data.get("natural_resistance", [])
		Global.chosen_natural_resistance = character_data.get("chosen_natural_resistance", [])
		Global.prodigy = character_data.get("prodigy", [])
		Global.chosen_prodigy = character_data.get("chosen_prodigy", [])
		Global.professional = character_data.get("professional", [])
		Global.chosen_professional = character_data.get("chosen_professional", [])
		Global.reckless = character_data.get("reckless", [])
		Global.chosen_reckless = character_data.get("chosen_reckless", [])
		Global.specialist = character_data.get("specialist", [])
		Global.chosen_specialist = character_data.get("chosen_specialist", [])
		Global.veteran = character_data.get("veteran", [])
		Global.chosen_veteran = character_data.get("chosen_veteran", [])
		Global.weapon_expert = character_data.get("weapon_expert", [])
		Global.chosen_weapon_expert = character_data.get("chosen_weapon_expert", [])
		Global.chosen_abilities = character_data.get("chosen_abilities", [])
		Global.temp_abilities = character_data.get("temp_abilities", [])
		
		print("Character data loaded successfully!")
		
		# Close the file after loading
		file.close()
	else:
		print("Failed to load character data.")

func list_save_slots() -> Array:
	var directory = "user://saves/"
	var save_slots = []

	# Create an instance of DirAccess and open the directory
	var dir = DirAccess.open(directory)

	if dir:
		# Begin listing files in the directory (no arguments needed)
		dir.list_dir_begin()

		# Iterate through all files in the directory
		var file = dir.get_next()
		while file != "":
			if file.ends_with("_data.json"):  # Only include files with the proper extension
				save_slots.append(file)
			file = dir.get_next()

		# End the directory listing
		dir.list_dir_end()

	return save_slots



func delete_character(character_name: String, character_level: int) -> void:
	# Construct the file path based on the character name and level
	var file_path = "user://saves/" + character_name + "_" + str(character_level) + "_data.json"
	
	# Create an instance of DirAccess and open the directory using the static method
	var dir = DirAccess.open("user://saves/")  # Use the static method to open the directory
	
	# Check if the directory was opened successfully
	if dir != null:
		# Check if the file exists
		if dir.file_exists(file_path):
			# Try to remove the file
			var result = dir.remove(file_path)
			if result:
				print("Character deleted successfully: " + file_path)
			else:
				print("Failed to delete character: " + file_path)
		else:
			print("File not found: " + file_path)
	else:
		print("Failed to open the directory for deleting the file.")
