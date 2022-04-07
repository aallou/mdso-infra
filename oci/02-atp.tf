resource "oci_database_autonomous_database" "mdso_demo_autonomous_database" {
  compartment_id                       = oci_identity_compartment.mdso_demo_compartment.id
  db_name                              = "MDSO_DEMO"
  display_name                         = "MDSO_DEMO"
  admin_password                       = "DemoPassword001"
  autonomous_maintenance_schedule_type = "REGULAR"
  db_version                           = "19c"
  db_workload                          = "OLTP"
  is_free_tier                         = "true"
  license_model                        = "LICENSE_INCLUDED"
  subnet_id                            = oci_core_subnet.mdso_demo_subnet_public.id
  nsg_ids                              = oci_core_network_security_group.atp_network_security_group.id
  private_endpoint_label               = "mdso_demo"
  open_mode                            = "READ_WRITE"
  #operations_insights_status                     = "ENABLED"
  #cpu_core_count                                 = "1"
  #data_storage_size_in_tbs                       = "1"
  #is_auto_scaling_enabled                        = "true"
  #is_data_guard_enabled                          = false
  #is_dedicated                                   = "false"
  #data_safe_status                               = "NOT_REGISTERED"
  lifecycle {
    ignore_changes = [
      admin_password,
    ]
    prevent_destroy = true
  }
}