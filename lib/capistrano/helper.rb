require 'itamae/secrets'

def secrets
  @secrets ||= Itamae::Secrets(File.expand_path('../../ops/secrets', __dir__))
end

def with_verbosity(output_verbosity)
  old_verbosity = SSHKit.config.output_verbosity
  begin
    SSHKit.config.output_verbosity = output_verbosity
    yield
  ensure
    SSHKit.config.output_verbosity = old_verbosity
  end
end
