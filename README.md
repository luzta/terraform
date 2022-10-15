# Terraform, Introducción a Infrastructure as Code
Este proyecto muestra un terraform basico para iniciar terraform con AWS. 

01_basic
Contiene un ejemplo basico de como usar teraform para crear una VPC. 

02_modules
Contiene un ejemplo para usar dos módulos:
   - VPC, que crea recursos como VPC, IG, RouteTable, Subnets
   - EC2-NGINX, que crea instancias ec2 para nginx con los security groups respectivos. 


# Requisitos para este taller: 
Terraform: Puede descargar los binarios desde aquí: https://www.terraform.io/downloads
AWS-CLI: Instalar de acuerdo al sistema operativo desde aquí: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Opcionales: 
Cuenta de AWS: Puede crear su cuenta aquí: https://aws.amazon.com/free/
Instlar git desde aquí: https://git-scm.com/downloads
Visual Code: Este editor es opcional, y puede obtenerlo desde aquí: https://code.visualstudio.com/docs/setup/setup-overview

# Recursos:
Cuenta AWS: https://594232739121.signin.aws.amazon.com/console
 la asignación de credenciales y otros parámetros se darán en sala.
Terraform Provider AWS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
GRAPHVIZ Online: https://dreampuf.github.io/GraphvizOnline/
Usar las ami por region:
   us-east-1: ami-04ca1c16432746673
   us-east-2: ami-017b7692ccf189880
   us-west-1: ami-0075ea75ff0c22b6b
   us-west-2: ami-04b315babb27d328e
   sa-east-1: ami-0f12bf0dc725d0879
   eu-central-1: ami-07f2dd2967131f56c
