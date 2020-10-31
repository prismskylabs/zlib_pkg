# zlib_pkg
Set of files to build Conan package of ZLIB

Based on 
https://github.com/conan-io/conan-center-index/tree/master/recipes/zlib/1.2.11

Customized slightly for use of other toolchains in our environment.
This project leverages extra scripts used via submodule at src/external path.
These scripts contain most of code that is needed in order to.
1. Create Vagrant VM for build
2. Provision build environment
3. Perform build of conan package
4. Upload package to Conan remote.

This package is made open source and it is buildable as open source for
linux-amd64 platform.

Internally, we also build this package using closed source toolchains for platforms
other than linux-amd64

Since we can not open toolchains, this project has option to refer to our 
privately held conan packages that contain scripts to provision toolchains
and related build profiles.

Also, all build results are uploaded to our own conan repo.

If you want to use this source code for your own use, you need to have
your own conan server. Basically, you will need to modify the code in your
own fork/copy of this repo and submodule repos.


# Create Vagrant VM
Install Vagrant and VirtualBox.
https://www.vagrantup.com/docs/installation

Create Linux VM for building the project.

    cd <repo_root>/vagrant/build
    vagrant up
    
This will create virtual machine.
Run

    vagrant ssh

in order to login into created virtual machine.

# Provision build environment
Before provisioning environment, we need to set target platform.
It is set as env variable:

    export PKG_PLATFORM=linux-amd64

linux-amd64 is platform that will work in open source mode and will not require
any private dependencies.
Other possible platforms are possible and they are mostly private.
For other platforms see edge_build_base project.
Further provisioning is done as:

    cd <repo_root>/src/scripts
    ./provision.sh

# Building package
Building package is as strightforward as:

    cd <repor_root>
    ./build.sh

#Upload package
Uploading package is as strightforward as:

    cd <repor_root>
    ./upload.sh

For upload to work you need to have a login with our internal conan server.
If you need to upload to your own server, you need to modify scripts to point
to your server.

# Automatic build.

This project has automatic build in TravisCI.
Configuration for build can be found in 
.travis.yml file in the root of the repo.







