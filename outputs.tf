output "networkfirewall_logging_configurations_id" {
  description = "Map of id values across all networkfirewall_logging_configurations, keyed the same as var.networkfirewall_logging_configurations"
  value       = { for k, v in aws_networkfirewall_logging_configuration.networkfirewall_logging_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "networkfirewall_logging_configurations_enable_monitoring_dashboard" {
  description = "Map of enable_monitoring_dashboard values across all networkfirewall_logging_configurations, keyed the same as var.networkfirewall_logging_configurations"
  value       = { for k, v in aws_networkfirewall_logging_configuration.networkfirewall_logging_configurations : k => v.enable_monitoring_dashboard if v.enable_monitoring_dashboard != null }
}
output "networkfirewall_logging_configurations_firewall_arn" {
  description = "Map of firewall_arn values across all networkfirewall_logging_configurations, keyed the same as var.networkfirewall_logging_configurations"
  value       = { for k, v in aws_networkfirewall_logging_configuration.networkfirewall_logging_configurations : k => v.firewall_arn if v.firewall_arn != null && length(v.firewall_arn) > 0 }
}
output "networkfirewall_logging_configurations_logging_configuration" {
  description = "Map of logging_configuration values across all networkfirewall_logging_configurations, keyed the same as var.networkfirewall_logging_configurations"
  value       = { for k, v in aws_networkfirewall_logging_configuration.networkfirewall_logging_configurations : k => one(v.logging_configuration) if v.logging_configuration != null && length(v.logging_configuration) > 0 }
}
output "networkfirewall_logging_configurations_region" {
  description = "Map of region values across all networkfirewall_logging_configurations, keyed the same as var.networkfirewall_logging_configurations"
  value       = { for k, v in aws_networkfirewall_logging_configuration.networkfirewall_logging_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}

