extends Node2D

@export var prefab: PackedScene
@export var spawn_interval: float = 2.0
@export var random_offset: float = 2.0

var timer: float = 0.0

func _process(delta: float) -> void:
	timer += delta

	if timer >= spawn_interval:
		timer = 0.0
		spawn_prefab()

func spawn_prefab() -> void:
	if prefab == null:
		return

	var instance = prefab.instantiate()
	add_child(instance)
	
	var offset = Vector2( 0,randf_range(-random_offset, random_offset))
	
	instance.global_position = global_position + offset
