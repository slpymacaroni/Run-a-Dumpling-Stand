extends Node2D
@onready var sinkactivation = $BG/SinkActivation
@onready var animationplayer = $BG/AnimationPlayer
@onready var chopsticksarea = $Chopsticks
@onready var mixdetection = $bowl/MixDetection
@onready var bowl = $bowl
@onready var sinkopened: bool = false
@onready var nextarrow = $NextArrow
@onready var inventory = $Inventory
@onready var can_start: bool = false
@onready var rank
@onready var ranklabel = $RankLabel
@onready var rankanimationplayer = $RankAnimationPlayer
@onready var mixsound = $MixSound

var KneadAmount: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Tutorials/KneadTutorial.dialogue"))
	animationplayer.play("SinkOn")
	bowl.play("wetflour")
	KneadAmount = randi_range(30, 45)
	nextarrow.position = Vector2(100000 , 100000)
	await DialogueManager.dialogue_ended
	can_start = true
	_rank_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if KneadAmount < 0:
		if Input.is_action_just_pressed("Right"):
			get_tree().change_scene_to_file("res://Scenes/Josianne/StretchMinigameJosianne.tscn")


func _on_mix_detection_area_entered(area: Area2D) -> void:
	if can_start == true:
		KneadAmount += -1
		animationplayer.play("FlourParticles")
		mixsound.play()
		mixsound.pitch_scale = randf_range(1.8, 1.2)
		if KneadAmount == 0:
			bowl.play("dough")
			nextarrow.position = Vector2(55 , 26)
			_get_rank()


func _rank_timer():
	rank = "S"
	await get_tree().create_timer(5).timeout
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
	rankanimationplayer.play("RankAnimation")
