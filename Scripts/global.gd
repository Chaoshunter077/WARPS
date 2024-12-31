extends Node

@export var bioform = "Not Selected"
@export var charname = "Character Name"
@export var profession = "Not Selected"
@export var gold = 0
@export var charlevel = 1
@export var charsize = -1
@export var charst = 0
@export var dice_type = ""
@export var base_energy = 0
@export var temp_trait = ""
@export var trait_points = 4
@export var temp_trait_points = 0
@export var used_trait_points = 0
@export var perk_trait_points = 0
@export var temp_ability = ""
@export var ability_points = 3
@export var temp_ability_points = 0
@export var used_ability_points = 0
@export var perk_ability_points = 0
@export var perk_points = 2
@export var temp_perk_points = 0
@export var used_perk_points = 0
@export var max_vigor = 0
@export var max_energy = 0
@export var energy_bonus = 0
@export var perm_wounds = 0
@export var wounds = 0
@export var total_wounds = 0
@export var fort_level = 0
@export var fin_level = 0
@export var foc_level = 0
@export var max_sd = 0
@export var temp_sd = 0
@export var fort_sd = 0
@export var fin_sd = 0
@export var foc_sd = 0
@export var fort_res = 0
@export var fin_res = 0
@export var foc_res = 0
@export var fort_att = 0
@export var fin_att = 0
@export var foc_att = 0
@export var starting_traits = []
@export var traits = []
@export var abilities = []
@export var equipment = []
@export var total_skills = {}
@export var total_actions = {}

#Bioform Bonuses
@export var bio_bonus_fort_level = 0
@export var bio_bonus_fin_level = 0
@export var bio_bonus_foc_level = 0
@export var bio_bonus_vigor = 0
@export var bio_bonus_energy = 0
@export var bio_bonus_sd = 0
@export var bio_bonus_fort_roll = 0
@export var bio_bonus_fin_roll = 0
@export var bio_bonus_foc_roll = 0
@export var bio_bonus_fort_att = 0
@export var bio_bonus_fin_att = 0
@export var bio_bonus_foc_att = 0
@export var bio_bonus_fort_res = 0
@export var bio_bonus_fin_res = 0
@export var bio_bonus_foc_res = 0
@export var bio_fort_sd = 0
@export var bio_fin_sd = 0
@export var bio_foc_sd = 0
@export var bio_bonus_abilities = []
@export var bio_bonus_traits = []
@export var bio_bonus_skills = {}
@export var bio_bonus_actions = {}


#Profession Bonuses
@export var profession_bonus_skills = []

#Trait Bonuses
@export var trait_bonus_fort_level = 0
@export var trait_bonus_fin_level = 0
@export var trait_bonus_foc_level = 0
@export var trait_bonus_vigor = 0
@export var trait_bonus_energy = 0
@export var trait_bonus_fort_sd = 0
@export var trait_bonus_fin_sd = 0
@export var trait_bonus_foc_sd = 0
@export var trait_bonus_fort_roll = 0
@export var trait_bonus_fin_roll = 0
@export var trait_bonus_foc_roll = 0
@export var trait_bonus_fort_att = 0
@export var trait_bonus_fin_att = 0
@export var trait_bonus_foc_att = 0
@export var trait_bonus_fort_res = 0
@export var trait_bonus_fin_res = 0
@export var trait_bonus_foc_res = 0
@export var trait_bonus_abilities = []
@export var trait_bonus_traits = []
@export var trait_bonus_skills = {}
@export var custom_traits = {}
@export var trait_bonus_actions = {}

#Equipment Bonuses
@export var equip_bonus_fort_level = 0
@export var equip_bonus_fin_level = 0
@export var equip_bonus_foc_level = 0
@export var equip_bonus_vigor = 0
@export var equip_bonus_energy = 0
@export var equip_bonus_sd = 0
@export var equip_bonus_fort_roll = 0
@export var equip_bonus_fin_roll = 0
@export var equip_bonus_foc_roll = 0
@export var equip_bonus_fort_att = 0
@export var equip_bonus_fin_att = 0
@export var equip_bonus_foc_att = 0
@export var equip_bonus_fort_res = 0
@export var equip_bonus_fin_res = 0
@export var equip_bonus_foc_res = 0
@export var equip_bonus_abilities = []
@export var equip_bonus_traits = []
@export var equip_bonus_skills = {}
@export var equip_purchased = []
@export var equip_bonus_actions = {}





func _process(_delta: float) -> void:
	temp_trait_points = trait_points - used_trait_points
	temp_ability_points = ability_points - used_ability_points
	used_perk_points = perk_ability_points + perk_trait_points
	max_vigor = bio_bonus_vigor + trait_bonus_vigor + equip_bonus_vigor - total_wounds
	max_energy = base_energy + bio_bonus_energy + trait_bonus_energy + equip_bonus_energy
	fort_level = bio_bonus_fort_level + trait_bonus_fort_level + equip_bonus_fort_level
	fin_level = bio_bonus_fin_level + trait_bonus_fin_level + equip_bonus_fin_level
	foc_level = bio_bonus_foc_level + trait_bonus_foc_level + equip_bonus_foc_level
	max_sd = bio_bonus_sd  + equip_bonus_sd
	fort_res = bio_bonus_fort_res + trait_bonus_fort_res + equip_bonus_fort_res
	fin_res = bio_bonus_fin_res + trait_bonus_fin_res + equip_bonus_fin_res
	foc_res = bio_bonus_foc_res + trait_bonus_foc_res + equip_bonus_foc_res
	fort_att = bio_bonus_fort_att + trait_bonus_fort_att + equip_bonus_fort_att
	fin_att = bio_bonus_fin_att + trait_bonus_fin_att + equip_bonus_fin_att
	foc_att = bio_bonus_foc_att + trait_bonus_foc_att + equip_bonus_foc_att
	fort_sd = bio_fort_sd + trait_bonus_fort_sd
	fin_sd = bio_fin_sd + trait_bonus_fin_sd
	foc_sd = bio_foc_sd + trait_bonus_foc_sd
	total_wounds = perm_wounds + wounds
	
	
	
	available_traits = {
	"Ability Expert": "Choose " + str(charst + 1) + " Abilities you know. You may use those Abilities as many times as you would like.",
	"All or Nothing": "You now Critically Hit on a natural 1, 2, or 3 but Critically Fail on an 18, 19, or 20.",
	"Ambidextrous": "You may wield Main-hand equipment in your Off-hand and vice versa.",
	"Aquatic": "You may now Swim as part of your Movement Action.",
	"Beast Whisperer": "You can subtly influence the behavior of an animal that is not hostile towards you.",
	"Braveheart": "You are immune to being Frightened.",
	"Breathless": "You no longer need to breathe and are immune to inhaled toxins.",
	"Charger": "Far Movement no longer consumes your Standard Action.",
	"Climber": "You may now Climb as part of your Movement Action.",
	"Combo Fiend": str(charst + 1) + " times per combat on a successful hit you may attempt to use an ability, but the Energy cost is doubled.",
	"Craftsman": "You may craft items from any Profession but you do so with a +" + str(10 - (charst + 1)) + " modifier.",
	"Diviner": "At the start of each day you may roll " + str(charst) + " d20's and record the numbers. You may use each of these numbers once to replace any roll for that day.",
	"Double Tap": "If an enemy fails to Resist your first basic attack, you may take another attack action.",
	"Elemental Specialist": "Deal +" + str(charst + 1) + " Attrition with chosen element.",
	"Energy Conduit": "For each Energy that you spend, you may roll a d20. Roll " + str(charst) + " or under to retain that Energy.",
	"Gambler": "You may reroll the SD from the chosen Attribute " + str(charst + 1) + " times per day.",
	"Harbinger": "You and all allies remove " + str(charst + 1) + " from their first roll made in combat.",
	"Invigorated": "Gain " + str((charst + 1)*2) + " Vigor to your maximum Vigor but remove " + str(charst) + " from your Energy.",
	"Juggernaut": "The first time you reach Max Attrition in Combat you may spend 1 Energy to resist falling unconscious.",
	"MacGyver": str(charst + 1) + " times per day you may create a simple tool or item out of the mundane scrap around you without a roll. This excludes equipment.",
	"Martial Artist": "Your choice is now considered a Fortitude weapon with an +" + str(charst + 1) + " Attrition modifier.",
	"Medic": "You may Stabilize " + str(charst) + " targets per day without a roll.",
	"Monk": "Your meditation dice is replaced with " + str((charst + 1)*2) + " d4 and you may meditate as long as you have dice in your pool.",
	"Natural Resistance": "Gain " + str((charst + 1)*2) + " resistance to the chosen Attribute.",
	"Pathfinder": "You can never lose your way by natural means.",
	"Poised": "Prevent enemies from getting a Free Attack on you when you Critically Fail.",
	"Prodigy": "Remove " + str(charst + 1) + " from Ability rolls made with the chosen Attribute.",
	"Professional": "Remove " + str(charst + 1) + " to rolls based on the chosen skill.",
	"Reckless": "Add a Skill Dice to the chosen Attribute but lose " + str((charst + 1)*2) + " to that Attribute's Resistance.",
	"Resilient": "You are immune to being poisoned.",
	"Resourceful": "You may attempt to establish a resourceful contact within a populated area. Roll a d12+" + str(charst) + ". 8 or higher = a resourceful ally. 5 or lower = a powerful enemy.",
	"Rogue": "You may use Finesse when attacking with One-handed Fortitude weapons.",
	"Sentry": "You see in darkness as though it is dimly lit.",
	"Specialist": "All abilities with the chosen Attribute inflict " + str(charst + 1) + " additional Attrition.",
	"Stalwart": "When an ally within Close Range is attacked, you may subtract " + str(charst) + " from their Resistance Roll.",
	"Stoic": "You are immune to Lose a Grip.",
	"Supercharged": "Your base Energy is now " + str((charst + 1)*2) + " but you have " + str(charst) + " permanent Wounds.",
	"Telepath": "At the start of each day you may establish a telepathic link with " + str(charst) + " targets.",
	"Tradesman": "You may successfully craft up to " + str(charst + 1) + " times per day.",
	"Unyielding": "Remove " + str(charst) + " from your Resistance Rolls.",
	"Veteran": "Remove " + str(charst + 1) + " to attack rolls made with the chosen Attribute.",
	"Weapon Expert": "All weapons with the chosen Attribute inflict " + str(charst + 1) + " additional Attrition.",
	"Wild Card": "Gain 1d4 abilities each " + str(charst) + " increase. You may only use each ability once per day."
}
	
	
	
	if charst == 1:
		dice_type = "d4"
	elif charst == 2:
		dice_type = "d6"
	elif charst == 3:
		dice_type = "d8"
	elif charst == 4:
		dice_type = "d10"
	elif charst == 5:
		dice_type = "d12"
		
		
