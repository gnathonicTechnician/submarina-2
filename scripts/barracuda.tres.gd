extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta: float) -> void:
	velocity.x = -SPEED
	
	move_and_slide()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global_SCORE.add_score(10)
		queue_free()
