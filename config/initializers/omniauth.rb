Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '0c75a701b970a6fad7d5', '7a2066eaf7c43e33640b07c17f3eadae5f353be8'
end