func reset_character():
	reset_global_defaults()
	reset_bio_defaults()
	reset_profession_defaults()
	reset_trait_defaults()
	reset_equipment_defaults()


func reset_bio_defaults():
	bioform = "Not Selected"
	charsize = -1
	bio_bonus_fort_level = 0
	bio_bonus_fin_level = 0
	bio_bonus_foc_level = 0
	bio_bonus_vigor = 0
	bio_bonus_energy = 0
	bio_bonus_sd = 0
	bio_fort_sd = 0
	bio_fin_sd = 0
	bio_foc_sd = 0
	bio_bonus_fort_roll = 0
	bio_bonus_fin_roll = 0
	bio_bonus_foc_roll = 0
	bio_bonus_fort_att = 0
	bio_bonus_fin_att = 0
	bio_bonus_foc_att = 0
	bio_bonus_fort_res = 0
	bio_bonus_fin_res = 0
	bio_bonus_foc_res = 0
	bio_bonus_abilities.clear()
	bio_bonus_traits.clear()
	bio_bonus_skills.clear()
	bio_bonus_actions = {"Meditate":"Remove " + str(charst) + "d6 Attrition from your Vigor.", "Stabalize": "Roll a 10 or under to Stabalize an ally."}
	
	
func reset_profession_defaults():
	profession = "Not Selected"
	profession_bonus_skills.clear()
	
func reset_trait_defaults():
	trait_bonus_fort_level = 0
	trait_bonus_fin_level = 0
	trait_bonus_foc_level = 0
	trait_bonus_vigor = 0
	trait_bonus_energy = 0
	trait_bonus_fort_sd = 0
	trait_bonus_fin_sd = 0
	trait_bonus_foc_sd = 0
	trait_bonus_fin_roll = 0
	trait_bonus_foc_roll = 0
	trait_bonus_fort_att = 0
	trait_bonus_fin_att = 0
	trait_bonus_foc_att = 0
	trait_bonus_fort_res = 0
	trait_bonus_fin_res = 0
	trait_bonus_foc_res = 0
	trait_bonus_abilities.clear()
	trait_bonus_traits.clear()
	trait_bonus_skills.clear()
	trait_bonus_actions.clear()
	
	
func reset_equipment_defaults():
	equip_bonus_fort_level = 0
	equip_bonus_fin_level = 0
	equip_bonus_foc_level = 0
	equip_bonus_vigor = 0
	equip_bonus_energy = 0
	equip_bonus_sd = 0
	equip_bonus_fort_roll = 0
	equip_bonus_fin_roll = 0
	equip_bonus_foc_roll = 0
	equip_bonus_fort_att = 0
	equip_bonus_fin_att = 0
	equip_bonus_foc_att = 0
	equip_bonus_fort_res = 0
	equip_bonus_fin_res = 0
	equip_bonus_foc_res = 0
	equip_bonus_abilities.clear()
	equip_bonus_traits.clear()
	equip_bonus_skills.clear()
	equip_purchased.clear()
	equip_bonus_actions.clear()


func reset_global_defaults():
	bioform = "Not Selected"
	charname = "Character Name"
	profession = "Not Selected"
	charlevel = 0
	charsize = -1
	perk_points = 0
	temp_perk_points = 0
	used_perk_points = 0
	trait_points = 4
	temp_trait_points = 0
	used_trait_points = 0
	perk_trait_points = 0
	ability_points = 3
	temp_ability_points = 0
	used_ability_points = 0
	perk_ability_points = 0
	max_vigor = 0
	max_energy = 0
	energy_bonus = 0
	perm_wounds = 0
	fort_level = 0
	fin_level = 0
	foc_level = 0
	max_sd = 0
	fort_sd = 0
	fin_sd = 0
	foc_sd = 0
	fort_res = 0
	fin_res = 0
	foc_res = 0
	fort_att = 0
	fin_att = 0
	foc_att = 0
	starting_traits.clear()
	traits.clear()
	abilities.clear()
	equipment.clear()
	total_skills.clear()
	total_actions.clear()
	chosen_traits.clear()
	temp_traits.clear()
	custom_traits.clear()
	elements = ["Fire", 'Ice', 'Lightning']
	chosen_elements.clear()
	gambler = ["Fortitude", "Finesse", "Focus"]
	chosen_gambler.clear()
	martial_artist = ["Shield of Defense", "Blade of Parrying", "Rod of Warding", "Hands and Feet"]
	chosen_martial_artist.clear()
	natural_resistance = ["Fortitude", "Finesse", "Focus"]
	chosen_natural_resistance.clear()
	prodigy = ["Fortitude", "Finesse", "Focus"]
	chosen_prodigy.clear()
	professional = ["Biochemistry", "Metalsmithing", "Technician", "Mechanizing", "Augmenting","Lockpicking", "Tracking", "Performance", "Knowledge", "Haggling", "Grappling", "Stealth", "Pickpocket", "Taming", "Persuasion", "Investigation", "Bribing", "Intimidation", "Scouting", "Stabilizing"]
	chosen_professional.clear()
	reckless = ["Fortitude", "Finesse", "Focus"]
	chosen_reckless.clear()
	specialist = ["Fortitude", "Finesse", "Focus"]
	chosen_specialist.clear()
	veteran = ["Fortitude", "Finesse", "Focus"]
	chosen_veteran.clear()
	weapon_expert = ["Fortitude", "Finesse", "Focus"]
	chosen_weapon_expert.clear()
	chosen_abilities.clear()
	temp_abilities.clear()




@export var available_skills = [
	"Biochemistry", "Metalsmithing", "Technician", "Mechanizing", "Augmenting", 
	"Lockpicking", "Tracking", "Performance", "Knowledge", "Haggling", 
	"Grappling", "Stealth", "Pickpocket", "Taming", "Persuasion", 
	"Investigation", "Bribing", "Intimidation", "Scouting", "Stabilizing"
]

@export var available_traits = {
	"Ability Expert": "Choose " + str(charst + 1) + " Abilities you know. You may use those Abilities as many times as you would like.",
	"All or Nothing": "You now Critically Hit on a natural 1, 2, or 3 but Critically Fail on an 18, 19, or 20.",
	"Ambidextrous": "You may wield Main-hand equipment in your Off-hand and vice versa.",
	"Aquatic": "You may now Swim as part of your Movement Action.",
	"Beast Whisperer": "You can subtly influence the behavior of an animal that is not hostile towards you.",
	"Braveheart": "You are immune to being Frightened.",
	"Breathless": "You no longer need to breathe and are immune to inhaled toxins.",
	"Charger": "Far Movement no longer consumes your Standard Action.",
	"Climber": "You may now Climb as part of your Movement Action.",
	"Combo Fiend": str(charst + 1) + " times per combat on a successful hit you may attempt to use an ability, but the Energy cost is doubled.",
	"Craftsman": "You may craft items from any Profession but you do so with a +" + str(10 - (charst + 1)) + " modifier.",
	"Diviner": "At the start of each day you may roll " + str(charst) + " d20's and record the numbers. You may use each of these numbers once to replace any roll for that day.",
	"Double Tap": "If an enemy fails to Resist your first basic attack, you may take another attack action.",
	"Elemental Specialist": "Deal +" + str(charst + 1) + " Attrition with chosen element.",
	"Energy Conduit": "For each Energy that you spend, you may roll a d20. Roll " + str(charst) + " or under to retain that Energy.",
	"Gambler": "You may reroll the SD from the chosen Attribute " + str(charst + 1) + " times per day.",
	"Harbinger": "You and all allies remove " + str(charst + 1) + " from their first roll made in combat.",
	"Invigorated": "Gain " + str((charst + 1)*2) + " Vigor to your maximum Vigor but remove " + str(charst) + " from your Energy.",
	"Juggernaut": "The first time you reach Max Attrition in Combat you may spend 1 Energy to resist falling unconscious.",
	"MacGyver": str(charst + 1) + " times per day you may create a simple tool or item out of the mundane scrap around you without a roll. This excludes equipment.",
	"Martial Artist": "Your choice is now considered a Fortitude weapon with an +" + str(charst + 1) + " Attrition modifier.",
	"Medic": "You may Stabilize " + str(charst) + " targets per day without a roll.",
	"Monk": "Your meditation dice is replaced with " + str((charst + 1)*2) + " d4 and you may meditate as long as you have dice in your pool.",
	"Natural Resistance": "Gain " + str((charst + 1)*2) + " resistance to the chosen Attribute.",
	"Pathfinder": "You can never lose your way by natural means.",
	"Poised": "Prevent enemies from getting a Free Attack on you when you Critically Fail.",
	"Prodigy": "Remove " + str(charst + 1) + " from Ability rolls made with the chosen Attribute.",
	"Professional": "Remove " + str(charst + 1) + " to rolls based on the chosen skill.",
	"Reckless": "Add a Skill Dice to the chosen Attribute but lose " + str((charst + 1)*2) + " to that Attribute's Resistance.",
	"Resilient": "You are immune to being poisoned.",
	"Resourceful": "You may attempt to establish a resourceful contact within a populated area. Roll a d12+" + str(charst) + ". 8 or higher = a resourceful ally. 5 or lower = a powerful enemy.",
	"Rogue": "You may use Finesse when attacking with One-handed Fortitude weapons.",
	"Sentry": "You see in darkness as though it is dimly lit.",
	"Specialist": "All abilities with the chosen Attribute inflict " + str(charst + 1) + " additional Attrition.",
	"Stalwart": "When an ally within Close Range is attacked, you may subtract " + str(charst) + " from their Resistance Roll.",
	"Stoic": "You are immune to Lose a Grip.",
	"Supercharged": "Your base Energy is now " + str((charst + 1)*2) + " but you have " + str(charst) + " permanent Wounds.",
	"Telepath": "At the start of each day you may establish a telepathic link with " + str(charst) + " targets.",
	"Tradesman": "You may successfully craft up to " + str(charst + 1) + " times per day.",
	"Unyielding": "Remove " + str(charst) + " from your Resistance Rolls.",
	"Veteran": "Remove " + str(charst + 1) + " to attack rolls made with the chosen Attribute.",
	"Weapon Expert": "All weapons with the chosen Attribute inflict " + str(charst + 1) + " additional Attrition.",
	"Wild Card": "Gain 1d4 abilities each " + str(charst) + " increase. You may only use each ability once per day."
}
#Trait choosing process
@export var chosen_traits = []
@export var temp_traits = []
@export var elements = ["Fire", 'Ice', 'Lightning']
@export var chosen_elements = []
@export var gambler = ["Fortitude", "Finesse", "Focus"]
@export var chosen_gambler = []
@export var martial_artist = ["Shield of Defense", "Blade of Parrying", "Rod of Warding", "Hands and Feet"]
@export var chosen_martial_artist = []
@export var natural_resistance = ["Fortitude", "Finesse", "Focus"]
@export var chosen_natural_resistance = []
@export var prodigy = ["Fortitude", "Finesse", "Focus"]
@export var chosen_prodigy = []
@export var professional = ["Biochemistry", "Metalsmithing", "Technician", "Mechanizing", "Augmenting","Lockpicking", "Tracking", "Performance", "Knowledge", "Haggling", "Grappling", "Stealth", "Pickpocket", "Taming", "Persuasion", "Investigation", "Bribing", "Intimidation", "Scouting", "Stabilizing"]
@export var chosen_professional = []
@export var reckless = ["Fortitude", "Finesse", "Focus"]
@export var chosen_reckless = []
@export var specialist = ["Fortitude", "Finesse", "Focus"]
@export var chosen_specialist = []
@export var veteran = ["Fortitude", "Finesse", "Focus"]
@export var chosen_veteran = []
@export var weapon_expert = ["Fortitude", "Finesse", "Focus"]
@export var chosen_weapon_expert = []

