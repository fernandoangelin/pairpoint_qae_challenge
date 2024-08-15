# pairpoint_qae_challenge
This repository contains a test automation suite for https://reqres.in/api API for /users endpoint.

## How to setup the project
In order to set up this project, one must have python installed (e.g. 3.12) and install the libraries from the requirements.txt with the following command:

```shell
pip install -r requirements.txt
```

## How to run the tests

To run the tests in this project, one must run the following command:

```shell
robot -i all-tests tests
```

Where the -i includes all the tests with the tag all_tests inside tests folder.