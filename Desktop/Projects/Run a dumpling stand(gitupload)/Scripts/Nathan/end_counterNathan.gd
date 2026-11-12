extends Node2D
@onready var animatedsprite2d = $CustomerSprites

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Nathan/EndNathanPerfect.dialogue"))
	await DialogueManager.dialogue_ended
	for y in range(12):
		animatedsprite2d.position.x += -10
		await get_tree().create_timer(0.01).timeout
	await get_tree().create_timer(0.5).timeout
	var x = randi_range(1, 2)
	if x == 1:
		get_tree().change_scene_to_file("res://Scenes/Heidi/CounterHeidi.tscn")
	if x == 2:
		get_tree().change_scene_to_file("res://Scenes/Josianne/CounterJosianne.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
