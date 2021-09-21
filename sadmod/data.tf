data "terraform_remote_state" "nandu" {

backend "remote" 
  config = {
    organization = var.tfe_organisation_name

    workspaces {
      name = var.workspacename
    }
  }
}
