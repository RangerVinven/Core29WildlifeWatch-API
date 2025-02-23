Rails.application.config.session_store :cookie_store, key: 'session_token', expire_after: 30.days, same_site: :lax
