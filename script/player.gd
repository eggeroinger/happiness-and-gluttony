extends CharacterBody2D

@export var speed = 100

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO

	# get direction
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	# apply direction
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed

		# play appropriate animation based on direction
		if abs(direction.x) > abs(direction.y):
			animated_sprite_2d.play("walk_l_r")
			animated_sprite_2d.flip_h = direction.x < 0
		elif direction.y > 0:
			animated_sprite_2d.play("walk_down")
		else:
			animated_sprite_2d.play("walk_up")
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.play("idel_down")

	move_and_slide()

#testing testing, delete this when u see it, lenn
