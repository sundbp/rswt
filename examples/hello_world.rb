$LOAD_PATH << File.dirname(__FILE__) + "/../lib"
require 'rswt'

java_import org.eclipse.swt.widgets.Display
java_import org.eclipse.swt.widgets.Shell
java_import org.eclipse.swt.layout.RowLayout
java_import org.eclipse.swt.widgets.Button
java_import org.eclipse.swt.SWT

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
