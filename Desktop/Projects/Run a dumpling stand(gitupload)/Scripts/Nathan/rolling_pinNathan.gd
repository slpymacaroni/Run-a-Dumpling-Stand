extends CharacterBody2D

@onready var rollingpin = $"."
@onready var wrapper = $"../Wrapper"
@onready var DetectionArea = $"../Wrapper/DetectionArea"
@onready var nextarrow = $"../NextArrow"
@onready var canstart: bool = false
@onready var animationplayer =  $"../AnimationPlayer"
var StretchAmount: int 
@onready var rank
@onready var ranklabel = $"../RankLabel"
@onready var RankAnimationPlayer = $"../RankAnimationPlayer"


func _ready() -> void:
	animationplayer.play("RESET")
	rollingpin.position = Vector2(0, 27)
	StretchAmount = randi_range(6 , 8)
	RankAnimationPlayer.play("RESET")

func _process(delta: float) -> void:
	await DialogueManager.dialogue_ended
	canstart = true
	_rank_timer()



func  _physics_process(delta: float) -> void:
	if canstart == true:
		if Input.is_action_just_pressed("Up"):
			velocity.y += -5
		if Input.is_action_just_pressed("Down"):
			velocity.y += 5
		move_and_slide()
	if StretchAmount < 0 or StretchAmount == 0:
		if Input.is_action_just_pressed("Right"):
			get_tree().change_scene_to_file("res://Scenes/Nathan/FillMinigameNathan.tscn")

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("stopperup"):
		velocity.y = 0
		velocity.y = 5

	if area.is_in_group("stopperdown"):
		velocity.y = 0
		velocity.y = -5

func _on_detection_area_area_entered(area: Area2D) -> void:
	StretchAmount += -1
	animationplayer.play("Particles")
	wrapper.rotate(randf_range(0, 360))
	if StretchAmount == 3:
		wrapper.play("Medium")
	if StretchAmount == 0:
		wrapper.play("Big")
		nextarrow.position = Vector2(62 , 28)
		_get_rank()

func _rank_timer():
	rank = "S"
	await get_tree().create_timer(9).timeout
	rank = "A"
	await get_tree().create_timer(4).timeout
	rank = "B"
	await get_tree().create_timer(3).timeout
	rank = "C"
	await get_tree().create_timer(2).timeout
	rank = "D"
	await get_tree().create_timer(1).timeout
	rank = "F"

func _get_rank():
	ranklabel.text = rank
	RankAnimationPlayer.play("RankAnimation")
