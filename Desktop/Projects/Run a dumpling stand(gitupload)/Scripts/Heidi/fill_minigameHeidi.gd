extends Node2D
@onready var nextarrow = $NextArrow
@onready var can_start: bool = false
@onready var BeefArea = $BeefArea
@onready var ChickenArea = $ChickenArea
@onready var PorkArea = $PorkArea
@onready var MushroomArea = $MushroomArea
@onready var StardustArea = $StardustArea
@onready var BeefHovering: bool = false
@onready var ChickenHovering: bool = false
@onready var PorkHovering: bool = false
@onready var MushroomHovering: bool = false
@onready var StardustHovering: bool = false
@onready var FillingsSprite = $Fillings
@onready var animationplayer = $Fillings/AnimationPlayer
@onready var started: bool = false
@onready var ranklabel = $RankLabel
@onready var dumpling = $DumplingRaw
@onready var wrapper = $Wrapper
@onready var rank = $Rank
@onready var splatsound = $splatsound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dumpling.visible = false
	wrapper.visible = true
	BeefHovering = false
	animationplayer.play("RESET")
	nextarrow.position = Vector2(103 , 35)
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Tutorials/FillTutorial.dialogue"))
	await DialogueManager.dialogue_ended
	can_start = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_start == true:
		await get_tree().create_timer(0.5).timeout
		if Input.is_action_just_pressed("click") and started == false:
			started = true
			if BeefHovering == true:
				FillingsSprite.play("beef")
			if ChickenHovering == true:
				FillingsSprite.play("chicken")
			if PorkHovering == true:
				FillingsSprite.play("pork")
			if MushroomHovering == true:
				FillingsSprite.play("mushroom")
			if StardustHovering == true:
				FillingsSprite.play("stardust")
			animationplayer.play("move")
		if Input.is_action_just_pressed("space") and started == true:
			animationplayer.pause()
			splatsound.play()
			if FillingsSprite.position.x > 35 or FillingsSprite.position.x < -35:
				ranklabel.text = "D"
			if FillingsSprite.position.x > 15 and FillingsSprite.position.x < 35 or FillingsSprite.position.x < -15 and FillingsSprite.position.x > -35:
				ranklabel.text = "C"
			if FillingsSprite.position.x > 5 and FillingsSprite.position.x < 15 or FillingsSprite.position.x < -5 and FillingsSprite.position.x > -15:
				ranklabel.text = "B"
			if FillingsSprite.position.x > 1.5 and FillingsSprite.position.x < 5 or FillingsSprite.position.x < -1.5 and FillingsSprite.position.x > -5:
				ranklabel.text = "A"
			if FillingsSprite.position.x > 0 and FillingsSprite.position.x < 1.5 or FillingsSprite.position.x < -0 and FillingsSprite.position.x > -1.5:
				ranklabel.text = "S"
			animationplayer.play("RankAnimation")
			await get_tree().create_timer(1).timeout
			dumpling.visible = true
			FillingsSprite.visible = false
			wrapper.visible = false
			nextarrow.position = Vector2(62 , 28)

func _physics_process(delta: float) -> void:
	if dumpling.visible == true:
		if Input.is_action_just_pressed("Right"):
			get_tree().change_scene_to_file("res://Scenes/Heidi/CookCutsceneHeidi.tscn")

func _on_beef_area_mouse_entered() -> void:
	BeefHovering = true

func _on_beef_area_mouse_exited() -> void:
	BeefHovering = false


func _on_chicken_area_mouse_entered() -> void:
	ChickenHovering = true

func _on_chicken_area_mouse_exited() -> void:
	ChickenHovering = false


func _on_pork_area_mouse_entered() -> void:
	PorkHovering = true

func _on_pork_area_mouse_exited() -> void:
	PorkHovering = false


func _on_mushroom_area_mouse_entered() -> void:
	MushroomHovering = true

func _on_mushroom_area_mouse_exited() -> void:
	MushroomHovering = false


func _on_stardust_area_mouse_entered() -> void:
	StardustHovering = true

func _on_stardust_area_mouse_exited() -> void:
	StardustHovering = false
