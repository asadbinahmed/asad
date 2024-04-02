module "recipe" {

  source = "../resources/recipe"
  
  environment = {
    location = "northcentralus"
    type     = "dev"
  }

  ingredients = {
    proteins = "chicken,beef,tofu"    
    sauces = {
      sauce01 = "thousand island",
      sauce02 = "szechuan",
      sauce03 = "hot"
    }
  }

}