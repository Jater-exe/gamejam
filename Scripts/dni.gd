func generar_codigo() -> String:
	randomize()

	# Número random de 8 dígitos
	var numero = randi_range(10000000, 99999999)

	# Letra random (A-Z)
	var letra = char(randi_range(65, 90))

	return str(numero) + letra


func guardar_en_archivo():
	var codigo = generar_codigo()

	var file = FileAccess.open("user://codigo.txt", FileAccess.WRITE)
	file.store_string(codigo)
	file.close()

	print("Código generado:", codigo)
