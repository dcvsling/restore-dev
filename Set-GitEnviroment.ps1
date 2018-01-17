function Set-GitEnviroment($git){
    
  git config --global user.email $git.global.user.email
  
  git config --global user.name $git.global.user.name
}