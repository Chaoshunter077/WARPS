extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.chosen_reckless.size() == 0:
		$".".text = ""

	elif Global.chosen_reckless.size() > 0:
		$".".text = str(Global.chosen_reckless.size())