@export var chosen_abilities = []
@export var temp_abilities = []

@export var FMA_abilities = {
	"Analyzed Weakness": "Analyze a targets weakness that is within Far Range. The target adds ST+1 to their next ST Resistance Rolls."
	,
	"Barrage": "Attack ST+1 enemies within your weapons range dealing SD to each target successfully hit."
	,
	"Beast Bond": "Make a Medium or smaller beast into a companion for ST+1 days. If the same beast is targeted after the duration, the ability is automatically successful. You may only have 1 companion active at a time. Beast stats are based on Size."
	,
	"Berserker": "When you kill a target you may use this ability. Move up to Close Range and make another attack."
	,
	"Bulwark": "When you make a Resistance Roll you may use this ability. Remove (ST+1)x2 from your Resistance roll."
	,
	"Command": "When you kill a target you may use this ability. Choose ST Close allies to take an immediate Standard Action."
	,
	"Compelled Duel": "When you make a Resistance roll against an enemies melee attack you may use this ability. Make your Resistance Roll with -ST. If you're roll is successful, deal SD Attrition to the enemy."
	,
	"Constructive Criticism": "When an ally within Far Range fails a roll you may use this ability. Allow the ally to make the roll again removing ST+1 from that roll."
	,
	"Cripple": "When an enemy fails a Resistance Roll against a basic attack you perform, you may activate this ability. Maim the target, stopping them from taking the Movement Action for ST+1 rounds."
	,
	"Echo": "When you succesfully hit an enemy with a basic attack you may use this ability. Create an Echo of your attack. Make a second attack roll with a -ST modifier and new SD roll for the echo."
	,
	"Elemental Pulse": "Engulf your weapon in an element of your choice and hit a target within range for SD Attrition causing energy to ripple through anything within Close Range. Anyone hit with the energy takes half the Attrition inflicted and makes their Resistance Roll with an ST+1 modifier."
	,
	"Elemental Weapon": "Engulf your weapon in an element of your choice and hit a target within range for SD Attrition. The target makes their Resistance Roll with an ST+1 modifier. If the target fails their Resistance roll they suffer from Elemental Condition for ST+1 rounds."
	,
	"Encourage": "ST allies within Close Range remove ST+1 from their next Attack Roll."
	,
	"Evade": "When you are targeted by an attack you may use this ability. Add ST+1 to the attackers Attack Roll."
	,
	"Execute": "When you Critically hit a target you may activate this ability. Add ST additional Skill Dice to the attacks Attrition roll."
	,
	"Fearful Presence": "Each enemy within Close Range must succeed on a Resistance Roll or make all rolls with an ST+1 modifier for ST+1 rounds."
	,
	"Flinch": "When you successfully resist an attack you may use this ability. Take the Movement Action without provoking Opportunity Attacks."
	,
	"Incognito": "Blend seamlessly into the environment around you for ST+1 rounds. Targets searching for you must make a Resistance Roll to spot you."
	,
	"Invigorating Strike": "When you succesfully hit an enemy with a basic attack you may use this ability. Remove (ST+1)x2 Attrition from your Vigor."
	,
	"Leap": "Leap through the air landing anywhere within Far Distance. When you land, deal SD Attrition to ST adjacent enemies."
	,
	"Lethal Dilution": "When you Fall in combat due to a Critical Hit you may use this ability. You remain in the fight, removing STx2 from your Attrition."
	,
	"Magnetic Pull": "Pull all metallic objects within Close Range that are not being worn or held towards you creating an improvised barrier. The improvised barrier provides Heavy Cover."
	,
	"Mighty Strike": "When an enemy successfully resists an attack, you may use this ability. Blast through their resistance, reducing it by (ST+1)x2 for ST+1 rounds."
	,
	"Overpower": "When you succesfully hit an enemy with a basic attack you may use this ability. Break your enemies defense forcing them to add STx2 to their Resistance Roll."
	,
	"Owl Stance": "Increase your Focus Resistance by (ST+1)x2 for ST+1 rounds."
	,
	"Phantasmal Throw": "Hurl a phantasmal copy of your weapon at ST+1 targets within Far Range dealing SD Attrition each."
	,
	"Quick Reflex": "When Combat is declared, you may use this ability. Shift your turn order to the beginning of the round for ST+1 rounds."
	,
	"Rage": "When you are hit by an attack you may use this ability. Retaliate by taking the Attack Action."
	,
	"Rally": "When you kill a target you may use this ability. Give a rallying shout emboldening ST Close allies and removing (ST+1)x2  Attrition from their Vigor."
	,
	"Regenerate": "Remove (ST+1)x2 Attrition from your Vigor for ST+1 rounds."
	,
	"Rapid Response": "When an ally falls in combat you may use this ability. Take a Standard Action."
	,
	"Rend": "When an enemy fails a Resistance Roll against a basic attack you perform, you may activate this ability. Wound the target causing them to bleed for ST+1 rounds. Bleeding targets take STd4 Attrition per round that cannot be resisted."
	,
	"Repelling Strike": "When an enemy fails a Resistance Roll against a basic attack you perform, you may activate this ability. Push the enemy up to Far Range in a straight line."
	,
	"Ricochet": "When you make a Resistance Roll against an enemy's Ranged attack you may activate this ability. Make your Resistance Roll with -ST. If you're roll is successful, you deflect the projectile at a target dealing SD Attrition."
	,
	"Stunning Strike": "When an enemy fails a Resistance Roll against a basic attack you perform, you may activate this ability. Pummel the target preventing them from taking a Standard Action for ST+1 rounds."
	,
	"Tank": "When an ally within Close Range is attacked you may activate this ability. You may take the hit in place of your ally. Remove ST+1 from your Resistance Roll against this attack."
	,
	"Taunt": "Force ST+1 targets to focus their attacks on you on their next turn. Remove ST+1 from your Resistance rolls against those targets."
	,
	"Turtle Stance": "Increase your Fortitude and Finesse Resistance by (ST+1)x2 for ST+1 rounds."
	,
	"Undercover": "Move silently for ST+1 rounds."
	,
	"Viper Stance": "Increase your Fortitude and Finesse Attrition by (ST+1)x2 for ST+1 rounds."
	,
	"Void Rush": "Enter the Void, moving up to Far Range and inflicting SD Attrition to up to ST+1 targets that you pass through."
	,
	"Wolf Stance": "Increase your Fortitude and Finesse Attrition and Resistance by STx2 for ST+1 rounds."
	,
}


