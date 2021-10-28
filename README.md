# Simple CMake project

Basic CMake project with 2 installable libraries and one executable target depending on libraries. 

## Build

```shell
./build.sh 
```

Each library will be build in `libraryDir/build` and the same for the app project. 

You can also build libraries wherever you'd like and also use `-DENABLE_TESTING=ON` to build them with tests and use ctest to run tests.

## Clean
```shell
./build.sh clean
```
