Deploy to Vagrant
-----------------

Install [Vagrant](https://www.vagrantup.com/).

    git clone https://github.com/anuriq/parallels-fibonacci.git
    cd parallels-fibonacci
    vagrant up

Now, go to http://127.0.0.1:8888/api.

After you are done:

    vagrant destroy --force


Deploy to AWS EC2
-----------------

Install [Terraform](https://terraform.io/).

    git clone https://github.com/anuriq/parallels-fibonacci.git
    cd parallels-fibonacci
    terraform plan -var 'access_key=MY_ACCESS_KEY' -var 'secret_key=MY_SECRET_KEY'
    terraform apply -var 'access_key=MY_ACCESS_KEY' -var 'secret_key=MY_SECRET_KEY'

Now, go to address from the output, e.g. **service_endpoint = http://52.29.15.231/api**

After you are done:

    terraform destroy -var 'access_key=MY_ACCESS_KEY' -var 'secret_key=MY_SECRET_KEY'
