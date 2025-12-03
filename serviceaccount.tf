resource "google_service_account" "bigit_workbench_svc" {
  account_id   = "bigit_workbench_svc1"
  display_name = "bigit_workbench_svc1"
}

# Notebook Admin role
resource "google_service_account_iam_member" "notebook_admin_member" {
  service_account_id = google_service_account.bigit_workbench_svc.name
  role               = "roles/notebooks.admin"
  member             = "serviceAccount:${google_service_account.bigit_workbench_svc.email}"
}

# Notebook Runner role
resource "google_service_account_iam_member" "notebook_runner_member" {
  service_account_id = google_service_account.bigit_workbench_svc.name
  role               = "roles/notebooks.runner"
  member             = "serviceAccount:${google_service_account.bigit_workbench_svc.email}"
}