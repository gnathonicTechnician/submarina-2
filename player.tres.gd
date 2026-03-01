extends CharacterBody2D

const SPEED = 500.0

func _ready():
	add_to_group("Player")

func _process(delta: float) -> void:	
	position.x += 25
	
	var direction := Input.get_axis("up", "down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
	
func killPlayer():
	position = %RespawnPoint.position

func _on_kill_zone_top_body_entered(body: Node2D) -> void:
	killPlayer()

func _on_kill_zone_bottom_body_entered(body: Node2D) -> void:
	killPlayer()


func _on_checkpoint_body_entered(body: Node2D) -> void:
	print("You won!")