@export var EMA_abilities = {

	"Absorb Element": "When you or an ally are hit by an Elemental attack, you may use this ability. Absorb your SD worth of an elements Attrition and add (ST+1)x2 to your next attacks Attrition."
	,
	"Aether Armor": "Aether armor surrounds the target increasing all resistance by (ST+1)x2 for ST+1 rounds."
	,
	"Aether Hand": "Materialize and control a floating ethereal hand for (ST+1)x2 rounds. The Hand can perform Free Actions and Movement Actions."
	,
	"Aether Lock": "Create ST Aether locks that can only be unlocked by an Aether Pick. Lockpicking rolls against these locks are made with +ST. Using this ability again replaces any Aether Locks currently created."
	,
	"Aether Missiles": "Shoot energy missiles that hit up to ST+1 targets dealing SD Attrition each."
	,
	"Aether Pick": "Create an Aether Pick which can be used to pick ST locks. Make the Lockpicking roll with -ST. Using this ability again replaces any Aether Picks currently created."
	,
	"Aid": "Remove SD Attrition each from ST targets within Far Range."
	,
	"Animal Attribute": "Develop one animal characteristic (i.e. Gills, Claws, Fins) for (ST+1)x2 Hours."
	,
	"Blind": "Blind ST Medium or smaller targets for ST+1 rounds. They make rolls with a ST+1 modifier while Blind."
	,
	"Blink": "ST+1 targets may blink to another location within far range that is in eyesight as a free action before the next dawn."
	,
	"Confusion Ray": "Cause great confusion upon ST Medium or smaller targets within Far Range. They attack their allies for ST+1 rounds."
	,
	"Contagion Cloud": "Target an area within Far Range. Conjure a cloud of noxious, flammable gas that fills the area within Close Range for ST+1 rounds. Anyone in the cloud must make a Resistance Roll. On a failed roll they take SD Attrition."
	,
	"Control Element": "Take Control of an element that isn’t being controlled for ST+1 rounds. You may change the shape of the element as a Free Action, or attack with it as a Standard Action. Attacks inflict Elemental Condition on a failed Resistance Roll."
	,
	"Counter Ability": "When an enemy successfully uses an ability you may use this ability. Make a Resistance Roll and remove ST-1. If you are successful, their ability is canceled."
	,
	"Death Ward": "When an ally hits maximum Attrition you may use this ability. The target is stabilized and they remove ST+1 Attrition from their maximum vigor."
	,
	"Detect Thoughts": "Read the thoughts of a Medium or smaller target within Far Range for ST+1 rounds."
	,
	"Disguise Person": "Change the appearance of ST Medium or smaller targets for ST+1 hours. A suspicious target must succeed on a Resistance Roll to see through the Disguise."
	,
	"Earth Bind": "Call on the earth to bind and crush a large or smaller target within Far Range grappling them and dealing SD Attrition for ST+1 rounds."
	,
	"Elemental Beam": "Shoot a beam of an element of your choice at a target within Far Range dealing SD Attrition and inflicting its Elemental Condition for ST+1 rounds."
	,
	"Elemental Cloak": "Surround yourself or an ally within Close Range in an element of your choice for ST+1 rounds. The target gains Resistance to that element for the duration, automatically succeeding any Resistance Rolls against that element."
	,
	"Elemental Sigil": "Place a sigil of an element of your choice on a surface for ST+1 days. The next creature that touches it takes SD Attrition."
	,
	"Elemental Sphere": "Lob a giant sphere of an element of your choice within Far Range hitting up to ST+1 targets adjacent to the location and dealing SD Attrition each."
	,
	"Elemental Wall": "Erect a 10ft tall by 40ft long wall of an element of your choice within Far Range. Targets that are in or pass through the wall take SD Attrition. The wall lasts for ST+1 rounds."
	,
	"Expulsion Totem": "Raise a small totem from the earth within Far Range that expels all medium and smaller targets within close range, pushing them Far for ST+1 rounds."
	,
	"Feather Fall": "When you or an Ally begin to fall, you may activate this ability. ST+1 targets descend slowly to safety for the duration of the fall."
	,
	"Fly": "A target gains the ability to fly for ST hours."
	,
	"Gravity Totem": "Raise a Small totem of gravitational force from the earth within Far Range that pulls all medium and smaller targets within Far Range Close for ST+1 rounds."
	,
	"Guide": "You or an ally within Far Range may remove ST-1 from any roll as a Free Action before the next Dawn."
	,
	"Hallow Ground": "Target ST acres of land and convert it into hollowed ground for ST*3 days. The land must be owned by you or no one at all. No Undead or Fiends can enter the area."
	,
	"Haste": "One medium or smaller target within Far Range may move faster than usual granting them an extra Action for ST+1 rounds."
	,
	"Identify": "Identify the properties of ST+1 Close targets. Properties may include Traps, Curses, and item effects."
	,
	"Illusion": "Create a Large or smaller Illusion within Far Range for ST+1 rounds. Anyone who fails their Resistance Roll believes the Illusion."
	,
	"Infrared Vision": "Grants a target the ability to see heat signatures for ST+1 rounds."
	,
	"Invisibility": "A target within Far Range becomes invisible for ST+1 rounds. Any nonpassive action causes the effect to end. Anyone searching for the target must make a Resistance Roll with an ST+1 modifier to attempt to notice you."
	,
	"Light": "Conjure a floating ball of light that is under your control for ST+1 hours. As a Free Action you may move the ball of light within Far Range."
	,
	"Mimicry": "Throw the source of your voice up to Far Range. You may change your voice to mimic a voice or sound you’ve heard before. A suspicious target must succeed on a Resistance Roll to see through the trick."
	,
	"Mind Message": "Create ST messages that can be instantly sent to a recipients mind that is currently on the same plane of existence."
	,
	"Mirror Image": "Create ST+1 exact replicas of a medium or smaller target for ST+1 rounds. It mirrors the targets actions until hit. For every replica, the attackers chance of targeting the original is modified. (i.e. 2 = 33%, 3 = 25%. etc.)"
	,
	"Mist Form": "Turn a medium or smaller target within Far Range into mist for ST+1 rounds if they fail their Resistance Roll. They retain their consciousness and can control the mist cloud given there is no wind. Their movement is doubled."
	,
	"Otherworldly Steed": "Materialize a large steed from another world to ride on or pull a cart for ST+1 days. The steed is passive and will return to its home if attacked."
	,
	"Polymorph": "Transform one medium or smaller sized target within Far Range into a docile animal for ST+1 hours if they fail their Resistance Roll. It remains in this form for the duration unless injured."
	,
	"Power Nap": "A close target gains the benefits of a Full Rest in a - (ST+1) hours."
	,
	"Reduce": "Choose a target within Far Range. Decrease the targets size by one size for ST+1 rounds if they fail their Resistance Roll. Vigor Maximum and SD adjust with size."
	,
	"Resistance": "ST targets within Far Range remove ST-1 from their next ST+1 Resistance Rolls."
	,
	"Scry": "If you currently possess an item that belongs to someone else, you may view the owner from anywhere for ST+1 rounds."
	,
	"Selective Hearing": "Control what ST+1 targets within Far Range hear or don’t hear for ST+1 rounds if they fail their Resistance Roll."
	,
	"Slow": "One Medium or smaller target within Far Range moves in slow-motion if they fail their Resistance Roll. The target may only perform one Action for ST+1 rounds."
	,
	"Spider Climb": "Grant a target within Far Range the ability to climb on walls and ceilings for ST hours."
	,
	"Resurrect": "Call upon the forces of nature to breathe life into a dead target. Remove ST+1 from a d20 roll. If it is equal to or below your level, the target is resurrected. If the target has been dead for longer than ST+1 weeks, the ability has no effect."
	,
	"Suggestion": "Plant an idea into a medium or smaller targets mind within Far Range. Remove ST+1 from a d20 roll. If its equal to or below your level, the target will pursue the idea."
	,
	"Stone Skin": "Choose a target within Far Range. The targets skin turns to stone blocking all Attrition on a successful Resistance Roll for ST+1 rounds."
	,
	"Telekinesis": "Move ST medium or smaller targets with your mind. The target and anything hit by it takes SD Attrition."
	,
	"Teleport": "Teleport ST medium or smaller targets within Far Range anywhere on the same plane of existence that you have been before if they fail their Resistance Roll."
	,
	"Thrall": "Raise a medium or smaller target within Far Range to do your bidding for ST+1 days. The Thrall lasts until killed or dispelled. You may only have 1 companion active at a time. Stats are based on Size and follow your SD size. The Thrall is Undead."
	,
	"Translate": "One target understands all spoken and written language for ST+1 rounds."
	,
	"Vampiric Drain": "Drain a target within Far Range inflicting SD Attrition and removing (ST+1)x2 Attrition from you or an ally within Close Range."
	,
}


