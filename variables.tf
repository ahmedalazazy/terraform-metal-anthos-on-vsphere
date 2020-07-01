terraform {
  required_providers {
    packet = "~> 2.10.1"
  }
}

variable "auth_token" {
  description = "This is your Packet API Auth token. This can also be specified with the PACKET_AUTH_TOKEN shell environment variable."
  type    = string
}

variable "organization_id" {
  description = "your org ID"
  type = string
}

variable "project_name" {
  default = "anthos-on-packet-1"
}


variable "create_project" {
  description = "if true create the packet project, if not skip and use the provided project"
  default     = true
}

variable "project_id" {
  description = "Packet Project ID to use in case create_project is false"
  default     = "null"
}

/*
Valid vsphere_service_types are=
  faultToleranceLogging
  vmotion
  vSphereReplication
  vSphereReplicationNFC
  vSphereProvisioning
  vsan
  management
*/

variable "private_subnets" {
  default = [
    {
      "name" = "Management",
      "nat" = true,
      "vsphere_service_type" = "management",
      "routable" = true,
      "cidr" = "172.16.0.0/24"
    },
    {
      "name" = "vMotion",
      "nat" = false,
      "vsphere_service_type" = "vmotion",
      "routable" = false,
      "cidr" = "172.16.1.0/24"
    },
    {
      "name" = "vSAN",
      "nat" = false,
      "vsphere_service_type" = "vsan",
      "routable" = false,
      "cidr" = "172.16.2.0/24"
    },
    {
      "name" = "VM Private Net",
      "nat" = true,
      "vsphere_service_type" = "null",
      "routable" = true,
      "cidr" = "172.16.3.0/24",
      "reserved_ip_count" = 100
    }
  ]
}

variable "public_subnets" {
  default = [
    {
      "name" = "VM Public Net",
      "nat" = false,
      "vsphere_service_type" = "null",
      "routable" = true,
      "ip_count" = 4
    }
  ]
}

variable "router_hostname" {
  default = "edge-gateway01"
}

variable "esxi_hostname" {
  default = "esx"
}

variable "router_size" {
  default = "c3.medium.x86"
}

variable "esxi_size" {
  default = "c3.medium.x86"
}

variable "facility" {
  default = "ny5"
}

variable "router_os" {
  default = "ubuntu_18_04"
}

variable "vmware_os" {
  default = "vmware_esxi_6_7"
}

variable "billing_cycle" {
  default = "hourly"
}

variable "esxi_host_count" {
  default = 3
}

variable "vcenter_portgroup_name" {
  default = "Management"
}

variable "domain_name" {
  default = "packet.local"
}

variable "vpn_user" {
  default = "vm_admin"
}

variable "vcenter_datacenter_name" {
  default = "Packet"
}

variable "vcenter_cluster_name" {
  default = "Packet-1"
}

variable "gcs_bucket_name" {
  default = "vmware"
}

variable "s3_url" {
  default = "https=//s3.example.com"
}

variable "s3_bucket_name" {
  default = "vmware"
}

variable "s3_access_key" {
  default = "S3_ACCESS_KEY"
}

variable "s3_secret_key" {
  default = "S3_SECRET_KEY"
}

variable "s3_boolean" {
  default = "false"
}

variable "vcenter_iso_name" {
}

variable "storage_reader_key_name" {
  default = "storage-reader-key.json"
}

variable "whitelisted_key_name" {
  default = "whitelisted-key.json"
}

variable "connect_key_name" {
  default = "connect-key.json"
}

variable "register_key_name" {
  default = "register-key.json"
}

variable "stackdriver_key_name" {
  default = "stackdriver-key.json"
}
