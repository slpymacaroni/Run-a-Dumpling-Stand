extends Node2D

@onready var animatedsprite2d = $BG

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animatedsprite2d.play("cook")
	await get_tree().create_timer(5).timeout
	animatedsprite2d.stop()
	get_tree().change_scene_to_file("res://Scenes/Heidi/EndCounterHeidi.tscn")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
