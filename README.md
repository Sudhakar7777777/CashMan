# A Sample Python REST Application
**********************************
-- uses flask
-- uses docker

Read tutorial:
https://auth0.com/blog/developing-restful-apis-with-python-and-flask/

Docker Commands to build and run and re-run:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker build -t cashman .
docker run --name cashman -d -p 5000:5000 cashman
docker logs cashman
docker stop cashman
docker rm cashman

#delete dangling unused stuff
docker image prune
docker container prune
docker network prune
docker volume prune

# delete all images
docker system prune -af

# forced manual options
#Delete stopped (exited) containers:
docker ps --no-trunc -aqf "status=exited" | xargs docker rm

#Delete unused (dangling) images:
$ docker images --no-trunc -aqf "dangling=true" | xargs docker rmi


Example Commands to interact with the App:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# start the application
./bootstrap.sh &

# get expenses
curl http://localhost:5000/expenses

# add a new expense
curl -X POST -H "Content-Type: application/json" -d '{
    "amount": 20,
    "description": "lottery ticket"
}' http://localhost:5000/expenses

# get incomes
curl http://localhost:5000/incomes

# add a new income
curl -X POST -H "Content-Type: application/json" -d '{
    "amount": 300.0,
    "description": "loan payment"
}' http://localhost:5000/incomes

Git Commands:
~~~~~~~~~~~~~
echo "# CashMan" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:Sudhakar7777777/CashMan.git
git push -u origin master
