extends KinematicBody2D


export (int) var speed = 20
var velocity = Vector2()

onready var sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		sprite.play("walk_right")
		velocity.x += 1
	if Input.is_action_pressed("left"):
		sprite.play("walk_left")
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		sprite.play("walk_down")
		velocity.y += 1
	if Input.is_action_pressed("up"):
		sprite.play("walk_up")
		velocity.y -= 1
		
	velocity = velocity.normalized() * speed
	
	velocity = move_and_slide(velocity)
