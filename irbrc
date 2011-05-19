begin
	require 'rubygems'
	
	#require 'irbtools'
	require 'irbtools/configure'
	Irbtools.remove_library 'irb_rocket'
	Irbtools.remove_library 'fancy_irb'
	Irbtools.add_library 'interactive_editor'
	Irbtools.init

rescue LoadError => err
  warn "Couldn't load irbtools: #{err}"
end