@export var fort_equip = {
	"Poor Heavy Gloves": {
		"slot": "Arms",
		"bonus": "+1 Fortitude Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"fortitude_resistance": 1,
		},
	"Poor Heavy Boots": {
		"slot": "Legs",
		"bonus": "+1 Fortitude Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Heavy Helmet": {
		"slot": "Head",
		"bonus": "+1 Fortitude Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor One-handed Melee Weapon": {
		"slot": "Main Hand",
		"bonus": "+1 Fortitude Attrition",
		"cost": 50,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 1
	},
	"Poor Heavy Armor": {
		"slot": "Chest",
		"bonus": "+2 Fortitude Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Two-handed Melee Weapon": {
		"slot": "Both Hands",
		"bonus": "+3 Fortitude Attrition",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3
	},
	"Poor Shield of Defense": {
		"slot": "Off-Hand",
		"bonus": "+1 Fortitude and Focus Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 1,
		"focus_resistance": 1,
		"fortitude_attrition": 0
	},
	"Poor Heavy Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+1 Fortitude Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Heavy Boots ⦾": {
		"slot": "Legs",
		"bonus": "+1 Fortitude Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Heavy Helmet ⦾": {
		"slot": "Head",
		"bonus": "+1 Fortitude Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor One-handed Melee Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+1 Fortitude Attrition",
		"cost": 100,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 1
	},
	"Fine Heavy Gloves": {
		"slot": "Arms",
		"bonus": "+2 Fortitude Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Heavy Boots": {
		"slot": "Legs",
		"bonus": "+2 Fortitude Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Heavy Helmet": {
		"slot": "Head",
		"bonus": "+2 Fortitude Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine One-handed Melee Weapon": {
		"slot": "Main Hand",
		"bonus": "+2 Fortitude Attrition",
		"cost": 150,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 2
	},
	"Poor Heavy Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+1 Fortitude Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Heavy Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+1 Fortitude Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Heavy Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+1 Fortitude Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"fortitude_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor One-handed Melee Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+1 Fortitude Attrition",
		"cost": 150,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 1
	},
	"Poor Heavy Armor ⦾": {
		"slot": "Chest",
		"bonus": "+2 Fortitude Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Two-handed Melee Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+3 Fortitude Attrition",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3
	},
	"Poor Shield of Defense ⦾": {
		"slot": "Off-Hand",
		"bonus": "+1 Fortitude and Focus Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 1,
		"focus_resistance": 1,
		"fortitude_attrition": 0
	},
	"Fine Heavy Armor": {
		"slot": "Chest",
		"bonus": "+3 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Two-handed Melee Weapon": {
		"slot": "Both Hands",
		"bonus": "+4 Fortitude Attrition",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4
	},
	"Fine Shield of Defense": {
		"slot": "Off-Hand",
		"bonus": "+2 Fortitude and Focus Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"focus_resistance": 2,
		"fortitude_attrition": 0
	},
	"Fine Heavy Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+2 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Heavy Boots ⦾": {
		"slot": "Legs",
		"bonus": "+2 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Heavy Helmet ⦾": {
		"slot": "Head",
		"bonus": "+2 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine One-handed Melee Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+2 Fortitude Attrition",
		"cost": 300,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 2
	},
	"Poor Heavy Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+2 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 2,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Poor Two-handed Melee Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+3 Fortitude Attrition",
		"cost": 300,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3
	},
	"Superior Heavy Gloves": {
		"slot": "Arms",
		"bonus": "+3 Fortitude Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Heavy Boots": {
		"slot": "Legs",
		"bonus": "+3 Fortitude Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Heavy Helmet": {
		"slot": "Head",
		"bonus": "+3 Fortitude Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior One-handed Melee Weapon": {
		"slot": "Main Hand",
		"bonus": "+3 Fortitude Attrition",
		"cost": 400,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3
	},
	"Fine Heavy Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+2 Fortitude Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Heavy Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+2 Fortitude Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Heavy Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+2 Fortitude Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"fortitude_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine One-handed Melee Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+2 Fortitude Attrition",
		"cost": 450,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 2
	},
	"Fine Heavy Armor ⦾": {
		"slot": "Chest",
		"bonus": "+3 Fortitude Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Two-handed Melee Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+4 Fortitude Attrition",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4
	},
	"Fine Shield of Defense ⦾": {
		"slot": "Off-Hand",
		"bonus": "+2 Fortitude and Focus Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 2,
		"focus_resistance": 2,
		"fortitude_attrition": 0
	},
	"Superior Heavy Armor": {
		"slot": "Chest",
		"bonus": "+4 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Two-handed Melee Weapon": {
		"slot": "Both Hands",
		"bonus": "+5 Fortitude Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5
	},
	"Superior Shield of Defense": {
		"slot": "Off-Hand",
		"bonus": "+3 Fortitude and Focus Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 3,
		"focus_resistance": 3,
		"fortitude_attrition": 0
	},
	"Superior Heavy Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+3 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Heavy Boots ⦾": {
		"slot": "Legs",
		"bonus": "+3 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Heavy Helmet ⦾": {
		"slot": "Head",
		"bonus": "+3 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior One-handed Melee Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+3 Fortitude Attrition",
		"cost": 800,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3
	},
	"Fine Heavy Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+3 Fortitude Resistance",
		"cost": 900,
		"upgrade_slots": 2,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Fine Two-handed Melee Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+4 Fortitude Attrition",
		"cost": 900,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4
	},
	"Superior Heavy Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+3 Fortitude Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Heavy Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+3 Fortitude Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Heavy Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+3 Fortitude Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"fortitude_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior One-handed Melee Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+3 Fortitude Attrition",
		"cost": 1200,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3
	},
	"Superior Heavy Armor ⦾": {
		"slot": "Chest",
		"bonus": "+4 Fortitude Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Two-handed Melee Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+5 Fortitude Attrition",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5
	},
	"Superior Shield of Defense ⦾": {
		"slot": "Off-Hand",
		"bonus": "+3 Fortitude and Focus Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 3,
		"focus_resistance": 3,
		"fortitude_attrition": 0
	},
	"Superior Heavy Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+4 Fortitude Resistance",
		"cost": 2400,
		"upgrade_slots": 2,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Superior Two-handed Melee Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+5 Fortitude Attrition",
		"cost": 2400,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5
	},
	"Exquisite Heavy Gloves": {
		"slot": "Arms",
		"bonus": "+4 Fortitude Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Boots": {
		"slot": "Legs",
		"bonus": "+4 Fortitude Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Helmet": {
		"slot": "Head",
		"bonus": "+4 Fortitude Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite One-handed Melee Weapon": {
		"slot": "Main Hand",
		"bonus": "+4 Fortitude Attrition",
		"cost": 2500,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4
	},
	"Exquisite Heavy Armor": {
		"slot": "Chest",
		"bonus": "+5 Fortitude Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Two-handed Melee Weapon": {
		"slot": "Both Hands",
		"bonus": "+6 Fortitude Attrition",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 6
	},
	"Exquisite Shield of Defense": {
		"slot": "Off-Hand",
		"bonus": "+4 Fortitude and Focus Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 4,
		"focus_resistance": 4,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+4 Fortitude Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Boots ⦾": {
		"slot": "Legs",
		"bonus": "+4 Fortitude Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Helmet ⦾": {
		"slot": "Head",
		"bonus": "+4 Fortitude Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite One-handed Melee Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+4 Fortitude Attrition",
		"cost": 5000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4
	},
	"Flawless Heavy Gloves": {
		"slot": "Arms",
		"bonus": "+5 Fortitude Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Boots": {
		"slot": "Legs",
		"bonus": "+5 Fortitude Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Helmet": {
		"slot": "Head",
		"bonus": "+5 Fortitude Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless One-handed Melee Weapon": {
		"slot": "Main Hand",
		"bonus": "+5 Fortitude Attrition",
		"cost": 6000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5
	},
	"Exquisite Heavy Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+4 Fortitude Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+4 Fortitude Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Heavy Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+4 Fortitude Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"fortitude_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite One-handed Melee Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+4 Fortitude Attrition",
		"cost": 7500,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4
	},
	"Exquisite Heavy Armor ⦾": {
		"slot": "Chest",
		"bonus": "+5 Fortitude Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Two-handed Melee Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+6 Fortitude Attrition",
		"cost": 10000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 6
	},
	"Exquisite Shield of Defense ⦾": {
		"slot": "Off-Hand",
		"bonus": "+4 Fortitude and Focus Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"fortitude_resistance": 4,
		"focus_resistance": 4,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Armor": {
		"slot": "Chest",
		"bonus": "+6 Fortitude Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 6,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Two-handed Melee Weapon": {
		"slot": "Both Hands",
		"bonus": "+7 Fortitude Attrition",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 7
	},
	"Flawless Shield of Defense": {
		"slot": "Off-Hand",
		"bonus": "+5 Fortitude and Focus Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 5,
		"focus_resistance": 5,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+5 Fortitude Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Boots ⦾": {
		"slot": "Legs",
		"bonus": "+5 Fortitude Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Helmet ⦾": {
		"slot": "Head",
		"bonus": "+5 Fortitude Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless One-handed Melee Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+5 Fortitude Attrition",
		"cost": 12000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5
	},
	"Exquisite Heavy Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+5 Fortitude Resistance",
		"cost": 15000,
		"upgrade_slots": 2,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Exquisite Two-handed Melee Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Fortitude Attrition",
		"cost": 15000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 7
	},
	"Flawless Heavy Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+5 Fortitude Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+5 Fortitude Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+5 Fortitude Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"fortitude_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless One-handed Melee Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+5 Fortitude Attrition",
		"cost": 18000,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5
	},
	"Flawless Heavy Armor ⦾": {
		"slot": "Chest",
		"bonus": "+6 Fortitude Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 6,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Two-handed Melee Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Fortitude Attrition",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 7
	},
	"Flawless Shield of Defense ⦾": {
		"slot": "Off-Hand",
		"bonus": "+5 Fortitude and Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 5,
		"focus_resistance": 5,
		"fortitude_attrition": 0
	},
	"Flawless Heavy Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+6 Fortitude Resistance",
		"cost": 36000,
		"upgrade_slots": 2,
		"fortitude_resistance": 6,
		"focus_resistance": 0,
		"fortitude_attrition": 0
	},
	"Flawless Two-handed Melee Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Fortitude Attrition",
		"cost": 36000,
		"upgrade_slots": 2,
		"fortitude_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 7
	}
}

@export var fin_equip = {
	"Poor Medium Gloves": {
		"slot": "Arms",
		"bonus": "+1 Finesse Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Medium Boots": {
		"slot": "Legs",
		"bonus": "+1 Finesse Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Medium Helmet": {
		"slot": "Head",
		"bonus": "+1 Finesse Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor One-handed Ranged Weapon": {
		"slot": "Main Hand",
		"bonus": "+1 Finesse Attrition",
		"cost": 50,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 1
	},
	"Poor Medium Armor": {
		"slot": "Chest",
		"bonus": "+2 Finesse Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Two-handed Ranged Weapon": {
		"slot": "Both Hands",
		"bonus": "+3 Finesse Attrition",
		"cost": 100,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 3
	},
	"Poor Blade of Parrying": {
		"slot": "Off-Hand",
		"bonus": "+1 Finesse Resistance, +1 Fortitude Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"finesse_resistance": 1,
		"fortitude_resistance": 1,
		"finesse_attrition": 0
	},
	"Poor Medium Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+1 Finesse Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Medium Boots ⦾": {
		"slot": "Legs",
		"bonus": "+1 Finesse Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Medium Helmet ⦾": {
		"slot": "Head",
		"bonus": "+1 Finesse Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor One-handed Ranged Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+1 Finesse Attrition",
		"cost": 100,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 1
	},
	"Fine Medium Gloves": {
		"slot": "Arms",
		"bonus": "+2 Finesse Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Medium Boots": {
		"slot": "Legs",
		"bonus": "+2 Finesse Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Medium Helmet": {
		"slot": "Head",
		"bonus": "+2 Finesse Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine One-handed Ranged Weapon": {
		"slot": "Main Hand",
		"bonus": "+2 Finesse Attrition",
		"cost": 150,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 2
	},
	"Poor Medium Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+1 Finesse Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Medium Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+1 Finesse Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Medium Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+1 Finesse Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"finesse_resistance": 1,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor One-handed Ranged Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+1 Finesse Attrition",
		"cost": 150,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 1
	},
	"Poor Medium Armor ⦾": {
		"slot": "Chest",
		"bonus": "+2 Finesse Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Two-handed Ranged Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+3 Finesse Attrition",
		"cost": 200,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 3
	},
	"Poor Blade of Parrying ⦾": {
		"slot": "Off-Hand",
		"bonus": "+1 Finesse Resistance, +1 Fortitude Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"finesse_resistance": 1,
		"fortitude_resistance": 1,
		"finesse_attrition": 0
	},
	"Fine Medium Armor": {
		"slot": "Chest",
		"bonus": "+3 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Two-handed Ranged Weapon": {
		"slot": "Both Hands",
		"bonus": "+4 Finesse Attrition",
		"cost": 300,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 4
	},
	"Fine Blade of Parrying": {
		"slot": "Off-Hand",
		"bonus": "+2 Finesse Resistance, +2 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"finesse_resistance": 2,
		"fortitude_resistance": 2,
		"finesse_attrition": 0
	},
	"Fine Medium Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+2 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Medium Boots ⦾": {
		"slot": "Legs",
		"bonus": "+2 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Medium Helmet ⦾": {
		"slot": "Head",
		"bonus": "+2 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine One-handed Ranged Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+2 Finesse Attrition",
		"cost": 300,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 2
	},
	"Poor Medium Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+2 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 2,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Poor Two-handed Ranged Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+3 Finesse Attrition",
		"cost": 300,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 3
	},
	"Superior Medium Gloves": {
		"slot": "Arms",
		"bonus": "+3 Finesse Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Medium Boots": {
		"slot": "Legs",
		"bonus": "+3 Finesse Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Medium Helmet": {
		"slot": "Head",
		"bonus": "+3 Finesse Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior One-handed Ranged Weapon": {
		"slot": "Main Hand",
		"bonus": "+3 Finesse Attrition",
		"cost": 400,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 3
	},
	"Fine Medium Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+2 Finesse Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Medium Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+2 Finesse Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Medium Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+2 Finesse Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"finesse_resistance": 2,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine One-handed Ranged Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+2 Finesse Attrition",
		"cost": 450,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 2
	},
	"Fine Medium Armor ⦾": {
		"slot": "Chest",
		"bonus": "+3 Finesse Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Two-handed Ranged Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+4 Finesse Attrition",
		"cost": 600,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 4
	},
	"Fine Blade of Parrying ⦾": {
		"slot": "Off-Hand",
		"bonus": "+2 Finesse Resistance, +2 Fortitude Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"finesse_resistance": 2,
		"fortitude_resistance": 2,
		"finesse_attrition": 0
	},
	"Superior Medium Armor": {
		"slot": "Chest",
		"bonus": "+4 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Two-handed Ranged Weapon": {
		"slot": "Both Hands",
		"bonus": "+5 Finesse Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 5
	},
	"Superior Blade of Parrying": {
		"slot": "Off-Hand",
		"bonus": "+3 Finesse Resistance, +3 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"finesse_resistance": 3,
		"fortitude_resistance": 3,
		"finesse_attrition": 0
	},
	"Superior Medium Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+3 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Medium Boots ⦾": {
		"slot": "Legs",
		"bonus": "+3 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Medium Helmet ⦾": {
		"slot": "Head",
		"bonus": "+3 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior One-handed Ranged Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+3 Finesse Attrition",
		"cost": 800,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 3
	},
	"Fine Medium Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+3 Finesse Resistance",
		"cost": 900,
		"upgrade_slots": 2,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Fine Two-handed Ranged Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+4 Finesse Attrition",
		"cost": 900,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 4
	},
	"Superior Medium Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+3 Finesse Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Medium Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+3 Finesse Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Medium Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+3 Finesse Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"finesse_resistance": 3,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior One-handed Ranged Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+3 Finesse Attrition",
		"cost": 1200,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 3
	},
	"Superior Medium Armor ⦾": {
		"slot": "Chest",
		"bonus": "+4 Finesse Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Two-handed Ranged Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+5 Finesse Attrition",
		"cost": 1600,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 5
	},
	"Superior Blade of Parrying ⦾": {
		"slot": "Off-Hand",
		"bonus": "+3 Finesse Resistance, +3 Fortitude Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"finesse_resistance": 3,
		"fortitude_resistance": 3,
		"finesse_attrition": 0
	},
	"Superior Medium Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+4 Finesse Resistance",
		"cost": 2400,
		"upgrade_slots": 2,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Superior Two-handed Ranged Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+5 Finesse Attrition",
		"cost": 2400,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 5
	},
	"Exquisite Medium Gloves": {
		"slot": "Arms",
		"bonus": "+4 Finesse Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Medium Boots": {
		"slot": "Legs",
		"bonus": "+4 Finesse Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Medium Helmet": {
		"slot": "Head",
		"bonus": "+4 Finesse Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite One-handed Ranged Weapon": {
		"slot": "Main Hand",
		"bonus": "+4 Finesse Attrition",
		"cost": 2500,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 4
	},
	"Exquisite Medium Armor": {
		"slot": "Chest",
		"bonus": "+5 Finesse Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Two-handed Ranged Weapon": {
		"slot": "Both Hands",
		"bonus": "+6 Finesse Attrition",
		"cost": 5000,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 6
	},
	"Exquisite Blade of Parrying": {
		"slot": "Off-Hand",
		"bonus": "+4 Finesse Resistance, +4 Fortitude Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"finesse_resistance": 4,
		"fortitude_resistance": 4,
		"finesse_attrition": 0
	},
	"Exquisite Medium Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+4 Finesse Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Medium Boots ⦾": {
		"slot": "Legs",
		"bonus": "+4 Finesse Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Medium Helmet ⦾": {
		"slot": "Head",
		"bonus": "+4 Finesse Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite One-handed Ranged Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+4 Finesse Attrition",
		"cost": 5000,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 4
	},
	"Flawless Medium Gloves": {
		"slot": "Arms",
		"bonus": "+5 Finesse Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Medium Boots": {
		"slot": "Legs",
		"bonus": "+5 Finesse Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Medium Helmet": {
		"slot": "Head",
		"bonus": "+5 Finesse Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless One-handed Ranged Weapon": {
		"slot": "Main Hand",
		"bonus": "+5 Finesse Attrition",
		"cost": 6000,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 5
	},
	"Exquisite Medium Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+4 Finesse Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Medium Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+4 Finesse Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Medium Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+4 Finesse Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"finesse_resistance": 4,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite One-handed Ranged Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+4 Finesse Attrition",
		"cost": 7500,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 4
	},
	"Exquisite Medium Armor ⦾": {
		"slot": "Chest",
		"bonus": "+5 Finesse Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Two-handed Ranged Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+6 Finesse Attrition",
		"cost": 10000,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 6
	},
	"Exquisite Blade of Parrying ⦾": {
		"slot": "Off-Hand",
		"bonus": "+4 Finesse Resistance, +4 Fortitude Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"finesse_resistance": 4,
		"fortitude_resistance": 4,
		"finesse_attrition": 0
	},
	"Flawless Medium Armor": {
		"slot": "Chest",
		"bonus": "+6 Finesse Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"finesse_resistance": 6,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Two-handed Ranged Weapon": {
		"slot": "Both Hands",
		"bonus": "+7 Finesse Attrition",
		"cost": 12000,
		"upgrade_slots": 0,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 7
	},
	"Flawless Blade of Parrying": {
		"slot": "Off-Hand",
		"bonus": "+5 Finesse Resistance, +5 Fortitude Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"finesse_resistance": 5,
		"fortitude_resistance": 5,
		"finesse_attrition": 0
	},
	"Flawless Medium Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+5 Finesse Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Medium Boots ⦾": {
		"slot": "Legs",
		"bonus": "+5 Finesse Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Medium Helmet ⦾": {
		"slot": "Head",
		"bonus": "+5 Finesse Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless One-handed Ranged Weapon ⦾": {
		"slot": "Main Hand",
		"bonus": "+5 Finesse Attrition",
		"cost": 12000,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 5
	},
	"Exquisite Medium Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+5 Finesse Resistance",
		"cost": 15000,
		"upgrade_slots": 2,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Exquisite Two-handed Ranged Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+6 Finesse Attrition",
		"cost": 15000,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 6
	},
	"Flawless Medium Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+5 Finesse Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Medium Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+5 Finesse Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Medium Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+5 Finesse Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"finesse_resistance": 5,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless One-handed Ranged Weapon ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+5 Finesse Attrition",
		"cost": 18000,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 5
	},
	"Flawless Medium Armor ⦾": {
		"slot": "Chest",
		"bonus": "+6 Finesse Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"finesse_resistance": 6,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Two-handed Ranged Weapon ⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Finesse Attrition",
		"cost": 24000,
		"upgrade_slots": 1,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 7
	},
	"Flawless Blade of Parrying ⦾": {
		"slot": "Off-Hand",
		"bonus": "+5 Finesse Resistance, +5 Fortitude Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"finesse_resistance": 5,
		"fortitude_resistance": 5,
		"finesse_attrition": 0
	},
	"Flawless Medium Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+6 Finesse Resistance",
		"cost": 36000,
		"upgrade_slots": 2,
		"finesse_resistance": 6,
		"fortitude_resistance": 0,
		"finesse_attrition": 0
	},
	"Flawless Two-handed Ranged Weapon ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Finesse Attrition",
		"cost": 36000,
		"upgrade_slots": 2,
		"finesse_resistance": 0,
		"fortitude_resistance": 0,
		"finesse_attrition": 7
	}
}

@export var foc_equip = {
	"Poor Light Gloves": {
		"slot": "Arms",
		"bonus": "+1 Focus Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Boots": {
		"slot": "Legs",
		"bonus": "+1 Focus Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Helmet": {
		"slot": "Head",
		"bonus": "+1 Focus Resistance",
		"cost": 50,
		"upgrade_slots": 0,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor One-handed Energy Materializer": {
		"slot": "Main Hand",
		"bonus": "+1 Focus Attrition, +2 Energy",
		"cost": 50,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 1,
		"energy_bonus": 2
	},
	"Poor Light Armor": {
		"slot": "Chest",
		"bonus": "+2 Focus Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Two-handed Energy Materializer": {
		"slot": "Both Hands",
		"bonus": "+3 Focus Attrition, +5 Energy",
		"cost": 100,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 3,
		"energy_bonus": 5
	},
	"Poor Rod of Warding": {
		"slot": "Off-Hand",
		"bonus": "+1 Focus Resistance, +1 Finesse Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"focus_resistance": 1,
		"finesse_resistance": 1,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+1 Focus Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Boots ⦾": {
		"slot": "Legs",
		"bonus": "+1 Focus Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Helmet ⦾": {
		"slot": "Head",
		"bonus": "+1 Focus Resistance",
		"cost": 100,
		"upgrade_slots": 1,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor One-handed Energy Materializer ⦾": {
		"slot": "Main Hand",
		"bonus": "+1 Focus Attrition, +2 Energy",
		"cost": 100,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 1,
		"energy_bonus": 2
	},
	"Fine Light Gloves": {
		"slot": "Arms",
		"bonus": "+2 Focus Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Boots": {
		"slot": "Legs",
		"bonus": "+2 Focus Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Helmet": {
		"slot": "Head",
		"bonus": "+2 Focus Resistance",
		"cost": 150,
		"upgrade_slots": 0,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine One-handed Energy Materializer": {
		"slot": "Main Hand",
		"bonus": "+2 Focus Attrition, +4 Energy",
		"cost": 150,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 2,
		"energy_bonus": 4
	},
	"Poor Light Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+1 Focus Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+1 Focus Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Light Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+1 Focus Resistance",
		"cost": 150,
		"upgrade_slots": 2,
		"focus_resistance": 1,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor One-handed Energy Materializer ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+1 Focus Attrition, +2 Energy",
		"cost": 150,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 1,
		"energy_bonus": 2
	},
	"Poor Light Armor ⦾": {
		"slot": "Chest",
		"bonus": "+2 Focus Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Two-handed Energy Materializer ⦾": {
		"slot": "Both Hands",
		"bonus": "+3 Focus Attrition, +5 Energy",
		"cost": 200,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 3,
		"energy_bonus": 5
	},
	"Poor Rod of Warding ⦾": {
		"slot": "Off-Hand",
		"bonus": "+1 Focus Resistance, +1 Finesse Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"focus_resistance": 1,
		"finesse_resistance": 1,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Armor": {
		"slot": "Chest",
		"bonus": "+3 Focus Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Two-handed Energy Materializer": {
		"slot": "Both Hands",
		"bonus": "+4 Focus Attrition, +8 Energy",
		"cost": 300,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 4,
		"energy_bonus": 8
	},
	"Fine Rod of Warding": {
		"slot": "Off-Hand",
		"bonus": "+2 Focus Resistance, +2 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"focus_resistance": 2,
		"finesse_resistance": 2,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+2 Focus Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Boots ⦾": {
		"slot": "Legs",
		"bonus": "+2 Focus Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Helmet ⦾": {
		"slot": "Head",
		"bonus": "+2 Focus Resistance",
		"cost": 300,
		"upgrade_slots": 1,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine One-handed Energy Materializer ⦾": {
		"slot": "Main Hand",
		"bonus": "+2 Focus Attrition, +4 Energy",
		"cost": 300,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 2,
		"energy_bonus": 4
	},
	"Poor Light Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+2 Focus Resistance",
		"cost": 300,
		"upgrade_slots": 2,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Poor Two-handed Energy Materializer ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+3 Focus Attrition, +5 Energy",
		"cost": 300,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 3,
		"energy_bonus": 5
	},
	"Superior Light Gloves": {
		"slot": "Arms",
		"bonus": "+3 Focus Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Boots": {
		"slot": "Legs",
		"bonus": "+3 Focus Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Helmet": {
		"slot": "Head",
		"bonus": "+3 Focus Resistance",
		"cost": 400,
		"upgrade_slots": 0,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior One-handed Energy Materializer": {
		"slot": "Main Hand",
		"bonus": "+3 Focus Attrition, +6 Energy",
		"cost": 400,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 3,
		"energy_bonus": 6
	},
	"Fine Light Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+2 Focus Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+2 Focus Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Light Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+2 Focus Resistance",
		"cost": 450,
		"upgrade_slots": 2,
		"focus_resistance": 2,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine One-handed Energy Materializer ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+2 Focus Attrition, +4 Energy",
		"cost": 450,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 2,
		"energy_bonus": 4
	},
	"Fine Light Armor ⦾": {
		"slot": "Chest",
		"bonus": "+3 Focus Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Two-handed Energy Materializer ⦾": {
		"slot": "Both Hands",
		"bonus": "+4 Focus Attrition, +8 Energy",
		"cost": 600,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 4,
		"energy_bonus": 8
	},
	"Fine Rod of Warding ⦾": {
		"slot": "Off-Hand",
		"bonus": "+2 Focus Resistance, +2 Finesse Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"focus_resistance": 2,
		"finesse_resistance": 2,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Armor": {
		"slot": "Chest",
		"bonus": "+4 Focus Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Two-handed Energy Materializer": {
		"slot": "Both Hands",
		"bonus": "+5 Focus Attrition, +11 Energy",
		"cost": 800,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 5,
		"energy_bonus": 11
	},
	"Superior Rod of Warding": {
		"slot": "Off-Hand",
		"bonus": "+3 Focus Resistance, +3 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"focus_resistance": 3,
		"finesse_resistance": 3,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+3 Focus Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Boots ⦾": {
		"slot": "Legs",
		"bonus": "+3 Focus Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Helmet ⦾": {
		"slot": "Head",
		"bonus": "+3 Focus Resistance",
		"cost": 800,
		"upgrade_slots": 1,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior One-handed Energy Materializer ⦾": {
		"slot": "Main Hand",
		"bonus": "+3 Focus Attrition, +6 Energy",
		"cost": 800,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 3,
		"energy_bonus": 6
	},
	"Fine Light Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+3 Focus Resistance",
		"cost": 900,
		"upgrade_slots": 2,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Fine Two-handed Energy Materializer ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+4 Focus Attrition, +8 Energy",
		"cost": 900,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 4,
		"energy_bonus": 8
	},
	"Superior Light Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+3 Focus Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+3 Focus Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+3 Focus Resistance",
		"cost": 1200,
		"upgrade_slots": 2,
		"focus_resistance": 3,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior One-handed Energy Materializer ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+3 Focus Attrition, +6 Energy",
		"cost": 1200,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 3,
		"energy_bonus": 6
	},
	"Superior Light Armor ⦾": {
		"slot": "Chest",
		"bonus": "+4 Focus Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Two-handed Energy Materializer ⦾": {
		"slot": "Both Hands",
		"bonus": "+5 Focus Attrition, +11 Energy",
		"cost": 1600,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 5,
		"energy_bonus": 11
	},
	"Superior Rod of Warding ⦾": {
		"slot": "Off-Hand",
		"bonus": "+3 Focus Resistance, +3 Finesse Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"focus_resistance": 3,
		"finesse_resistance": 3,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Light Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+4 Focus Resistance",
		"cost": 2400,
		"upgrade_slots": 2,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Superior Two-handed Energy Materializer ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+5 Focus Attrition, +11 Energy",
		"cost": 2400,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 5,
		"energy_bonus": 11
	},
	"Exquisite Light Gloves": {
		"slot": "Arms",
		"bonus": "+4 Focus Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Boots": {
		"slot": "Legs",
		"bonus": "+4 Focus Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Helmet": {
		"slot": "Head",
		"bonus": "+4 Focus Resistance",
		"cost": 2500,
		"upgrade_slots": 0,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite One-handed Energy Materializer": {
		"slot": "Main Hand",
		"bonus": "+4 Focus Attrition, +8 Energy",
		"cost": 2500,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 4,
		"energy_bonus": 8
	},
	"Exquisite Light Armor": {
		"slot": "Chest",
		"bonus": "+5 Focus Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Two-handed Energy Materializer": {
		"slot": "Both Hands",
		"bonus": "+6 Focus Attrition, +13 Energy",
		"cost": 5000,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 6,
		"energy_bonus": 13
	},
	"Exquisite Rod of Warding": {
		"slot": "Off-Hand",
		"bonus": "+4 Focus Resistance, +4 Finesse Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"focus_resistance": 4,
		"finesse_resistance": 4,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+4 Focus Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Boots ⦾": {
		"slot": "Legs",
		"bonus": "+4 Focus Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Helmet ⦾": {
		"slot": "Head",
		"bonus": "+4 Focus Resistance",
		"cost": 5000,
		"upgrade_slots": 1,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite One-handed Energy Materializer ⦾": {
		"slot": "Main Hand",
		"bonus": "+4 Focus Attrition, +8 Energy",
		"cost": 5000,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 4,
		"energy_bonus": 8
	},
	"Flawless Light Gloves": {
		"slot": "Arms",
		"bonus": "+5 Focus Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Boots": {
		"slot": "Legs",
		"bonus": "+5 Focus Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Helmet": {
		"slot": "Head",
		"bonus": "+5 Focus Resistance",
		"cost": 6000,
		"upgrade_slots": 0,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless One-handed Energy Materializer": {
		"slot": "Main Hand",
		"bonus": "+5 Focus Attrition, +10 Energy",
		"cost": 6000,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 5,
		"energy_bonus": 10
	},
	"Exquisite Light Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+4 Focus Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+4 Focus Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Light Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+4 Focus Resistance",
		"cost": 7500,
		"upgrade_slots": 2,
		"focus_resistance": 4,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite One-handed Energy Materializer ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+4 Focus Attrition, +8 Energy",
		"cost": 7500,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 4,
		"energy_bonus": 8
	},
	"Exquisite Light Armor ⦾": {
		"slot": "Chest",
		"bonus": "+5 Focus Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Two-handed Energy Materializer ⦾": {
		"slot": "Both Hands",
		"bonus": "+6 Focus Attrition, +13 Energy",
		"cost": 10000,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 6,
		"energy_bonus": 13
	},
	"Exquisite Rod of Warding ⦾": {
		"slot": "Off-Hand",
		"bonus": "+4 Focus Resistance, +4 Finesse Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"focus_resistance": 4,
		"finesse_resistance": 4,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Armor": {
		"slot": "Chest",
		"bonus": "+6 Focus Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"focus_resistance": 6,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Two-handed Energy Materializer": {
		"slot": "Both Hands",
		"bonus": "+7 Focus Attrition, +15 Energy",
		"cost": 12000,
		"upgrade_slots": 0,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 7,
		"energy_bonus": 15
	},
	"Flawless Rod of Warding": {
		"slot": "Off-Hand",
		"bonus": "+5 Focus Resistance, +5 Finesse Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"focus_resistance": 5,
		"finesse_resistance": 5,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Gloves ⦾": {
		"slot": "Arms",
		"bonus": "+5 Focus Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Boots ⦾": {
		"slot": "Legs",
		"bonus": "+5 Focus Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Helmet ⦾": {
		"slot": "Head",
		"bonus": "+5 Focus Resistance",
		"cost": 12000,
		"upgrade_slots": 1,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless One-handed Energy Materializer ⦾": {
		"slot": "Main Hand",
		"bonus": "+5 Focus Attrition, +10 Energy",
		"cost": 12000,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 5,
		"energy_bonus": 10
	},
	"Exquisite Light Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+5 Focus Resistance",
		"cost": 15000,
		"upgrade_slots": 2,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Exquisite Two-handed Energy Materializer ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+6 Focus Attrition, +13 Energy",
		"cost": 15000,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 6,
		"energy_bonus": 13
	},
	"Flawless Light Gloves ⦾⦾": {
		"slot": "Arms",
		"bonus": "+5 Focus Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Boots ⦾⦾": {
		"slot": "Legs",
		"bonus": "+5 Focus Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Helmet ⦾⦾": {
		"slot": "Head",
		"bonus": "+5 Focus Resistance",
		"cost": 18000,
		"upgrade_slots": 2,
		"focus_resistance": 5,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless One-handed Energy Materializer ⦾⦾": {
		"slot": "Main Hand",
		"bonus": "+5 Focus Attrition, +10 Energy",
		"cost": 18000,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 5,
		"energy_bonus": 10
	},
	"Flawless Light Armor ⦾": {
		"slot": "Chest",
		"bonus": "+6 Focus Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"focus_resistance": 6,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Two-handed Energy Materializer ⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Focus Attrition, +15 Energy",
		"cost": 24000,
		"upgrade_slots": 1,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 7,
		"energy_bonus": 15
	},
	"Flawless Rod of Warding ⦾": {
		"slot": "Off-Hand",
		"bonus": "+5 Focus Resistance, +5 Finesse Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"focus_resistance": 5,
		"finesse_resistance": 5,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Light Armor ⦾⦾": {
		"slot": "Chest",
		"bonus": "+6 Focus Resistance",
		"cost": 36000,
		"upgrade_slots": 2,
		"focus_resistance": 6,
		"finesse_resistance": 0,
		"focus_attrition": 0,
		"energy_bonus": 0
	},
	"Flawless Two-handed Energy Materializer ⦾⦾": {
		"slot": "Both Hands",
		"bonus": "+7 Focus Attrition, +15 Energy",
		"cost": 36000,
		"upgrade_slots": 2,
		"focus_resistance": 0,
		"finesse_resistance": 0,
		"focus_attrition": 7,
		"energy_bonus": 15
	}
}

@export var acc_equip = {
	"Poor Nano-Ring of Fortitude Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+1 Fortitude Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 1,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Ring of Finesse Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+1 Finesse Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Ring of Focus Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+1 Focus Resistance",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 1,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Ring of Fortitude Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+1 Fortitude Attrition",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 1,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Ring of Finesse Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+1 Finesse Attrition",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 1,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Ring of Focus Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+1 Focus Attrition",
		"cost": 100,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 1,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Amulet of Fortitude Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Fortitude Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 1,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Amulet of Finesse Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Finesse Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 1,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Amulet of Focus Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Focus Resistance",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 1,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Amulet of Fortitude Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Fortitude Attrition",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 1,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Amulet of Finesse Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Finesse Attrition",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 1,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Poor Nano-Amulet of Focus Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Focus Attrition",
		"cost": 200,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 1,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Ring of Fortitude Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+2 Fortitude Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Ring of Finesse Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+2 Finesse Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Ring of Focus Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+2 Focus Resistance",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 2,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Ring of Fortitude Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+2 Fortitude Attrition",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 2,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Ring of Finesse Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+2 Finesse Attrition",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 2,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Ring of Focus Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+2 Focus Attrition",
		"cost": 300,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 2,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Amulet of Fortitude Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+2 Fortitude Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 2,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Amulet of Finesse Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+2 Finesse Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Amulet of Focus Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+2 Focus Resistance",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 2,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Amulet of Fortitude Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+2 Fortitude Attrition",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 2,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Amulet of Finesse Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+2 Finesse Attrition",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 2,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Fine Nano-Amulet of Focus Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+2 Focus Attrition",
		"cost": 600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 2,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Fortitude Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+3 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 3,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Finesse Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+3 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Focus Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+3 Focus Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 3,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Fortitude Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+3 Fortitude Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Finesse Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+3 Finesse Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 3,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Focus Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+3 Focus Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 3,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Ring of Vigor": {
		"slot": "Nano-Ring",
		"bonus": "+5 Vigor",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 5,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of Fortitude Resistance": {
		"slot": "Power Chip",
		"bonus": "+2 Fortitude Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 2,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of Finesse Resistance": {
		"slot": "Power Chip",
		"bonus": "+2 Finesse Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 2,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of Focus Resistance": {
		"slot": "Power Chip",
		"bonus": "+2 Focus Resistance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 2,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of Fortitude Attrition": {
		"slot": "Power Chip",
		"bonus": "+2 Fortitude Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 2,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of Finesse Attrition": {
		"slot": "Power Chip",
		"bonus": "+2 Finesse Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 2,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of Focus Attrition": {
		"slot": "Power Chip",
		"bonus": "+2 Focus Attrition",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 2,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of the Biochemist": {
		"slot": "Power Chip",
		"bonus": "-1 to Biochemistry",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Biochemistry": -1}
	},
	"Superior Power Chip of the Metalsmith": {
		"slot": "Power Chip",
		"bonus": "-1 to Metalsmithing",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Metalsmithing": -1}
	},
	"Superior Power Chip of the Technician": {
		"slot": "Power Chip",
		"bonus": "-1 to Technician",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Technician": -1}
	},
	"Superior Power Chip of the Mechanizer": {
		"slot": "Power Chip",
		"bonus": "-1 to Mechanizing",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Mechanizing": -1}
	},
	"Superior Power Chip of the Augmenter": {
		"slot": "Power Chip",
		"bonus": "-1 to Augmenting",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Augmenting": -1}
	},
	"Superior Power Chip of Lockpicking": {
		"slot": "Power Chip",
		"bonus": "-1 to Lockpicking",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Lockpicking": -1}
	},
	"Superior Power Chip of Tracking": {
		"slot": "Power Chip",
		"bonus": "-1 to Tracking",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Tracking": -1}
	},
	"Superior Power Chip of Performance": {
		"slot": "Power Chip",
		"bonus": "-1 to Performance",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Performance": -1}
	},
	"Superior Power Chip of Knowledge": {
		"slot": "Power Chip",
		"bonus": "-1 to Knowledge",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Knowledge": -1}
	},
	"Superior Power Chip of Haggling": {
		"slot": "Power Chip",
		"bonus": "-1 to Haggling",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Haggling": -1}
	},
	"Superior Power Chip of Grappling": {
		"slot": "Power Chip",
		"bonus": "-1 to Grappling",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Grappling": -1}
	},
	"Superior Power Chip of Stealth": {
		"slot": "Power Chip",
		"bonus": "-1 to Stealth",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Stealth": -1}
	},
	"Superior Power Chip of Pickpocket": {
		"slot": "Power Chip",
		"bonus": "-1 to Pickpocket",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Pickpocket": -1}
	},
	"Superior Power Chip of Taming": {
		"slot": "Power Chip",
		"bonus": "-1 to Taming",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Taming": -1}
	},
	"Superior Power Chip of Persuasion": {
		"slot": "Power Chip",
		"bonus": "-1 to Persuasion",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Persuasion": -1}
	},
	"Superior Power Chip of Investigating": {
		"slot": "Power Chip",
		"bonus": "-1 to Investigation",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Investigation": -1}
	},
	"Superior Power Chip of Bribing": {
		"slot": "Power Chip",
		"bonus": "-1 to Bribing",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Bribing": -1}
	},
	"Superior Power Chip of Intimidation": {
		"slot": "Power Chip",
		"bonus": "-1 to Intimidation",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Intimidation": -1}
	},
	"Superior Power Chip of Scouting": {
		"slot": "Power Chip",
		"bonus": "-1 to Scouting",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Scouting": -1}
	},
	"Superior Power Chip of Energy": {
		"slot": "Power Chip",
		"bonus": "+2 Energy",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 2,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Power Chip of the Medic": {
		"slot": "Power Chip",
		"bonus": "-1 to Stabilizing",
		"cost": 800,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {"Stabilizing": -1}
	},
	"Superior Nano-Amulet of Fortitude Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+3 Fortitude Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 3,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Amulet of Finesse Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+3 Finesse Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 3,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Amulet of Focus Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+3 Focus Resistance",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 3,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Amulet of Fortitude Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+3 Fortitude Attrition",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 3,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Amulet of Finesse Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+3 Finesse Attrition",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 3,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Superior Nano-Amulet of Focus Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+3 Focus Attrition",
		"cost": 1600,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 3,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of Fortitude Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+4 Fortitude Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 4,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of Finesse Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+4 Finesse Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 4,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of Focus Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+4 Focus Resistance",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 4,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of Fortitude Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+4 Fortitude Attrition",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 4,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of Finesse Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+4 Finesse Attrition",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 4,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of Focus Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+4 Focus Attrition",
		"cost": 5000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 4,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Exquisite Nano-Ring of the Mountain": {
		"slot": "Nano-Ring",
		"bonus": "+1 Fortitude",
		"cost": 5000,
		"upgrade_slots": 0,
		"fort_level": 1,  # Directly increases Fortitude
	},
	"Exquisite Nano-Ring of the Ocean": {
		"slot": "Nano-Ring",
		"bonus": "+1 Finesse",
		"cost": 5000,
		"upgrade_slots": 0,
		"fin_level": 1,  # Directly increases Finesse
	},
	"Exquisite Nano-Ring of the Sky": {
		"slot": "Nano-Ring",
		"bonus": "+1 Focus",
		"cost": 5000,
		"upgrade_slots": 0,
		"foc_level": 1,  # Directly increases Focus
	},
	"Power Chip of the Fighter": {
		"slot": "Power Chip",
		"bonus": "-1 to Fortitude Attack Rolls",
		"cost": 5000,
		"upgrade_slots": 0,
		"fort_att_roll": -1
	},
	"Power Chip of the Ranger": {
		"slot": "Power Chip",
		"bonus": "-1 to Finesse Attack Rolls",
		"cost": 5000,
		"upgrade_slots": 0,
		"fin_att_roll": -1
	},
	"Power Chip of the EMP": {
		"slot": "Power Chip",
		"bonus": "-1 to Focus Attack Rolls",
		"cost": 5000,
		"upgrade_slots": 0,
		"foc_att_roll": -1
	},
	"Exquisite Nano-Amulet of Fortitude Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+4 Fortitude Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"fortitude_resistance": 4,
	},
	"Exquisite Nano-Amulet of Finesse Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+4 Finesse Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"finesse_resistance": 4,
	},
	"Exquisite Nano-Amulet of Focus Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+4 Focus Resistance",
		"cost": 10000,
		"upgrade_slots": 1,
		"focus_resistance": 4,
	},
	"Exquisite Nano-Amulet of Fortitude Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+4 Fortitude Attrition",
		"cost": 10000,
		"upgrade_slots": 1,
		"fortitude_attrition": 4,
	},
	"Exquisite Nano-Amulet of Finesse Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+4 Finesse Attrition",
		"cost": 10000,
		"upgrade_slots": 1,
		"finesse_attrition": 4,
	},
	"Exquisite Nano-Amulet of Focus Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+4 Focus Attrition",
		"cost": 10000,
		"upgrade_slots": 1,
		"focus_attrition": 4,
	},
	"Exquisite Nano-Amulet of Vigor ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Vigor",
		"cost": 10000,
		"upgrade_slots": 1,
		"vigor_increase": 5,  # Directly increases Vigor
	},
	"Flawless Nano-Ring of Fortitude Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+5 Fortitude Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 5,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Ring of Finesse Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+5 Finesse Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Ring of Focus Resistance": {
		"slot": "Nano-Ring",
		"bonus": "+5 Focus Resistance",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 5,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Ring of Fortitude Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+5 Fortitude Attrition",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Ring of Finesse Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+5 Finesse Attrition",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 5,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Ring of Focus Attrition": {
		"slot": "Nano-Ring",
		"bonus": "+5 Focus Attrition",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 5,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Ring of Power": {
		"slot": "Nano-Ring",
		"bonus": "+1 SD",
		"cost": 12000,
		"upgrade_slots": 0,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"fortitude_bonus": 0,
		"finesse_bonus": 0,
		"focus_bonus": 0,
		"energy_bonus": 0,
		"sd_bonus": 1,  # Grants an additional SD
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of the Mountain ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Fortitude",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"fortitude_bonus": 1,  # Directly increases Fortitude
		"finesse_bonus": 0,
		"focus_bonus": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of the Ocean ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Finesse",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"fortitude_bonus": 0,
		"finesse_bonus": 1,  # Directly increases Finesse
		"focus_bonus": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of the Sky ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 Focus",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"fortitude_bonus": 0,
		"finesse_bonus": 0,
		"focus_bonus": 1,  # Directly increases Focus
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Fortitude Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Fortitude Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 5,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Finesse Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Finesse Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 5,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Focus Resistance ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Focus Resistance",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 5,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Fortitude Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Fortitude Attrition",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 5,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Finesse Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Finesse Attrition",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 5,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Focus Attrition ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+5 Focus Attrition",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 5,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 0,
		"skill_negatives": {}
	},
	"Flawless Nano-Amulet of Power ⦾": {
		"slot": "Nano-Amulet",
		"bonus": "+1 SD",
		"cost": 24000,
		"upgrade_slots": 1,
		"fortitude_resistance": 0,
		"finesse_resistance": 0,
		"focus_resistance": 0,
		"fortitude_attrition": 0,
		"finesse_attrition": 0,
		"focus_attrition": 0,
		"vigor_increase": 0,
		"energy_bonus": 0,
		"sd_bonus": 1,
		"skill_negatives": {}
	}
}
