extends Node2D

@onready var player_node = get_tree().get_first_node_in_group("Player")
@onready var timer: Timer = $Timer

var barracuda_scene = preload("res://barracuda.tscn")
var angler_scene = preload("res://angler.tscn")

func _ready() -> void:
	timer.wait_time = 3.0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
func _on_timer_timeout():
	var enemies = [barracuda_scene, angler_scene]
	var enemy = enemies.pick_random().instantiate()
	var random_x = player_node.global_position.x + 3000
	var random_y = randf_range(-600, 600)
	enemy.position = Vector2(random_x, random_y)
	
	add_child(enemy)
