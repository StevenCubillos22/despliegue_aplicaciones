#! /bin/bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
export AWS_DEFAULT_REGION=us-east-1

STACK_NAME="TomcatPrueba"
REGION=us-east-1
CLI_PROFILE=default

InstanceType=t2.micro

echo "Esto puede tardar unos minutos, espere por favor..";

aws cloudformation deploy \
	--region us-east-1 \
	--profile default \
	--stack-name "TomcatPrueba" \
	--template-file ubuntu.yml \
	--no-fail-on-empty-changeset \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameter-override EC2InstanceType=$EC2_INSTANCE_TYPE


# Verifica el despliegue  si fue un éxito a la hora de ejecutarlo
if [ $? -eq 0 ]; then
    # Obtener la URL de la instancia exportada
    INSTANCE_ENDPOINT=$(aws cloudformation list-exports \
        --profile $CLI_PROFILE \
        --query "Exports[?Name=='InstanceEndpoint'].Value" \
        --output text)

    # Imprimir la URL
    echo "La URL de la instancia es: $INSTANCE_ENDPOINT"

    # Exportar la variable para que esté disponible para YAML
    export EC2Instance=$INSTANCE_ENDPOINT
fi