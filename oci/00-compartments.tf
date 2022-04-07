resource "oci_identity_compartment" "mdso_demo_compartment" {
  #Required
  compartment_id = local.tenancy
  description    = "Demo Compartment"
  name           = "mdso-demo"

  #Optional
  defined_tags  = { "Operations.CostCenter" = "42" }
  freeform_tags = { "Department" = "Finance" }
}