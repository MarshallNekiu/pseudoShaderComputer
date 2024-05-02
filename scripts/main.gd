@tool
extends Node3D

@onready var cam := $Cam as Camera3D


func _ready() -> void:
	$Audio.viewport = ($Canvas/SubViewportContainer/SubViewport as SubViewport).get_texture()
	$Audio.shader = ($Canvas/SubViewportContainer/SubViewport/Track as ColorRect).material
	$Audio.shader3d = ($Player/Mesh as MeshInstance3D).get_active_material(0)
	$Audio.label = $Canvas/Label



func _process(delta: float) -> void:
	looking()


func looking() -> void:
	await get_tree().create_timer(0.1).timeout
	cam.look_at(($Player as CharacterBody3D).position)
