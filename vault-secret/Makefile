apply:
	git pull
	terraform init
	terraform apply -auto-approve -var token=$(token)

destroy:
	git pull
	terraform init
	terraform destroy -auto-approve -var token=$(token)