output "autoscaling_auto_scaling_configurations_id" {
  description = "Map of id values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no id are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "autoscaling_auto_scaling_configurations_auto_scaling_resources" {
  description = "Map of auto_scaling_resources values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no auto_scaling_resources are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => one(v.auto_scaling_resources) if v.auto_scaling_resources != null && length(v.auto_scaling_resources) > 0 }
}
output "autoscaling_auto_scaling_configurations_compartment_id" {
  description = "Map of compartment_id values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no compartment_id are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "autoscaling_auto_scaling_configurations_cool_down_in_seconds" {
  description = "Map of cool_down_in_seconds values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no cool_down_in_seconds are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.cool_down_in_seconds if v.cool_down_in_seconds != null }
}
output "autoscaling_auto_scaling_configurations_defined_tags" {
  description = "Map of defined_tags values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no defined_tags are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "autoscaling_auto_scaling_configurations_display_name" {
  description = "Map of display_name values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no display_name are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "autoscaling_auto_scaling_configurations_freeform_tags" {
  description = "Map of freeform_tags values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "autoscaling_auto_scaling_configurations_is_enabled" {
  description = "Map of is_enabled values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no is_enabled are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.is_enabled if v.is_enabled != null }
}
output "autoscaling_auto_scaling_configurations_max_resource_count" {
  description = "Map of max_resource_count values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no max_resource_count are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.max_resource_count if v.max_resource_count != null }
}
output "autoscaling_auto_scaling_configurations_min_resource_count" {
  description = "Map of min_resource_count values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no min_resource_count are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.min_resource_count if v.min_resource_count != null }
}
output "autoscaling_auto_scaling_configurations_policies" {
  description = "Map of policies values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no policies are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.policies if v.policies != null && length(v.policies) > 0 }
}
output "autoscaling_auto_scaling_configurations_time_created" {
  description = "Map of time_created values across all autoscaling_auto_scaling_configurations, keyed the same as var.autoscaling_auto_scaling_configurations except keys with no time_created are omitted"
  value       = { for k, v in oci_autoscaling_auto_scaling_configuration.autoscaling_auto_scaling_configurations : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}

