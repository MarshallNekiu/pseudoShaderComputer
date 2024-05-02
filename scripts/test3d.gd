extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mdt := MeshDataTool.new()
	var nd := $MeshInstance3D as MeshInstance3D
	var m = nd.mesh
	mdt.create_from_surface(m, 0)
	var v: Array
	for vtx in range(mdt.get_vertex_count()):
		var vert := mdt.get_vertex(vtx)
		v.append(vert)
	OS.alert(str(v))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
