# rswt

* [Homepage](https://github.com/sundbp/rswt)
* [Documentation](http://rubydoc.info/gems/rswt/frames)

## Description

A simple jruby wrapper around the java library [SWT](http://www.eclipse.org/swt/).
All it does is provide a structured way to require the jar files. The user refers to the java
classes as usual (i.e. org.eclipse.swt.widgets.Shell).

Potentially some utilities to enhance productivity and make it more ruby friendly will be added
later as well.

## Examples

This is an excerpts of examples/hello_world.rb:
    
    display = Display.new
    shell = Shell.new(display)
    shell.setText("First Example")
    
    shell.setLayout(RowLayout.new)
    button = Button.new(shell, SWT::PUSH)
    button.setText("Click me!")
    button.add_selection_listener do
      puts "You clicked the button - well done!"
    end
    shell.pack
    
    primary = display.getPrimaryMonitor()
    bounds = primary.getBounds()
    rect = shell.getBounds()
        
    x = bounds.x + (bounds.width - rect.width) / 2
    y = bounds.y + (bounds.height - rect.height) / 2
    
    shell.setLocation(x, y)
    shell.open
    
    while (!shell.isDisposed) do
      display.sleep unless display.readAndDispatch
    end
    display.dispose

## Requirements

* SWT jars
* setting the environment variable **RSWT_JAR_PATH** as described below

## Install

    $ gem install rswt

Download and unpack [SWT](http://www.eclipse.org/swt/), and
set the environment variable **RSWT_JAR_PATH** to the path containg the
SWT jars.

## Copyright

Copyright (c) 2011 Patrik Sundberg

See {file:LICENSE.txt} for details.
