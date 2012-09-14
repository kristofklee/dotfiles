begin
	require 'rubygems'
	
	#require 'irbtools'
	require 'irbtools/configure'
	Irbtools.remove_library :hirb
	Irbtools.add_library :interactive_editor
	Irbtools.start

rescue LoadError => err
  warn "Couldn't load irbtools: #{err}"
end

