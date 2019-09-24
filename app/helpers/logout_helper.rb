module LogoutHelper
    def logout_url
        auth0_domain = Rails.application.credentials.auth0[:domain]
        client_id = Rails.application.credentials.auth0[:client_id]
        request_params = {
            returnTo: root_url,
            client_id: client_id
        }

        URI::HTTPS.build(host: auth0_domain, path: '/v2/logout', query: to_query(request_params)).to_s
    end

    private
        def to_query(hash)
            hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil?}.reject(&:nil?).join('&')
        end
end