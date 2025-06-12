extends CharacterBody2D

@export var speed = 100

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: Vector2 = Vector2.RIGHT  # Default facing right
var allow_input = true

func _physics_process(delta):
	var direction = Vector2.ZERO

	if allow_input == true:
		# get input
		if Input.is_action_pressed("move_right"):
			direction.x += 1
		if Input.is_action_pressed("move_left"):
			direction.x -= 1
		if Input.is_action_pressed("move_down"):
			direction.y += 1
		if Input.is_action_pressed("move_up"):
			direction.y -= 1

		# movement and animation
		if direction != Vector2.ZERO:
			direction = direction.normalized()
			velocity = direction * speed
			last_direction = direction  # Save last non-zero direction

			# play walk animations
			if abs(direction.x) > abs(direction.y):
				animated_sprite_2d.play("walk_l_r")
				animated_sprite_2d.flip_h = direction.x < 0
			elif direction.y > 0:
				animated_sprite_2d.play("walk_down")
				animated_sprite_2d.flip_h = false  # Just to be safe
			else:
				animated_sprite_2d.play("walk_up")
				animated_sprite_2d.flip_h = false
		else:
			velocity = Vector2.ZERO

			# play idle based on last direction
			if abs(last_direction.x) > abs(last_direction.y):
				animated_sprite_2d.play("idle_l_r")
				animated_sprite_2d.flip_h = last_direction.x < 0
			elif last_direction.y > 0:
				animated_sprite_2d.play("idle_down")
				animated_sprite_2d.flip_h = false
			else:
				animated_sprite_2d.play("idle_up")
				animated_sprite_2d.flip_h = false

		move_and_slide()
