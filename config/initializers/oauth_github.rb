Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Figaro.env.gh_key, Figaro.env.gh_secret, scope: "user,read:org"
end