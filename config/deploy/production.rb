set :rails_env, :production

set :dotenv, <<~DOTENV
DOTENV

# Itamae
set :itamae_vars, lambda {
  {
    app: {
      deploy_to: fetch(:deploy_to),
      user: 'ubuntu',
      ssh_key: secrets[:prd_deploy_key],
      rails_env: fetch(:rails_env),
      rails_max_threads: 5,
      web_concurrency: 3
    },
    sidekiq: {
      concurrency: 10
    },
    newrelic: {
      license_key: fetch(:newrelic_license_key)
    },
    monit: {
      alert: 'system-alert@neuro-inc.jp'
    }
  }
}

# Terraform
set :terraform_vars, lambda {
  {
    name_prefix: "#{fetch(:application)}-prd",
    tags: {
      Project: fetch(:application),
      Stages: fetch(:stage)
    },

    zone_apex: 'okkake.me',
    stg_domain: 'stg.okkake.me',
    backend_domain: 'backend.okkake.me',
    cdn_domain: 'cdn.okkake.me',

    hostname_prefix: 'okkake-prd',

    s3_bucket: 'okkake-prd',

    tf_backend_access_key: secrets[:tf_backend_access_key],
    tf_backend_secret_key: secrets[:tf_backend_secret_key],

    key_pair_pub: secrets[:prd_aws_key_pair_pub],

    web_instance_type: 't3.medium',
    web_instance_count: 1,

    worker_instance_type: 't3.medium',
    worker_instance_count: 1,

    postgres_version: '11.5',
    postgres_family: '11',
    postgres_instance_type: 'db.t3.medium',
    postgres_storage: 50,
    postgres_multi_az: true,
    postgres_username: 'postgres',
    postgres_password: secrets[:prd_postgres_master_password],

    redis_version: '5.0.6',
    redis_family: '5.0',
    redis_instance_type: 'cache.t3.small',
    redis_instance_count: 1,
    redis_multi_az: false
  }
}
