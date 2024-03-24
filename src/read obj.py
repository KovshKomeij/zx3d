from pywavefront import Wavefront

file = open('model.bas', 'w')
model = Wavefront('cube.obj', collect_faces=True)

num_faces = len(model.mesh_list[0].faces)
num_vertices = len(model.vertices)

file.write(f'DIM q AS INTEGER = {num_faces}\n')
file.write(f'DIM v({num_vertices},3) AS INTEGER\n')
file.write(f'DIM f({num_faces},3) AS INTEGER\n\n')

file.write(f'FOR r=1 TO {num_vertices}\n    FOR c=1 TO 3\n      READ v(r,c)\n   NEXT c\nNEXT r\n\n')

for vertex in model.vertices:
    scaled_vertex = (int(vertex[0] * 50), int(vertex[1] * 50), int(vertex[2] * 50))
    clean = str(scaled_vertex)
    file.write(f'DATA {clean.strip("()")}\n')

file.write(f'\nFOR r=1 TO {num_faces}\n   FOR c=1 TO 3\n      READ f(r,c)\n   NEXT c\nNEXT r\n\n')

for name, material in model.meshes.items():
    for face in material.faces:
        clean = str(face)
        file.write(f'DATA {clean.strip("[]")}\n')