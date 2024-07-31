extends Node2D
var ghost = load("res://scenes/ghost.tscn")
var mirror_tower = load("res://scenes/mirror_tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ghost = ghost.instantiate()
	mirror_tower = mirror_tower.instantiate()
	
	add_child(mirror_tower)
	add_child(ghost)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
