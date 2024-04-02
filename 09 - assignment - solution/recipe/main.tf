module "recipe" {

  source = "../resources/recipe"
  
  environment = {
    location = "northcentralus"
    type     = "dev"
  }

  ingredients = {
    proteins = "chicken,beef,tofu"    
  }

}