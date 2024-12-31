extends TextureButton

var music_bus = AudioServer.get_bus_index("Master")

func _process(_delta: float) -> void:
	if AudioServer.is_bus_mute(music_bus) == true:
		set_pressed_no_signal(true)
	else:
		set_pressed_no_signal(false)
		
func _on_pressed() -> void:
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
