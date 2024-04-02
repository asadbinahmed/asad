module "recipe" {

  source = "../resources/recipe"
  
  environment = {
    location = "northcentralus"
    type     = "dev"
  }

}