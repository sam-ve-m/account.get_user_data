fission spec init
fission env create --spec --name acc-data-get-env --image nexus.sigame.com.br/fission-account-data-get:0.1.0 --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name acc-data-get-fn --env acc-data-get-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name acc-data-get-rt --method GET --url /account/get_user_data --function acc-data-get-fn