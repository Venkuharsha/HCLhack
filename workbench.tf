resource "google_workbench_instance" "instance" {
  name     = "workbench-instance1"
  location = "us-central1-a"

  gce_setup {
    machine_type = "n1-standard-4" // can't be e2 because of accelerator
    accelerator_configs {
      type       = "NVIDIA_TESLA_T4"
      core_count = 1
    }

    shielded_instance_config {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }

    disable_public_ip = false

    service_accounts {
      email = google_service_account.bigit_workbench_svc.email
    }
  }
}