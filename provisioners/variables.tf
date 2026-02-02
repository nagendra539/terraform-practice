variable "instances"{
  type = map
  description = "instances names with types"
  default = {
    mysql    = "t3.small"
    backend  = "t3.small"
    frontend = "t3.small"
  }
}