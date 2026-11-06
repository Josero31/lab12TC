# Laboratorio 12 — Teoría de la Computación

Programación funcional y funciones lambda en **Haskell**.

## 🎥 Video de ejecución

[Link](https://uvggt-my.sharepoint.com/:f:/r/personal/san231221_uvg_edu_gt/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fsan231221%5Fuvg%5Fedu%5Fgt%2FDocuments%2Fvideo%20lab12&share=cgqW%2D46DqnFCSbMCOl1KIDljEgUCPhMiQivUAsU%2D5c%2DjmjczPg)

## Estructura

```
lab12/
├── README.md
├── src/
│   ├── Main.hs        # corre todos los problemas (o uno en específico)
│   ├── Problema2.hs   # ordenar lista de diccionarios por key
│   ├── Problema3.hs   # matriz transpuesta
│   └── Problema4.hs   # eliminar elementos de una lista
└── ejercicio_1.pdf
```

## Requisitos

GHC (Glasgow Haskell Compiler). Se probó con GHC 9.10.3.

**Windows** — instalar con [GHCup](https://www.haskell.org/ghcup/) desde PowerShell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true
```

Luego abrir una terminal nueva y verificar con `ghc --version`.

**Linux (Debian/Ubuntu)** — `sudo apt install ghc`, o también con GHCup.

## Ejecución

```bash
cd src
runghc Main.hs        # corre los problemas 2, 3 y 4
```

Para correr cada problema por separado, pasar su número como argumento:

```bash
cd src
runghc Main.hs 2      # solo el problema 2 (ordenar lista de diccionarios)
runghc Main.hs 3      # solo el problema 3 (matriz transpuesta)
runghc Main.hs 4      # solo el problema 4 (eliminar elementos de una lista)
```

O compilado:

```bash
cd src
ghc Main.hs -o lab12
./lab12               # en Windows: .\lab12.exe
```

## Soluciones

| Problema | Idea | Lambda clave |
|---|---|---|
| 2 | `sortBy` con un comparador que busca el key en cada diccionario (`Data.Map`) | `\a b -> compare (M.lookup key a) (M.lookup key b)` |
| 3 | `foldr` que pega cada fila como columnas con `zipWith (:)` | `\fila acc -> zipWith (:) fila acc` |
| 4 | `filter` que conserva lo que no está en la lista a borrar (los que no existen se ignoran solos) | `\x -> not (x `elem` borrar)` |

### Salida esperada

```
Ordenada por key = 'model':
  {'make': 'Mi Max', 'model': 2, 'color': 'Gold'}
  {'make': 'Samsung', 'model': 7, 'color': 'Blue'}
  {'make': 'Nokia', 'model': 216, 'color': 'Black'}

X^T =
  1 4 7
  2 5 8
  3 6 9

Resultado: ["rojo","verde","azul","gris","negro