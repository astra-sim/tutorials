cd astra-sim
git checkout .
git clean -xdf .
cd ..

cp -r exercise_0/examples/ astra-sim/
cp -r exercise_0/inputs/ astra-sim/
cd astra-sim
./build/astra_analytical/build.sh -c
