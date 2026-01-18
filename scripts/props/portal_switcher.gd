extends Area2D


var portals : = {} # pair_id -> Array[Portal]

func _ready():
    var portal_nodes = get_tree().get_nodes_in_group("portals")
    
    for portal in portal_nodes:
        var id = portal.pair_id
        
        if not portals.has(id):
            portals[id] = []
        
        portals[id].append(portal)

func activate_pair(pair_id : int):
    if not portals.has(pair_id):
        return
    for portal in portals[pair_id]:
        portal.turn_on(true)
