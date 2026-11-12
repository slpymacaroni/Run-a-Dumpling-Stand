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
	animatedsprite2d.position = Vector2(-23 , 87)
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
				var choice = randi_range(1 ,1) #STARDUST ONLY WOO
				if choice == 1:
					DialogueManager.show_dialogue_balloon(load("res://Dialogue/Heidi/GreetHeidiStardust.dialogue"))
					OrderCard1._stardust()
					await DialogueManager.dialogue_ended
					animatedsprite2d.play("Idle-1")
