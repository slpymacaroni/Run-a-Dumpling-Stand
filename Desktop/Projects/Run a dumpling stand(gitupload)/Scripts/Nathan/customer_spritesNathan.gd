extends AnimatedSprite2D

@onready var animatedsprite2d = $"."
@onready var NathanChosen: bool = false
@onready var JosianneChosen: bool = false
@onready var HeidiChosen: bool = false
@onready var OrderCard1 = $"../HUD/Control/OrderCard1"



var state: State = State.Nathan
enum State{
	Nathan,
	Josianne,
	Heidi,
	}

func _ready() -> void:
	animatedsprite2d.position = Vector2(-23 , 105)
	animatedsprite2d.play("Idle-1")
	await get_tree().create_timer(1.5).timeout
	for x in range(8):
		animatedsprite2d.position.x += 10
		await get_tree().create_timer(0.01).timeout
	await get_tree().create_timer(0.5).timeout

func _process(delta: float) -> void:
	match state:
		State.Nathan:
			if  NathanChosen == false:
				NathanChosen = true
				await get_tree().create_timer(2).timeout
				animatedsprite2d.play("Confused-1")
				var choice = randi_range(1 , 3) #1 is beef 2 is chicken 3 is pork
				if choice == 1:
					DialogueManager.show_dialogue_balloon(load("res://Dialogue/Nathan/GreetNathanBeef.dialogue"))
					OrderCard1._beef()
					await DialogueManager.dialogue_ended
					animatedsprite2d.play("Happy-1")
				if choice == 2:
					DialogueManager.show_dialogue_balloon(load("res://Dialogue/Nathan/GreetNathanChicken.dialogue"))
					await DialogueManager.dialogue_ended
					OrderCard1._chicken()
					animatedsprite2d.play("Happy-1")
				if choice == 3:
					DialogueManager.show_dialogue_balloon(load("res://Dialogue/Nathan/GreetNathanPork.dialogue"))
					await DialogueManager.dialogue_ended
					OrderCard1._pork()
					animatedsprite2d.play("Happy-1")
