class CookieCookingJob < ApplicationJob
  queue_as :default

  def perform(args)
    batch_cookie = BatchCookie.find_by!(id: args[:id])
    # Simulate cooking by sleeping for a couple of minutes
    sleep(10)

    batch_cookie.update!(status: 'ready')
    Pusher.trigger('CookieChannel', 'cookie-ready', { ready: true })
  end
end
