variable "app_name" {
  type        = string
  description = "DEVOPS-PIPELINE"
}

variable "fly_token" {
  type        = string
  description = "Fly API Token"
  sensitive   = true
}
