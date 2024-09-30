--  1.1 relaciones validas
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas relaciones = not ((contieneRepetidos relaciones) || (contieneIguales relaciones))

obtenerSize :: [(String, String)] -> Int
obtenerSize [] = 0
obtenerSize relaciones = 1 + obtenerSize (tail relaciones)

contieneIguales :: [(String, String)] -> Bool
contieneIguales [] = False
contieneIguales (relActual:relaciones) = (fst relActual == snd relActual) || contieneIguales relaciones

contieneRepetidos :: [(String, String)] -> Bool
contieneRepetidos relaciones = obtenerSize (eliminarRepetidos relaciones) /= (obtenerSize relaciones)

relacionesIguales :: (String, String) -> (String, String) -> Bool 
relacionesIguales (person1, person2) (person3, person4) = (person1 == person3 && person2 == person4) || (person1 == person4 && person2 == person3)

sacarTodos :: (String, String) -> [(String, String)] -> [(String, String)]
sacarTodos _ [] = []
sacarTodos relacionASacar (relacionActual:relaciones) | (relacionesIguales relacionASacar relacionActual) = (sacarTodos relacionASacar relaciones)
                                                      | otherwise = relacionActual : (sacarTodos relacionASacar relaciones)

eliminarRepetidos :: [(String, String)] -> [(String, String)]
eliminarRepetidos [] = []
eliminarRepetidos (relacionActual:relaciones) = relacionActual : eliminarRepetidos (sacarTodos relacionActual relaciones)

-- 1.2 personas

sacarPersona :: String -> [String] -> [String]
sacarPersona _ [] = []
sacarPersona persona (personaActual:personas) | persona == personaActual = sacarPersona persona personas
                                              | otherwise = personaActual : (sacarPersona persona personas)

eliminarPersonasRepetidas :: [String] -> [String]
eliminarPersonasRepetidas [] = []
eliminarPersonasRepetidas (persona:personas) = persona : eliminarPersonasRepetidas (sacarPersona persona personas)

personas :: [(String, String)] -> [String]
personas relaciones = eliminarPersonasRepetidas (personasConRepetidos relaciones)

personasConRepetidos :: [(String, String)] -> [String] 
personasConRepetidos [] = []
personasConRepetidos ((persona1, persona2):relaciones) = persona1 : persona2 : (personasConRepetidos relaciones)

-- 1.3 amigosDe

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((persona1, persona2): relaciones) | persona == persona1 = persona2 : (amigosDe persona relaciones)
                                                    | persona == persona2 = persona1 : (amigosDe persona relaciones)
                                                    | otherwise = amigosDe persona relaciones

-- 1.4 personaConMasAmigos

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos relaciones = fst (conMasAmigos (obtenerNumeroAmigosPorPersona (personas relaciones) relaciones))

size :: [a] -> Int
size [] = 0
size lista = 1 + size (tail lista)

conMasAmigos :: [(String, Int)] -> (String, Int)
conMasAmigos [ultimaPersonaAmigos] = ultimaPersonaAmigos
conMasAmigos ((persona, cantidadAmigos) : personas) | cantidadAmigos > snd (conMasAmigos personas) = (persona, cantidadAmigos)
                                                    | otherwise = conMasAmigos personas

obtenerNumeroAmigosPorPersona :: [String] -> [(String, String)] -> [(String, Int)]
obtenerNumeroAmigosPorPersona [] _ = []
obtenerNumeroAmigosPorPersona (personaActual:personas) relaciones = (personaActual, size (amigosDe personaActual relaciones)) : (obtenerNumeroAmigosPorPersona personas relaciones)
