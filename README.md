This repository contains Nix configurations for multiple hosts.             
                                                                              
  ## Contents                                                                 
                                                                              
  The contents of the repository include the configuration.nix files for      
  various hosts:                                                              
                                                                              
  • catalyst                                                                  
  • mainframe                                                                 
  • nix-anywhere                                                              
  • node-nadia                                                                
  • ttc                                                                       
                                                                              
  Additional files include hardware-configuration.nix for 'node-nadia' and a  
  justfile for automation tasks.                                              
                                                                              
  ## Usage                                                                    
                                                                              
  To use this repository, clone it to your local machine. Then navigate to the
  specific host directory that corresponds to your system's configuration.    
                                                                              
  Each host configuration.nix file outlines the system packages, services,    
  boot loader setups, and more.                                               
                                                                              
  ## Justfile                                                                 
                                                                              
  The included 'justfile` provides automation for various tasks including:    
                                                                              
  •  rebuild-pre : This task adds all changes to git and formats the files    
  using nixpkgs-fmt.                                                          
  •  rebuild : This task executes the rebuilding script.                      
  •  rebuild-catalyst : This task rebuilds the catalyst config.               
  •  build-vm HOSTNAME : This task builds a virtual machine for a given       
  hostname.                                                                   
  •  run-vm HOSTNAME : This task runs a virtual machine for a given hostname. 
  •  node : This task builds and applies changes using Colmena.               
  •  send-it : This task commits and pushes all changes to the repository.    
                                                                              
  \* Note: replace  HOSTNAME  with the name of your host.                     
                                                                              
    just build-vm myHostName                                                  
                                                                              
  ## Additional Info                                                          
                                                                              
  More detailed information about each configuration can be found within the  
  respective configuration.nix file. Each file contains comments explaining   
  the specific setup.                                                         
                                                                              
  ## Dependencies                                                             
                                                                              
  1. NixOS https://nixos.org                                                  
  2. Nixpkgs-fmt https://github.com/nix-community/nixpkgs-fmt                 
  3. Colmena https://github.com/zhaofengli/colmena (for the  node  task in the
  Justfile)                                                                   
