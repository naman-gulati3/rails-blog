opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret, opts
  provider :facebook, '598054710707195', 'a3e1339322c8401cc78c791e6ccaa2e8'
end
