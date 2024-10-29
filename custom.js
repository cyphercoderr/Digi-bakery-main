document.addEventListener('DOMContentLoaded', () => {  
  const cookieInfoElements = document.querySelectorAll('.cookie-info');
  if (cookieInfoElements.length > 0) {
    checkCookieStatus();
  }

  function checkCookieStatus() {
    const pusher = new Pusher(ENV['PUSHER_API_KEY'], {     //Replace cred with envs
        cluster: ENV['PUSHER_CLUSTER']
      });

    const channel = pusher.subscribe('CookieChannel');

    channel.bind('cookie-ready', function(data) {
      if (data.ready) {
        const status = document.getElementById('cookie-status');
        const element = document.getElementById('cookie-block')

        status.innerText = 'ready';
        element.style.display = 'block';
      }
  });}
});
