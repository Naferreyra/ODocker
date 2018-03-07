#!/bin/sh

sudo docker network create my-net2
sudo docker create --name flask --network my-net2 --publish 5000:5000 --entrypoint "bin/start_flask_app.sh" odoo:testVNet
bin/start_openerp -d visiotech_real --update flask_middleware_connector