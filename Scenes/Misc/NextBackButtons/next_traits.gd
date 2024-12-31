extends Button

@export var allocated_sd = 0
@export var profession_check = 0
@export var sd_check = 0




func _on_pressed() -> void:
	allocated_sd = Global.bio_fort_sd + Global.bio_fin_sd + Global.bio_foc_sd
	check_profession()
	check_sd()
	if profession_check == 1 and sd_check == 1:
		Global.temp_trait_points = Global.trait_points
		get_tree().change_scene_to_file("res://Scenes/Trait Window/trait_selection.tscn")
		assign_profession_bonus()
	else:
		$"../SD_Profession_Window".show()

func check_profession():
	if Global.profession == "Not Selected":
		profession_check = 0
	else:
		profession_check = 1
		
func check_sd():
	if allocated_sd < Global.max_sd:
		sd_check = 0
	else:
		sd_check = 1
	
func assign_profession_bonus():
	if Global.profession == "Biochemist":
		Global.bio_bonus_skills["Biochemistry"] = -1
	if Global.profession == "Metalsmith":
		Global.bio_bonus_skills["Metalsmithing"] = -1		
	if Global.profession == "Augmenter":
		Global.bio_bonus_skills["Augmenting"] = -1		
	if Global.profession == "Technician":
		Global.bio_bonus_skills["Technician"] = -1
	if Global.profession == "Mechanizer":
		Global.bio_bonus_skills["Mechanizing"] = -1		
	if Global.profession == "Performer":
		Global.bio_bonus_skills["Performance"] = -1		
		
		
		
		
		
