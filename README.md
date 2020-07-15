# PandoraDocker

This is the repository of the Docker container used for Pandora's Travis CI.

## ROOT tarball

The PandoraMonitoring and LArReco builds depend upon a binary of ROOT built against C++17.

In the event that you have to rebuild the docker container, please note that the Dockerfile
references a tarball containing a suitable ROOT build. This file cannot be stored in the github
repository, but can be found within the /storage/dune/docker folder on Warwick CSC.

This file should be copied to the folder containing Dockerfile in order to rebuild the container.

## ROOT source build

The tarball noted above was built within an equivalent docker container without the ROOT tarball
using the following commands
```
cd /
git clone https://github.com/root-project/root.git
cd root
git checkout -b v6-18-04 v6-18-04
mkdir obj
cd obj
cmake -DCMAKE_INSTALL_PREFIX=/pandora/root -DCMAKE_CXX_STANDARD=17 \
   -Dgminimal=ON -Dbuiltin_glew=ON -Dbuiltin_ftgl=ON \
   -Dopengl=ON -Dbuiltin_gl2ps=ON ..
make -j2 install
cd /pandora
tar czf root6-18-04.tar.gz root
```

To extract the tarball from the docker instance, in a separate terminal run
```
docker ps
```

This will tell you the docker process ID for the container in which you created the tarball,
which you can then use to extract the tarball via
```
docker cp <ps_id>:/pandora/root6-18-04.tar.gz .
```

## Rebuilding and uploading the container
The docker container can be built using the following command
```
docker build -t pandorapfa .
```

To push the container to Docker

```
docker login
docker tag pandorapfa pandorapfa/pandorapfa_c17
docker push pandorapfa/pandorapfa_c17
```
