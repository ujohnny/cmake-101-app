#!/bin/bash -xe

declare ROOT_DIR="$(pwd)"
declare BUILD_POSTFIX="build"
declare INSTALL_DIR="$ROOT_DIR/install"

function get_build_dir {
    declare PROJECT_DIR="$1"
    echo "$PROJECT_DIR/$BUILD_POSTFIX"
}

function build_library {
    declare LIBRARY_DIR="$1"
    declare BUILD_DIR="$(get_build_dir "$LIBRARY_DIR")"
    mkdir -p "$BUILD_DIR"
    cd "$BUILD_DIR"
    cmake "$LIBRARY_DIR" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"
    cmake --build .
    cmake --install .
}

declare HELLO_LIB="$ROOT_DIR/hellolib"
declare WORLD_LIB="$ROOT_DIR/worldlib"
declare APP_DIR="$ROOT_DIR/hello-world-app"

if test "$1" = "clean"
then
  rm -rf "$INSTALL_DIR"
  rm -rf "$(get_build_dir "$HELLO_LIB")"
  rm -rf "$(get_build_dir "$WORLD_LIB")"
  rm -rf "$(get_build_dir "$APP_DIR")"
  exit 0
fi

build_library "$HELLO_LIB"
build_library "$WORLD_LIB"

# build app

declare PROJECT_BUILD_DIR="$(get_build_dir "$APP_DIR")"
mkdir -p "$PROJECT_BUILD_DIR"
cd "$PROJECT_BUILD_DIR"
cmake "$APP_DIR" -DCMAKE_PREFIX_PATH="$INSTALL_DIR/lib/cmake"
cmake --build .

cat << EOF
Sample project is built in $PROJECT_BUILD_DIR
Run the following command to view the result

  (cd $PROJECT_BUILD_DIR && ./src/hello-world-app)
EOF
