extends Node2D

var ghost_mob = load("res://scenes/ghost.tscn")
var mirror_tower = load("res://scenes/mirror_tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	mirror_tower = mirror_tower.instantiate()
	mirror_tower.global_position = Vector2i(1280/2, 720/2)
	add_child(mirror_tower)
	
	$StartTimer.start()
	$EnemyTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_timer_timeout():
	pass

func _on_enemy_timer_timeout():
	var enemy_mob = ghost_mob.instantiate() # create a new instance of the enemy spawner scene (we have loaded the Ghost.tscn here)
	
	var mob_spawn_location = $MobPath/MobSpawnLocation # "choose a random location on a Path2D" >> Not sure how this works yet...
	mob_spawn_location.progress_ratio = randf() # oh okay, this chooses a random ratio along the path (0 is beginning, 1 is end)
	
	enemy_mob.position = mob_spawn_location.position # sets the enemy's position to the randomized location along the Path2D
	
	var velocity = Vector2(randf_range(0.5, 10), 0.0) # sets a random velocity for the mob
	enemy_mob.motion = velocity
	# enemy_mob.linear_velocity = velocity.rotated(direction) # now brother what (( did not use godot docs' random direction stuff here))

	add_child(enemy_mob)
