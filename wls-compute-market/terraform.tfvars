# Tenant 
tenancy_ocid = "ocid1.tenancy.oc1.."

# Compartment
compartment_ocid = "ocid1.compartment.oc1.."

# Region
region = "eu-frankfurt-1"

# Availability Domains number default = 1
ad_number = 1

# VCN Configurations
vcn_strategy = "Use Existing VCN"
subnet_type = "Use Private Subnet"
network_compartment_id = "ocid1.compartment.oc1.."
subnet_strategy_existing_vcn = "Use Existing Subnet"

# HA Configuration
add_load_balancer = "false"

# Vault & Secrets Configuration
create_policies = "false"

# Defined & Free Tags
defined_tag = ""
defined_tag_value = ""
tag_0_key = "DelaCost.CostResource"
tag_0_key_value = "<instance_name_lowercase>"
tag_1_key = "DelaCost.Environment"
tag_1_key_value = "<Environment_name_uppercase>"
tag_2_key = "Schedule.WeekDay"
tag_2_key_value = "<schedule_value_required>"
tag_3_key = "Schedule.Weekend"
tag_3_key_value = "<schedule_value_required>"


free_form_tag = ""
free_form_tag_value = ""

# WLS Configurations
wls_admin_password_ocid = "ocid1.vaultsecret.oc1."
use_advanced_wls_instance_config = "false"
wls_existing_vcn_id = "ocid1.vcn.oc1."
wls_subnet_id = "ocid1.subnet.oc1."
wls_node_count = 1
add_JRF = "true"
configure_app_db = "false"

# Compute Configurations
service_name = "<instance_name_lowercase>"
instance_shape = "VM.Standard2.1"
# Compute instances private ip address
instance_1_private_ip = ""
instance_2_private_ip = ""
instance_3_private_ip = ""
instance_4_private_ip = ""

ssh_public_key = "<bastion_opc_ssh_public_key"

is_bastion_instance_required = "false"

# DB Configurations
ocidb_compartment_id = "ocid1.compartment.oc1.."
ocidb_network_compartment_id = "ocid1.compartment.oc1.."
ocidb_existing_vcn_id = "ocid1.vcn.oc1."

# DB System
ocidb_dbsystem_id = "ocid1.dbsystem.oc1."

# DB Home
ocidb_dbhome_id = "ocid1.dbhome.oc1."

# Database
ocidb_database_id = "ocid1.database.oc1."
ocidb_pdb_service_name = "RESPDB"

# DB Access
oci_db_user = "SYS"
db_strategy = "Database System"
oci_db_password_ocid = "ocid1.vaultsecret.oc1."