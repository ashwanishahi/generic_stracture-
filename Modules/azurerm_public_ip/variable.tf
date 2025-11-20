
variable "pip_details" {
    type = map(object({
        pip_name = string
        rg_name =  string
        location = string
        allocation_method = string
       tags = map(string)
      
    }))
  
}
