Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '172542329791823', 'd4b65e754a112b23b1005c6f70da6120'
end