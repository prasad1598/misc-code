ansible:
	ansible-playbook -i ${tool_name}-dev.prasaddevops.shop -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=${tool_name}


apply:
	git pull
	terraform init
	terraform apply -auto-approve

destroy:
	git pull
	terraform init
	terraform apply -auto-approve