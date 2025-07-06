locals {
  landscape = yamldecode(file(var.landscape_file))
  modules = yamldecode(file(var.modules_file))
  environment_dict = lookup(local.landscape, "environments", {})
  current_env = basename(abspath(path.root))
}
