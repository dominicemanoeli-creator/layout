@echo off

:: Remove minhaas credenciais do GitHub que estiverem armazenadas no Windows Credential Manager do PC
cmdkey /delete:git:https://github.com
echo 0 de 6: CREDENCIAIS DO GITHUB REMOVIDAS

:: Remover url se houver
git remote remove origin
echo 1 de 6: REMOVIDO REMOTE

:: Iniciar git no diretório
git init
echo 2 de 6: FEITO INIT

:: Configurações globais do Git
git config --global user.name "::::::::::::::: EMAIL :::::::::::::::"
git config --global user.email "::::::::::::::: USERNAME :::::::::::::::"
echo 3 de 6: CONFIGURADO GLOBAL

:: Adiciona o repositório remoto (só executa se já não estiver adicionado)
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin "::::::::::::::: URL :::::::::::::::"
    echo 4 de 6: ADICIONADO REMOTE
)

:: Exibe todos os arquivos e pastas, incluindo ocultos
echo.
echo 5 de 6: LISTANDO TODOS OS ARQUIVOS INCLUINDO OS OCULTOS
dir /a

:: Recebendo arquivos que estão remotos
echo 6 de 6: PUXANDO DO REMOTO
git pull origin main
git checkout -b main

:: Mensagem final
echo.
echo Configuracoes do Git foram aplicadas com sucesso!
pause

:: Comando para excluir o próprio script
start "" cmd /c del "%~f0"
