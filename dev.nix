{config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
			chromedriver postgresql 
		  git nim go rustup cargo zig ruff gcc clang ruby bun gopls
			mprocs
			(python311.withPackages(ps: with ps; [
	    	pandas requests flask selenium sqlalchemy ffmpeg-python
	    	openpyxl pyquery feedparser beautifulsoup4 rich openai python-lsp-server
	    (buildPythonPackage rec {
	        pname = "undetected-chromedriver";
	        version = "2.1.1";
	        src = fetchPypi {
	          inherit pname version;
		    		sha256 = "sha256-YxWr8qTnglkhP1SwevCFscI0zu/U4gvuEmtb6cHQ7Wk=";
	            };
	        doCheck = false;
	        }
	    )
			]))
  	];
}
