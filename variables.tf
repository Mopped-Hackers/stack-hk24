
variable "app" {
  type        = string
  description = "Application name"
  default     = "app"
}

variable "region" {
  type        = string
  description = "Location of the resource group (westeurope, swedencentral)"
  default     = "westeurope"
}

variable "env" {
  type        = string
  description = "Application Environment (dev,test,staging,production)"
  default     = "dev"
}
