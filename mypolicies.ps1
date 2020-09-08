$mg = Get-AzManagementGroup -GroupName poc-group
New-AzPolicyDefinition -Name 'SEncryptionCheck' -Policy 'AuditStorageAccounts.json' -ManagementGroupName poc-group

$definition =  get-AzPolicyDefinition -Name 'DiskEncryption' -ManagementGroupName poc-group

New-AzPolicyAssignment -Name 'DiskEncryption' -PolicyDefinition $definition -Scope $mg.Id
