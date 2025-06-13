extends Sprite2D

#Player ref and vars
@onready var player = %Player
@onready var coll = self.get_child(0).get_child(0)
var speed = 2.0
var direction

#update distance/direction to player every frame and then apply with speed to pos
func _process(delta: float) -> void:
	direction = self.global_position.direction_to(player.global_position)
	print(direction)
	self.global_position = self.global_position + speed * direction 

func _on_player_entered(coll):
	speed = 0	
	
