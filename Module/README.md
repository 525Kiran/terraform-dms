## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dms_endpoint.kiran](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint) | resource |
| [aws_dms_replication_instance.kiran](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance) | resource |
| [aws_dms_replication_subnet_group.kiran](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_subnet_group) | resource |
| [aws_dms_replication_task.kiran](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_task) | resource |
| [aws_iam_role.dms-access-for-endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.dms-cloudwatch-logs-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.dms-vpc-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.dms-access-for-endpoint-AmazonDMSRedshiftS3Role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.dms-cloudwatch-logs-role-AmazonDMSCloudWatchLogsRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.dms-vpc-role-AmazonDMSVPCManagementRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.dms_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Determines whether resources will be created | `bool` | `true` | no |
| <a name="input_endpoints"></a> [endpoints](#input\_endpoints) | Map of objects that define the endpoints to be created | `any` | `{}` | no |
| <a name="input_instance_allocated_storage"></a> [instance\_allocated\_storage](#input\_instance\_allocated\_storage) | The amount of storage (in gigabytes) to be initially allocated for the replication instance. Min: 5, Max: 6144, Default: 50 | `number` | `null` | no |
| <a name="input_instance_allow_major_version_upgarde"></a> [instance\_allow\_major\_version\_upgarde](#input\_instance\_allow\_major\_version\_upgarde) | Indicates that major version upgrades are allowed. | `bool` | `null` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource. | `bool` | `null` | no |
| <a name="input_instance_auto_minor_version_upgrade"></a> [instance\_auto\_minor\_version\_upgrade](#input\_instance\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window. | `bool` | `null` | no |
| <a name="input_instance_availability_zone"></a> [instance\_availability\_zone](#input\_instance\_availability\_zone) | The EC2 Availability Zone that the replication instance will be created in. | `string` | `null` | no |
| <a name="input_instance_engine_version"></a> [instance\_engine\_version](#input\_instance\_engine\_version) | The engine version number of the replication instance. | `string` | `null` | no |
| <a name="input_instance_kms_key_arn"></a> [instance\_kms\_key\_arn](#input\_instance\_kms\_key\_arn) | The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms\_key\_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region. | `string` | `null` | no |
| <a name="input_instance_multi_az"></a> [instance\_multi\_az](#input\_instance\_multi\_az) | Specifies if the replication instance is a multi-az deployment. You cannot set the availability\_zone parameter if the multi\_az parameter is set to true. | `string` | `null` | no |
| <a name="input_instance_preferred_maintenance_window"></a> [instance\_preferred\_maintenance\_window](#input\_instance\_preferred\_maintenance\_window) | The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC) | `string` | `null` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | Specifies the accessibility options for the replication instance | `bool` | `null` | no |
| <a name="input_instance_replication_instance_class"></a> [instance\_replication\_instance\_class](#input\_instance\_replication\_instance\_class) | The compute and memory capacity of the replication instance as specified by the replication instance class | `string` | n/a | yes |
| <a name="input_instance_replication_instance_id"></a> [instance\_replication\_instance\_id](#input\_instance\_replication\_instance\_id) | The replication instance identifier. This parameter is stored as a lowercase string. | `string` | n/a | yes |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | A map of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_instance_vpc_security_group_ids"></a> [instance\_vpc\_security\_group\_ids](#input\_instance\_vpc\_security\_group\_ids) | A list of VPC security group IDs to be used with the replication instance | `list(string)` | `null` | no |
| <a name="input_replica_subnet_group_description"></a> [replica\_subnet\_group\_description](#input\_replica\_subnet\_group\_description) | The description for the subnet group. | `string` | n/a | yes |
| <a name="input_replica_subnet_group_id"></a> [replica\_subnet\_group\_id](#input\_replica\_subnet\_group\_id) | The name for the replication subnet group. This value is stored as a lowercase string. | `string` | n/a | yes |
| <a name="input_replica_subnet_group_tags"></a> [replica\_subnet\_group\_tags](#input\_replica\_subnet\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_replica_subnet_ids"></a> [replica\_subnet\_ids](#input\_replica\_subnet\_ids) | A list of the EC2 subnet IDs for the subnet group. | `list(string)` | `[]` | no |
| <a name="input_replication_tasks"></a> [replication\_tasks](#input\_replication\_tasks) | n/a | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to use on all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | A map of maps containing the endpoints created and their full output of attributes and values |
| <a name="output_replication_instance_arn"></a> [replication\_instance\_arn](#output\_replication\_instance\_arn) | The Amazon Resource Name (ARN) of the replication instance |
| <a name="output_replication_instance_private_ips"></a> [replication\_instance\_private\_ips](#output\_replication\_instance\_private\_ips) | A list of the private IP addresses of the replication instance |
| <a name="output_replication_instance_public_ips"></a> [replication\_instance\_public\_ips](#output\_replication\_instance\_public\_ips) | A list of the public IP addresses of the replication instance |
| <a name="output_replication_subnet_group_id"></a> [replication\_subnet\_group\_id](#output\_replication\_subnet\_group\_id) | The ID of the subnet group |
| <a name="output_replication_tasks"></a> [replication\_tasks](#output\_replication\_tasks) | A map of maps containing the replication tasks created and their full output of attributes and values |
