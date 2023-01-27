log_level = "INFO"
disable_update_check = true
server = true
domain = "example.consul.local"
datacenter = "default"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
node_name = "consul"
server_name = "consul.server.default.example.consul.local"
bootstrap_expect = 1
tls {
  defaults {
    verify_incoming = false
    verify_outgoing = false
  }
  internal_rpc {
    verify_server_hostname = false
  }
}
acl {
  enabled = false
  default_policy = "allow"
}
