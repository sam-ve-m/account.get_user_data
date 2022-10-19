#!/bin/bash
fission spec init
fission env create --spec --name get-user-data-env --image nexus.sigame.com.br/fission-async:0.1.6 --builder nexus.sigame.com.br/fission-builder-3.8:0.0.1
fission fn create --spec --name get-user-data-fn --env get-user-data-env --src "./func/*" --entrypoint main.get_user_data --executortype newdeploy --maxscale 1
fission route create --spec --name get-user-data-rt --method GET --url /account/get_user_data --function get-user-data-fn
