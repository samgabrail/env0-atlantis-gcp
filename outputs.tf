output "instance_id" {
  value = google_compute_instance.default.instance_id
}

output "network_interface" {
  value = google_compute_instance.default.network_interface
}

output "hostname" {
  value = google_compute_instance.default.hostname
}
