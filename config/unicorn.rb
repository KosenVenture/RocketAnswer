worker_processes 4

listen "/var/www/kaitoushare/current/tmp/sockets/unicorn.sock"

stderr_path '/var/www/kaitoushare/current/log/unicorn.log'
stdout_path '/var/www/kaitoushare/current/log/unicorn.log'

pid '/var/www/kaitoushare/current/tmp/pids/unicorn.pid'

timeout 30
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
