extends CharacterBody2D


@export var SPEED = 100.0
@export var ACCELRATION = 20.0
@export var FRICTION = 10.0
@onready var sprite = $Sprite


func _physics_process(delta):
	print(velocity)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left","right","up","down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELRATION)
		sprite.play("run")
		
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION)
		sprite.play("idle")
	
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
		
		
	
	move_and_slide()
