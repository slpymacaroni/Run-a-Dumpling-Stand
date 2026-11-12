extends AnimatedSprite2D
@onready var animatedsprite2d = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animatedsprite2d.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _beef():
	animatedsprite2d.play("beef")
	animatedsprite2d.visible = true
func _chicken():
	animatedsprite2d.play("chicken")
	animatedsprite2d.visible = true
func _pork():
	animatedsprite2d.play("pork")
	animatedsprite2d.visible = true
func _mushroom():
	animatedsprite2d.play("mushroom")
	animatedsprite2d.visible = true
func _stardust():
	animatedsprite2d.play("stardust")
	animatedsprite2d.visible = true
