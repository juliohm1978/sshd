# sshd

A simple sshd daemon inside a Docker container.

## IMPORTANT!

This Docker image is intended for development and testing purporses. **IT IS NEITHER SAFE NOR MEANT FOR PRODUCTION** or any critical environment. Debug flags are enabled by default, so the output should be extensively verbose.

## A few notes

In order to persist ssh server keys between executions of the same container, the `/etc/ssh` directory saved to a local volume. This volume, however, cannot be created before hand, during `docker build`. So, in order populate its contents at runtime, the installation of the `openssh-server` package is executed in the Docker entrypoint. This, of course, is not very efficient, but rememer **the IMPORTANT notice just mentioned above**.

## Login

Standard user created and pre-configured:

    Login   : user
    Password: user

    Login   : root
    Password: root

## Usage

Build your local image running:

    make

Start a container called `sshd` with:

    make start

Stop the container:

    make stop

After stopping, the container will persist data from `/etc/ssh` in a local volume. Upon restart, it should still use the same server keys.

In order to reset ssh server keys, simply remove the container and recreate it using:

    make rm start
