extends AnimatedSprite2D

@onready var animatedsprite2d = $"."
@onready var camera = $"../Camera2D"
@onready var CustomerSprites = $"../CustomerSprites"
@onready var can_scroll: bool = false
@onready var minigames = $"../MinigamesButtons"
@onready var hovering: bool = true

var state: State = State.Counter
enum State{
	Counter,
	Kitchen,
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	minigames.visible = false
	animatedsprite2d.play("Counter")
	await DialogueManager.dialogue_ended
	can_scroll = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_scroll == true:
		match state:
			State.Counter:
				animatedsprite2d.play("Counter")
				state = State.Counter
				if Input.is_action_just_pressed("Right"):
					state = State.Kitchen
				if Input.is_action_just_pressed("Left"):
					camera._screenshake()
				minigames.visible = false
			State.Kitchen:
				animatedsprite2d.play("Kitchen")
				state = State.Kitchen
				if Input.is_action_just_pressed("Left"):
					state = State.Counter 
				if Input.is_action_just_pressed("Right"):
					camera._screenshake()
				minigames.visible = true
				if hovering == true and Input.is_action_just_pressed("click"):
					get_tree().change_scene_to_file("res://Scenes/Nathan/DoughMinigameNathan.tscn")
func _on_dough_pressed() -> void:
	pass # Replace with function body.

func _on_area_2d_mouse_entered() -> void:
	hovering = true

func _on_area_2d_mouse_exited() -> void:
	hovering = false
