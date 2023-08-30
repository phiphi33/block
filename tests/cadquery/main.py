import cadquery as cq
p_type = "I"
p_1 = 5

size = 9.6

cube = cq.Workplane("XY" ).box(size, size, size/2)
    
cube = result.faces(">Z").hole(diameter=6.4)

cube = result.edges("%CIRCLE").chamfer(0.8, 2.399)

result = result.translate((9.6,0,0))

#if (type == "I"):
    
