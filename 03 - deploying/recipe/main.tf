module "recipe" {

  source = "../resources/recipe"

  environment = var.environment
  ingredients = var.ingredients

}