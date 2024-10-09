# frozen_string_literal: true

# class with methods to call external python processes
class PyCall
  def self.call_python_script(script_name, args)
    system("python3 #{script_name} #{args}")
  end
end
