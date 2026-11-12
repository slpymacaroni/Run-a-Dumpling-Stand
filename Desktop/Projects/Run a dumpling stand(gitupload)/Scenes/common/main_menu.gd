extends Node2D
@onready var StartHovering: bool = false
@onready var QuitHovering: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and StartHovering == true:
		get_tree().change_scene_to_file("res://Scenes/Nathan/CounterNathan.tscn")
	if Input.is_action_just_pressed("click") and QuitHovering == true:
		get_tree().quit()



func _on_start_area_2d_mouse_entered() -> void:
	StartHovering = true


func _on_start_area_2d_mouse_exited() -> void:
	StartHovering = false



func _on_quit_area_2d_mouse_entered() -> void:
	QuitHovering = true


func _on_quit_area_2d_mouse_exited() -> void:
	QuitHovering = false
