{config, pkgs, ... }:
{
# Hacker stuff
    environment.systemPackages = with pkgs; [
	# <-------- Exploitatin Frameworks ------->
      metasploit
    	hashcat
    	john
    	# <-------- Network Exploitation -------->
    	tshark
    	bettercap
	]
}

