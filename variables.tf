variable "networkfirewall_logging_configurations" {
  description = <<EOT
Map of networkfirewall_logging_configurations, attributes below
Required:
    - firewall_arn
    - logging_configuration (block):
        - log_destination_config (required, block):
            - log_destination (required)
            - log_destination_type (required)
            - log_type (required)
Optional:
    - enable_monitoring_dashboard
    - region
EOT

  type = map(object({
    firewall_arn                = string
    enable_monitoring_dashboard = optional(bool)
    region                      = optional(string)
    logging_configuration = object({
      log_destination_config = list(object({
        log_destination      = map(string)
        log_destination_type = string
        log_type             = string
      }))
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.networkfirewall_logging_configurations : (
        length(v.logging_configuration.log_destination_config) >= 1 && length(v.logging_configuration.log_destination_config) <= 3
      )
    ])
    error_message = "Each log_destination_config list must contain between 1 and 3 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

