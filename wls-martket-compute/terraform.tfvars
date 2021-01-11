# Tenant 
tenancy_ocid 					 = "ocid1.tenancy.oc1..aaaaaaaahvlcab5mofksdbrbfy2dvrtpxxi3n2tova2bqspacdd47cup3pma"

# Compartment
compartment_ocid 				 = "ocid1.compartment.oc1..aaaaaaaavln73gxuejbp2te5z4ucxpqpexqf76yqskccfxulfvvnvjcdlj7q"

# Region
region 							 = "eu-frankfurt-1"

# WLS Configurations
wls_admin_password_ocid 		 = "ocid1.vaultsecret.oc1.eu-frankfurt-1.amaaaaaaaspodvqajfrprtsv7y3pyddmofr3a25a73imykiebjvbyj5iub5q"
use_advanced_wls_instance_config = "false"
wls_existing_vcn_id 			 = "ocid1.vcn.oc1.eu-frankfurt-1.amaaaaaaaspodvqao3b4z6unbar5ysiedzqgaest5j4lzrm3ykno6o2l62ga"
wls_subnet_id 					 = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaaiszn4whta64zdmt2sbslxar6pxxh5sjmsvhsbnc7ziifxwieipcq"

# VCN Configurations
vcn_strategy 					 = "Use Existing VCN"
subnet_type 					 = "Use Private Subnet"
network_compartment_id 			 = "ocid1.compartment.oc1..aaaaaaaastuxhal75e7oubuqxmb75zthbfeijwr3ffuvirlwab2rv7q6m75q"
subnet_strategy_existing_vcn 	 = "Use Existing Subnet"

add_load_balancer 				 = "false"

create_policies 				 = "false"
add_JRF 						 = "true"
configure_app_db 				 = "false"
defined_tag 					 = ""
defined_tag_value 				 = ""
tag_0_key                    	 = "DelaCost.CostResource"
tag_0_key_value                  = "deladmsitgen"
tag_1_key                 		 = "DelaCost.Environment"
tag_1_key_value              	 = "DMSIT"
tag_2_key           			 = "Schedule.WeekDay"
tag_2_key_value        			 = "0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0"
tag_3_key           			 = "Schedule.Weekend"
tag_3_key_value        			 = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
tag_4_key           			 = "prueba"
tag_4_key_value        			 = "prueba"

free_form_tag                    = ""
free_form_tag_value              = ""


# Compute Configurations
service_name 					 = "deladmsitgen"
instance_shape 					 = "VM.Standard2.1"
ssh_public_key 					 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnktaWSAQ9A9fHsphbeDCX0cA3/Ebm7b+ThuOi2Osm1T6N28LuFzLE8RMErmxUyJ6kiLjtnvH7kr0X9zc10HcAH20nTBdOxBjzyxc0tf/ommNIc/P4rCeELnW3hQFUfhNCQnOn4JxYa0xUntmqLVS/yMCs496oLtbDCxGlWNT8jEKHVYRBBypCo+4HhwsWuld9r/jaZyWlY1VW31FkYblMRAbqFotMlD7nel+Z+V1RkrafXo+lYiHl+u3/0WGf44Bq57JQhcJI1bBp4CJBpk7jTFtnOsJ1i66fHPZpME1PmeCBPRo6zYJpnQ3a4JRgMoGNEirsfkpLs17+KExJcJxP opc@bastion-dela"

is_bastion_instance_required 	 = "false"

# DB Configurations
ocidb_compartment_id 			 = "ocid1.compartment.oc1..aaaaaaaavln73gxuejbp2te5z4ucxpqpexqf76yqskccfxulfvvnvjcdlj7q"
ocidb_network_compartment_id 	 = "ocid1.compartment.oc1..aaaaaaaastuxhal75e7oubuqxmb75zthbfeijwr3ffuvirlwab2rv7q6m75q"
ocidb_existing_vcn_id 			 = "ocid1.vcn.oc1.eu-frankfurt-1.amaaaaaaaspodvqao3b4z6unbar5ysiedzqgaest5j4lzrm3ykno6o2l62ga"

# DB System
ocidb_dbsystem_id 				 = "ocid1.dbsystem.oc1.eu-frankfurt-1.abtheljtuwkvnay3xs6wxkerpb5p3dt4nh6j6qnyyfyhbpkqmsiyllnyrjfa"

# DB Home
ocidb_dbhome_id 				 = "ocid1.dbhome.oc1.eu-frankfurt-1.abtheljt3sd43ejuv3si6vzb2siyxxqk2rx7ni4dtcu75wr3uodyktxshh4q"

# Database
ocidb_database_id 				 = "ocid1.database.oc1.eu-frankfurt-1.abtheljtry3goopyafaazzjgd66urk7rt7zeu3lqqbgmzngxfhfla4tmrelq"
ocidb_pdb_service_name 			 = "RESPDB"

# DB Access
oci_db_user 					 = "SYS"
db_strategy 					 = "Database System"
oci_db_password_ocid 			 = "ocid1.vaultsecret.oc1.eu-frankfurt-1.amaaaaaaaspodvqa5q6g2b3ydfvtwgmigmsz2jssjwwnh557r5cgpqj4gpza"