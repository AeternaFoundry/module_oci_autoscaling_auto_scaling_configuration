resource "oci_autoscaling_auto_scaling_configuration" "autoscaling_auto_scaling_configurations" {
  for_each = var.autoscaling_auto_scaling_configurations

  compartment_id       = each.value.compartment_id
  cool_down_in_seconds = each.value.cool_down_in_seconds
  defined_tags         = each.value.defined_tags
  display_name         = each.value.display_name
  freeform_tags        = each.value.freeform_tags
  is_enabled           = each.value.is_enabled

  auto_scaling_resources {
    id   = each.value.auto_scaling_resources.id
    type = each.value.auto_scaling_resources.type
  }

  dynamic "policies" {
    for_each = each.value.policies
    content {
      dynamic "capacity" {
        for_each = policies.value.capacity != null ? [policies.value.capacity] : []
        content {
          initial = capacity.value.initial
          max     = capacity.value.max
          min     = capacity.value.min
        }
      }
      display_name = policies.value.display_name
      dynamic "execution_schedule" {
        for_each = policies.value.execution_schedule != null ? [policies.value.execution_schedule] : []
        content {
          expression = execution_schedule.value.expression
          timezone   = execution_schedule.value.timezone
          type       = execution_schedule.value.type
        }
      }
      is_enabled  = policies.value.is_enabled
      policy_type = policies.value.policy_type
      dynamic "resource_action" {
        for_each = policies.value.resource_action != null ? [policies.value.resource_action] : []
        content {
          action      = resource_action.value.action
          action_type = resource_action.value.action_type
        }
      }
      dynamic "rules" {
        for_each = policies.value.rules != null ? policies.value.rules : []
        content {
          dynamic "action" {
            for_each = rules.value.action != null ? [rules.value.action] : []
            content {
              type  = action.value.type
              value = action.value.value
            }
          }
          display_name = rules.value.display_name
          dynamic "metric" {
            for_each = rules.value.metric != null ? [rules.value.metric] : []
            content {
              metric_compartment_id = metric.value.metric_compartment_id
              metric_source         = metric.value.metric_source
              metric_type           = metric.value.metric_type
              namespace             = metric.value.namespace
              pending_duration      = metric.value.pending_duration
              query                 = metric.value.query
              resource_group        = metric.value.resource_group
              dynamic "threshold" {
                for_each = metric.value.threshold != null ? [metric.value.threshold] : []
                content {
                  operator = threshold.value.operator
                  value    = threshold.value.value
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

