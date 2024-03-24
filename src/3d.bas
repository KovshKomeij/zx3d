DIM q AS INTEGER = 12
DIM v(8,3) AS INTEGER
DIM f(12,3) AS INTEGER

FOR r=1 TO 8
    FOR c=1 TO 3
      READ v(r,c)
   NEXT c
NEXT r

DATA 50, 50, -50
DATA 50, -50, -50
DATA 50, 50, 50
DATA 50, -50, 50
DATA -50, 50, -50
DATA -50, -50, -50
DATA -50, 50, 50
DATA -50, -50, 50

FOR r=1 TO 12
   FOR c=1 TO 3
      READ f(r,c)
   NEXT c
NEXT r

DATA 0, 4, 6
DATA 2, 0, 6
DATA 3, 2, 6
DATA 7, 3, 6
DATA 7, 6, 4
DATA 5, 7, 4
DATA 5, 1, 3
DATA 7, 5, 3
DATA 1, 0, 2
DATA 3, 1, 2
DATA 5, 4, 0
DATA 1, 5, 0

DIM x1 AS INTEGER
DIM y1 AS INTEGER
DIM z1 AS INTEGER
DIM x2 AS INTEGER
DIM y2 AS INTEGER
DIM z2 AS INTEGER
DIM x3 AS INTEGER
DIM y3 AS INTEGER
DIM z3 AS INTEGER
DIM sx AS FLOAT
DIM cox AS FLOAT
DIM sy AS FLOAT
DIM coy AS FLOAT
DIM rx AS INTEGER
DIM ry AS INTEGER

DIM dx1 AS INTEGER
DIM dy1 AS INTEGER
DIM dx2 AS INTEGER
DIM dy2 AS INTEGER

DIM fov AS INTEGER = 90
DIM cx AS INTEGER = 0
DIM cy AS INTEGER = 0
DIM cz AS INTEGER = -150

PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 

WHILE 1=1
   sx = SIN(rx*PI/180)
   cox = COS(rx*PI/180)
   sy = SIN(ry*PI/180)
   coy = COS(ry*PI/180)

   FOR p=1 TO q
      x1=v(f(p,1)+1,1)
      y1=v(f(p,1)+1,2)
      z1=v(f(p,1)+1,3)
      x1=(z1*sy)+(x1*coy)
      z1=(z1*coy)-(x1*sy)
      y1=(y1*cox)-(z1*sx)
      z1=(z1*sx)+(z1*cox)

      x2=v(f(p,2)+1,1)
      y2=v(f(p,2)+1,2)
      z2=v(f(p,2)+1,3)
      x2=(z2*sy)+(x2*coy)
      z2=(z2*coy)-(x2*sy)
      y2=(y2*cox)-(z2*sx)
      z2=(z2*sx)+(z2*cox)

      x3=v(f(p,3)+1,1)
      y3=v(f(p,3)+1,2)
      z3=v(f(p,3)+1,3)
      x3=(z3*sy)+(x3*coy)
      z3=(z3*coy)-(x3*sy)
      y3=(y3*cox)-(z3*sx)
      z3=(z3*sx)+(z3*cox)

      dx1 = (fov*(x1-cx)/(z1-cz)) + 128
      dy1 = (fov*(y1-cy)/(z1-cz)) + 96
      dx2 = (fov*(x2-cx)/(z2-cz)) + 128 
      dy2 = (fov*(y2-cy)/(z2-cz)) + 96

      PLOT dx1, dy1: DRAW dx2 - dx1, dy2 - dy1

      dx1 = (fov*(x2-cx)/(z2-cz)) + 128
      dy1 = (fov*(y2-cy)/(z2-cz)) + 96
      dx2 = (fov*(x3-cx)/(z3-cz)) + 128 
      dy2 = (fov*(y3-cy)/(z3-cz)) + 96

      PLOT dx1, dy1: DRAW dx2 - dx1, dy2 - dy1

      dx1 = (fov*(x3-cx)/(z3-cz)) + 128
      dy1 = (fov*(y3-cy)/(z3-cz)) + 96
      dx2 = (fov*(x1-cx)/(z1-cz)) + 128 
      dy2 = (fov*(y1-cy)/(z1-cz)) + 96

      PLOT dx1, dy1: DRAW dx2 - dx1, dy2 - dy1
   NEXT p

   IF INKEY$ = "w" THEN 
      CLS
      cy = cy + 5*sx
      cz = cz + 5*coy
      cx = cx - 5*sy
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "a" THEN 
      CLS
      cz = cz - 5*sy
      cx = cx - 5*coy
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "s" THEN 
      CLS
      cy = cy - 5*sx
      cz = cz - 5*coy
      cx = cx + 5*sy
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "d" THEN 
      CLS
      cz = cz + 5*sy
      cx = cx + 5*coy
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "5" THEN 
      CLS
      ry = ry + 5
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "6" THEN 
      CLS
      rx = rx - 5
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "7" THEN 
      CLS
      rx = rx + 5
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   ELSEIF INKEY$ = "8" THEN 
      CLS
      ry = ry - 5
      PRINT "X: ", cx, "Y: ", cy, "Z: ", cz, "RX: ", rx, "RY: ", ry 
   END IF
WEND