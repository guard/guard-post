require 'guard'
require 'guard/guard'
require 'guard/watcher'

module ::Guard
  class Post < ::Guard::Guard
    def initialize(watchers = [], options = {}, &block)
      super
      @options = {
        :all_on_start => true,
        :rails        => false
      }.update(options)
    end
    
    def start
      if @options[:rails] == true
        ::Guard::UI.info "-> Loading Rails...", :reset => true
        require File.expand_path("../config/environment", __FILE__)
        ::Guard::UI.info "-> Loaded Rails '#{Rails.env.to_s}' environment", :reset => true
      end
      true
    end
    
    def run_all
      run_on_change(Watcher.match_files(self, Dir.glob(File.join('**', '*.*'))))
    end
    
    def run_on_change(paths)
      trap("SIGINT") { exit! }
      changed_files = paths.reject { |f| ignored?(f) }.map do |file|
        begin
          expanded    = ::File.expand_path(file)
          ::Guard::UI.info "-> updating '#{file}'...", :reset => true
          update_file(file)
          ::Guard::UI.info "-> updated '#{file}'", :reset => true
          file
        rescue Exception => e
          puts e.backtrace.join("\n")
          puts e.inspect
        end
        file
      end.compact
    end
    
    def update_file(file)
      case @options[:update]
      when ::Symbol
        Object.send(@options[:update], file)
      else
        @options[:update].call(file)
      end
    end
    
    def ignored?(path)
      File.basename(path)[0] == "_"
    end
  end
end