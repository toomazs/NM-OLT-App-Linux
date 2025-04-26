#!/bin/bash
echo "🧹 Limpando build antigo..."
rm -rf out OLTApp.jar manifest.txt OLTApp.desktop
mkdir out

echo "🔍 Localizando fontes Java..."
find src/ -name "*.java" > sources.txt

echo "🔧 Compilando com JavaFX + dependências..."
javac --module-path lib/javafx-sdk-24/lib --add-modules javafx.controls,javafx.fxml -classpath "lib/javafx-sdk-24/lib/*:lib/jsch-0.1.55.jar:lib/openpdf-1.3.32.jar:lib/postgresql-42.7.5.jar" -d out/ @sources.txt

echo "🎨 Copiando recursos para build..."
cp -r resources/* out/

echo "📦 Empacotando JAR final..."
echo "Main-Class: Main" > manifest.txt
jar cfm OLTApp.jar manifest.txt -C out/ .

echo "📎 Instalando ícone e atalho..."
INSTALL_PATH="$(pwd)/"
sed "s|/CAMINHO/ABSOLUTO/|$INSTALL_PATH|g" modelo.desktop > OLTApp.desktop

mkdir -p ~/.local/share/icons
cp resources/oltapp-icon.png ~/.local/share/icons/oltapp.png

mkdir -p ~/.local/share/applications
cp OLTApp.desktop ~/.local/share/applications/
desktop-file-validate ~/.local/share/applications/OLTApp.desktop

echo '✅ Tudo pronto! Execute com ./run.sh ou via menu do sistema.'
