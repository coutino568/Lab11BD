import psycopg2

MENU= "-Presione 1 para usar la funcion 1 \n-Presione 2 para usar la funcion 2 \n-Presione 3 para usar la funcion 3 \n-Presione 4 para usar la funcion 4 \n-Presione 5 para ver productos \n-Presione 6 para salir \n"
menuopcion="null"
#coneccion a BD, en mi caso labcomputadoras
con = psycopg2.connect(
    host="localhost",
    database="labComputadoras",
    user="postgres",
    password="postgres")
#


def funcion1() :
	cur = con.cursor()
	ram= input("Cuanta ram busca mirey?")
	speed = input ("Cuanta velocidad busca mirey?")
	cur.execute("select search1("+ram+","+speed+")")
	rows = cur.fetchall()
	if (len(rows) > 0 ) :
		print ( "Estas tenemos : \n")
		for r in rows:
			print(f"{r[0]}")
	else :
		print ("No tenemos mirey")
	print("\n")
	cur.close()
                    
        
def funcion2 ():
	cur = con.cursor()
	idmodel= input("Cual es el id del modelo que vamos a borrar?")
	cur.execute("select * from producto where idmodelo="+idmodel)
	rows = cur.fetchall()
	if (len(rows)>0):
		print("Ahorita lo borramos...")
		cur.execute("call delete1("+idmodel+")")

	else :
		print("Ese modelo no existe")
		



def funcion3 ():
	print("Ejecutando funcion " + menuopcion +" ... \n")


def funcion4 ():
	print("Ejecutando funcion " + menuopcion +" ... \n")


def funcion5():
	cur = con.cursor()
	print (" TABLA PRODUCTOS : \n")
	cur.execute("select * from producto")
	rows = cur.fetchall()
	for r in rows:
		print(r)
	print (" TABLA PC : \n")
	cur.execute("select * from pc")
	rows = cur.fetchall()
	for r in rows:
		print(r)
	cur.close()







while menuopcion != "6" :
    if menuopcion == "1":
    	funcion1()
    if menuopcion == "2" :
        funcion2()

    if menuopcion == "3" :
        funcion3()

    if menuopcion == "4" :
        funcion4()
    if menuopcion == "5" :
        funcion5()

    menuopcion = input (MENU)
print ("ADIOS")

con.close()
print(menuopcion)


