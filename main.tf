module "dms_module" {
  source = "././Module"

  #Create a replication subnet group
  replica_subnet_group_description = "subnet_group"
  replica_subnet_group_id          = "subnet_group_id"
  replica_subnet_ids = [
    "subnet-12345678",
  ]

  #Create a dms instance 
  instance_allocated_storage           = 72
  instance_apply_immediately           = true
  instance_allow_major_version_upgarde = true
  instance_auto_minor_version_upgrade  = true
  instance_engine_version              = "3.4.5"
  instance_multi_az                    = true
  instance_publicly_accessible         = false
  instance_replication_instance_class  = "dms.t3.large"
  instance_replication_instance_id     = "kiran"
  instance_vpc_security_group_ids      = ["sg-12345678"]

  #create endpoints
  endpoints = {
    source = {
      database_name               = "kiran"
      endpoint_id                 = "kiran-source"
      endpoint_type               = "source"
      engine_name                 = "aurora-postgresql"
      extra_connection_attributes = "heartbeatFrequency=1;"
      username                    = "postgresqlUser"
      password                    = "youShouldPickABetterPassword123!"
      port                        = 5432
      server_name                 = "dms-ex-src.cluster-abcdefghijkl.us-east-1.rds.amazonaws.com"
      ssl_mode                    = "none"
      tags                        = { EndpointType = "source" }
    }

    destination = {
      database_name = "kiran"
      endpoint_id   = "kiran-destination"
      endpoint_type = "target"
      engine_name   = "aurora"
      username      = "mysqlUser"
      password      = "passwordsDoNotNeedToMatch789?"
      port          = 3306
      server_name   = "dms-ex-dest.cluster-abcdefghijkl.us-east-1.rds.amazonaws.com"
      ssl_mode      = "none"
      tags          = { EndpointType = "destination" }
    }
  }

  #Create Replication Task
  replication_tasks = {
    cdc_ex = {
      replication_task_id       = "example-cdc"
      migration_type            = "cdc"
      replication_task_settings = file("task_settings.json")
      table_mappings            = file("table_mappings.json")
      source_endpoint_key       = "source"
      target_endpoint_key       = "destination"
      tags                      = { Task = "PostgreSQL-to-MySQL" }
    }
  }



}