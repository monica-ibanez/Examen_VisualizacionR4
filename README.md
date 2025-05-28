# Examen_VisualizacionR4
Este reposiotorio contiene por una parte un archivo PDF llamado "Enunciado Examen" en el que se encuetra una decripcion clara de que se pide en cada ejercicio. El examen consta de 3 ejecicios, el primero que pide replicar la aplicacion en shiny actualizandose automaticamente los filtros cada vez que se realice alguna modificacion. El segundo ejercio pide añadir un boton al la aplicacion del primer ejercio para que se actualice solo una vez se haya presinado el boton. El tercer apartado pide crear una nueva App en shiny, en la que se valorara: el uso de filtros de diferente tipo a los de los primeros ejercicios, la navegación a través de páginas y pestañas, la inclusión de botones, el buen uso de la reactivity, la originalidad y complejidad de los gráficos y la inclusión de elementos extra.

Ademas de la descripcion de los ejercicios tambien se añade una breve explicacion de los datos con los que vamos a estar trabajando que se encuentran en el aarchivo CSV llamado ds_salaries_def.csv. Este tiene 3755 registros de salarios de diferentes campos en el ámbito de la ciencia de datos. Cuenta con diversas columnas de datos, pero para realizar el examen sólo utilizaremos 
algunas de ellas: 
- work_year: Año en el que se pagó el salario. Opciones: 2020, 2021, 2022, 2023. 
- experience_level: Nivel de experiencia. Opciones: EN, EX, MI, SE. 
- employment_type: Tipo de empleo realizado. Opciones: FT, PT, FL, CT 
- remote_ratio: Ratio correspondiente al trabajo realizado a distancia. Es una variable numérica, pero realmente solo tiene 3 opciones: 0, 50 y 100. 
- salary_in_usd: Salario, en USD (variable numérica).  
- company_size: Tamaño de la empresa. Opciones: S, M, L.

En la carpeta scripts se encuetran los scripts de los ejercicios divididos como se pide en el enunciado: el ejercicio 1 se llama Monica_Ibañez_Parte1, el ejercicio 2 se llama Monica_Ibañez_Parte2 y el ejercicio 3 se llama Monica_Ibañez_Parte3.

Paea poder cargar bien los archivos abrir siempre a traves del proyecto. De esta forma evitaremos errores con las rutas de los archivos.
