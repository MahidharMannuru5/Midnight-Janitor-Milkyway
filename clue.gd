extends Area2D

@export var clue_text: String = "A simple, but important clue."

var is_player_in_range: bool = false

func _on_body_entered(body: Node2D):
	if body.name == "Player":
		is_player_in_range = true
		print("--- PRESS E TO INTERACT ---")

func _on_body_exited(body: Node2D):
	if body.name == "Player":
		is_player_in_range = false
		print("--- CLUE OUT OF RANGE ---")


func _process(delta: float):
	# 'ui_accept' is Spacebar/Enter by default.
	if is_player_in_range and Input.is_action_just_pressed("ui_accept"):
		interact()

func interact():
	print("CLUE EXAMINED: " + clue_text)
	
	set_process(false) 
	hide() 				
	$CollisionShape2D.set_deferred("disabled", true)
