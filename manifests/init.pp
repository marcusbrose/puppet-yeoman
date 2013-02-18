class yeoman {
	$yeomanPackages = [ "curl", "git", "nodejs", "npm", "rubygems", "libjpeg-turbo-progs", "optipng", "phantomjs", "python-software-properties" ]
  		package { $yeomanPackages:
    	ensure => "installed",
    	require => Exec['apt-get update'],
  	}
    
  	exec { 'install compass using npm':
    	command => 'npm install compass -g',
    	require => Package["npm"],
  	}
    exec {
        "install yeoman":
            command => "curl -L get.yeoman.io | bash",
			require => Class["nodejs"]
    }
    
  	
}
