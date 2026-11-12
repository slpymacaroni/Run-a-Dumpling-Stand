extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _screenshake() -> void:
	offset.x = -4
	await get_tree().create_timer(0.1).timeout
	offset.x = 4
	await get_tree().create_timer(0.1).timeout
	offset.x = -3
	await get_tree().create_timer(0.1).timeout
	offset.x = 3
	await get_tree().create_timer(0.1).timeout
	offset.x = 1
	await get_tree().create_timer(0.1).timeout
	offset.x = 0
