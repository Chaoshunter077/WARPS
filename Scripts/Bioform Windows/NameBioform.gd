extends Control

@onready var bioform_label = $Bioform
@onready var alpha_gen_window = $AlphaGenWindow
@onready var delta_gen_window = $DeltaGenWindow
@onready var zeta_gen_window = $ZetaGenWindow
@onready var kosmari_window = $KosmariWindow
@onready var dark_kosmari_window = $DarkKosmariWindow
@onready var aethmir_window = $AethmirWindow
@onready var light_aethmir_window = $LightAethmirWindow
@onready var petroan_window = $PetroanWindow
@onready var crytoan_window = $CrytoanWindow
@onready var relkin_window = $RelkinWindow
@onready var felkin_window = $FelkinWindow
@onready var epsilon_virekai_window = $EpsilonWindow
@onready var gamma_virekai_window = $GammaWindow
@onready var armatura_mecha_window = $ArmaturaWindow
@onready var imperium_mecha_window = $ImperiumWindow
@onready var auxilium_mecha_window = $AuxiliumWindow
@onready var custom_bio_window = $CustomBioWindow


	
#update character name and save to global
func _on_line_edit_text_changed(new_text: String) -> void:
	Global.charname = new_text
	print(Global.charname)
#update bioform label for choice confirmation
func _process(_delta: float):
	bioform_label.text = "Bioform: " + Global.bioform
	$Level/Label/LevelSelect.selected = Global.charlevel - 1
	$LineEdit.placeholder_text = Global.charname

func _update_label():
	bioform_label.text = "Bioform: " + Global.bioform
	
	
	#Set Bioform choice windows
func _on_alpha_gen_button_pressed() -> void:
	alpha_gen_window.show()
func _on_delta_gen_button_pressed() -> void:
	delta_gen_window.show()
func _on_zeta_gen_button_pressed() -> void:
	zeta_gen_window.show()
func _on_kosmari_button_pressed() -> void:
	kosmari_window.show()
func _on_dark_kosmari_button_pressed() -> void:
	dark_kosmari_window.show()
func _on_aethmir_button_pressed() -> void:
	aethmir_window.show()
func _on_light_aethmir_button_pressed() -> void:
	light_aethmir_window.show()
func _on_petroan_button_pressed() -> void:
	petroan_window.show()
func _on_crytoan_button_pressed() -> void:
	crytoan_window.show()
func _on_relkin_button_pressed() -> void:
	relkin_window.show()
func _on_felkin_button_pressed() -> void:
	felkin_window.show()
func _on_epsilon_virekai_button_pressed() -> void:
	epsilon_virekai_window.show()
func _on_gamma_virekai_button_pressed() -> void:
	gamma_virekai_window.show()
func _on_mecha_armatura_button_pressed() -> void:
	armatura_mecha_window.show()
func _on_mecha_imperium_button_pressed() -> void:
	imperium_mecha_window.show()
func _on_mecha_auxilium_button_pressed() -> void:
	auxilium_mecha_window.show()
func _on_button_pressed() -> void:
	custom_bio_window.show()

func _on_option_button_item_selected(_index: int) -> void:
	Global.charlevel = $Level/Label/LevelSelect.selected + 1
	Global.charst = floor((Global.charlevel - 1) / 2) + 1
	Global.base_energy = Global.charst + 1
	print(Global.charst)
