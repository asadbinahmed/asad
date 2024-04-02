module "recipe" {

  source = "../resources/recipe"
  
  environment = {
    location           = "northcentralus"
    type               = "dev"
    deploy             = true
    vnet_address_space = "10.1.0.0/22"    
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