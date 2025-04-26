#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

java --enable-native-access=ALL-UNNAMED \
--module-path "$DIR/lib/javafx-sdk-24/lib" \
--add-modules javafx.controls,javafx.fxml \
-Djava.library.path="$DIR/lib/javafx-sdk-24/bin" \
-cp "$DIR/OLTApp.jar:$DIR/lib/*" Main
