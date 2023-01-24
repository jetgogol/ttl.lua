## Synopsis
```
ttl [languageA] [languageB]
cat file1| ttl en fr > file2
```
By default languageA and languageB is en.

## Commands
To use command prefix your input with ':' or '/'.

#### Change from to languages

```
:from-to languageA languageB
:ft languageA languageB
```

#### Swap selected languages
```
:swap
:s
```

#### Clip last output
```
:clip
:c
```

#### Quit from program
```
:quit
:q
```

## Dependencys
lua-sockets for lua 5.4.4
