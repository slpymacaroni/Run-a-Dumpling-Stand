extends Node2D
@onready var nextarrow = $NextArrow
@onready var can_start: bool = false

var KneadAmount: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nextarrow.position = Vector2(103 , 35)
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Tutorials/StretchTutorial.dialogue"))
	await DialogueManager.dialogue_ended
	can_start = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
