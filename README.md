S3FS-Fuse Compilation
===================

This creates a nice and tidy package of [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse) for easy installation and updating.

This repo contains script to be able to automatically generate Debian packages with appropriate dependencies.

**Please note this is still a *Work In Progress*. Generated packages may or may not work. YMMV & contributions are welcome!**

Usage
-------------

 1. Copy `vars.sh.dist` to `vars.sh` (`cp vars.sh.dist vars.sh`)
 2. Fill in the variables in `vars.sh`
 3. Prepare the system for building: `./prepare.sh`
 4. Compile all packages: `./compile.sh`

The `packages` folder will contain all the DEB files required to install s3fs-fuse and its dependencies. The nicest way is to add it to your own APT Mirror.

If you'd like to set one up I can highly recommend [Freight](https://github.com/rcrowley/freight) to setup and manage your own repo.

Good luck!
