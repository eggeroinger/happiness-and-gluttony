extends StaticBody2D

var interactable = false
var special = false

@onready var text_buble: Label = %"Text buble"
@onready var stone_buble: Label = %stone_buble

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and interactable == true and special == false:
		print("its a stone")
		text_buble.text = "its a stone"
	elif Input.is_action_just_pressed("interact"):
		stone_buble.text = "sub"

func _on_area_2d_body_entered(body: Node2D) -> void:
	interactable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interactable = false
	text_buble.text = ""
	stone_buble.text = ""
