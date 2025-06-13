extends AnimatedSprite2D

#Player ref and vars
@onready var player = %Player
@onready var coll = self.get_child(0).get_child(0)

var speed = 1.0
var direction
var activated = false
var one_time = 1

#update distance/direction to player every frame and then apply with speed to pos
func _process(delta: float) -> void:
	if activated == true:
		direction = self.global_position.direction_to(player.global_position)
		print(direction)
		self.global_position = self.global_position + speed * direction 

#hurt 
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit")
	speed = 0
	
# wake up
func _on_activation_box_body_entered(body: Node2D) -> void:
	if one_time == 1:
		print("activated")
		play("wake up")
		one_time -= 1

# start walking after wake up
func _on_animation_looped() -> void:
	activated = true
	play("walk")
