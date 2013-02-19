class yeoman {
	$yeomanPackages = [ "curl", "git", "rubygems", "libjpeg-turbo-progs", "optipng", "phantomjs", "python-software-properties" ]
  	package { $yeomanPackages:
    	ensure => "installed",
    	require => Exec['apt-get update'],
  	}
    
  	exec { 'install compass using npm':
    	command => 'npm install -g compass',
    	require => Package["npm"],
  	}
  	exec {
        "install yeoman using npm":
            command => "npm install -g yo grunt-cli bower",
			require => Package["npm"],
    }
    exec {
        "checking yeoman":
            command => "curl -L get.yeoman.io | bash",
			require => Class["nodejs"],
    }
}
