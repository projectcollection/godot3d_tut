extends Node

@export var mob_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	var mob_spawn_location = $SpawnPath/SpawnLocation

	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)

	add_child(mob)

func _on_player_hit():
	$MobTimer.stop()
