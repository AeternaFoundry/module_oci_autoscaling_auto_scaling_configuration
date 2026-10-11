variable "autoscaling_auto_scaling_configurations" {
  description = <<EOT
Map of autoscaling_auto_scaling_configurations, attributes below
Required:
    - compartment_id
    - auto_scaling_resources (block):
        - id (required)
        - type (required)
    - policies (block):
        - capacity (optional, block):
            - initial (optional)
            - max (optional)
            - min (optional)
        - display_name (optional)
        - execution_schedule (optional, block):
            - expression (required)
            - timezone (required)
            - type (required)
        - is_enabled (optional)
        - policy_type (required)
        - resource_action (optional, block):
            - action (required)
            - action_type (required)
        - rules (optional, block):
            - action (optional, block):
                - type (optional)
                - value (optional)
            - display_name (required)
            - metric (optional, block):
                - metric_compartment_id (optional)
                - metric_source (optional)
                - metric_type (optional)
                - namespace (optional)
                - pending_duration (optional)
                - query (optional)
                - resource_group (optional)
                - threshold (optional, block):
                    - operator (optional)
                    - value (optional)
Optional:
    - cool_down_in_seconds
    - defined_tags
    - display_name
    - freeform_tags
    - is_enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id       = string
    cool_down_in_seconds = optional(number)
    defined_tags         = optional(map(string))
    display_name         = optional(string)
    freeform_tags        = optional(map(string))
    is_enabled           = optional(bool)
    auto_scaling_resources = object({
      id   = string
      type = string
    })
    policies = list(object({
      capacity = optional(object({
        initial = optional(number)
        max     = optional(number)
        min     = optional(number)
      }))
      display_name = optional(string)
      execution_schedule = optional(object({
        expression = string
        timezone   = string
        type       = string
      }))
      is_enabled  = optional(bool)
      policy_type = string
      resource_action = optional(object({
        action      = string
        action_type = string
      }))
      rules = optional(list(object({
        action = optional(object({
          type  = optional(string)
          value = optional(number)
        }))
        display_name = string
        metric = optional(object({
          metric_compartment_id = optional(string)
          metric_source         = optional(string)
          metric_type           = optional(string)
          namespace             = optional(string)
          pending_duration      = optional(string)
          query                 = optional(string)
          resource_group        = optional(string)
          threshold = optional(object({
            operator = optional(string)
            value    = optional(number)
          }))
        }))
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_auto_scaling_configurations : (
        length(v.policies) >= 1
      )
    ])
    error_message = "Each policies list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_auto_scaling_configurations : (
        alltrue([for item in v.policies : (contains([for v in ["scheduled", "threshold"] : lower(v)], lower(item.policy_type)))])
      )
    ])
    error_message = "must be one of: \"scheduled\", \"threshold\""
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_auto_scaling_configurations : (
        alltrue([for item in v.policies : (item.execution_schedule == null || (contains([for v in ["cron"] : lower(v)], lower(item.execution_schedule.type))))])
      )
    ])
    error_message = "must be one of: \"cron\""
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_auto_scaling_configurations : (
        alltrue([for item in v.policies : (item.resource_action == null || (contains([for v in ["power"] : lower(v)], lower(item.resource_action.action_type))))])
      )
    ])
    error_message = "must be one of: \"power\""
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_auto_scaling_configurations : (
        alltrue([for item in v.policies : (item.rules == null || alltrue([for item in item.rules : (item.metric == null || (item.metric.metric_source == null || (contains([for v in ["COMPUTE_AGENT", "CUSTOM_QUERY"] : lower(v)], lower(item.metric.metric_source)))))]))])
      )
    ])
    error_message = "must be one of: \"COMPUTE_AGENT\", \"CUSTOM_QUERY\""
  }
}

