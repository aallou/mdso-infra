resource "oci_core_vcn" "mdso_demo_vcn" {
  #Required
  compartment_id = oci_identity_compartment.mdso_demo_compartment.id

  #Optional
  cidr_block     = local.vcn_cidr_block
  defined_tags   = { "Operations.CostCenter" = "42" }
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
  freeform_tags  = { "Department" = "Finance" }
  is_ipv6enabled = var.vcn_is_ipv6enabled
}
resource "oci_core_subnet" "mdso_demo_subnet_public" {
  #Required
  compartment_id = oci_identity_compartment.mdso_demo_compartment.id
  vcn_id         = oci_core_vcn.mdso_demo_vcn.id
  cidr_block     = cidrsubnet(local.vcn_cidr_block, 4, 0)

  #Optional
  display_name               = var.subnet_display_name
  prohibit_internet_ingress  = false
  prohibit_public_ip_on_vnic = true
  #availability_domain = var.subnet_availability_domain
  #defined_tags = {"Operations.CostCenter"= "42"}
  #dhcp_options_id = oci_core_dhcp_options.test_dhcp_options.id
  #dns_label = var.subnet_dns_label
  #freeform_tags = {"Department"= "Finance"}
  #ipv6cidr_block = var.subnet_ipv6cidr_block
  #route_table_id = oci_core_route_table.test_route_table.id
  #security_list_ids = var.subnet_security_list_ids
}

resource "oci_core_network_security_group" "atp_network_security_group" {
  #Required
  compartment_id = oci_identity_compartment.mdso_demo_compartment.id
  vcn_id         = oci_core_vcn.mdso_demo_vcn.id
  #Optional
  display_name  = var.network_security_group_display_name
  defined_tags  = { "Operations.CostCenter" = "42" }
  freeform_tags = { "Department" = "Finance" }
}