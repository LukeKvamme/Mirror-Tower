extends Node2D

var ghost = preload("res://scenes/ghost.tscn")
var mirror_tower = preload("res://scenes/mirror_tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var g = ghost.instantiate()
	var m = mirror_tower.instantiate()
	
	add_child(g)
	add_child(m)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
