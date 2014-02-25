# Slim Message

A simple chat client based off of the [Intercom](https://www.intercom.io) model.

An admin view is available through the ```root_path``` of the rails app. Admins can send out messages to all installed clients. New messages appear as alerts to the clients.

## Client Install

A client can install the Slim Message system by pasting the below before the closing ```</head>``` tag of their document.

```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script>
  var userInformation = {
    user: {
      name: 'Ben',
      email: 'ben@gmail.com'
    }
  }
</script>

<script>
  $(function(){
    $.post('http://localhost:3000/users', userInformation, welcomeOrShowMessages)

    function welcomeOrShowMessages(data){
      if(data.user.login_count === 1){
        alert('Thanks for signing up. Check back for messages.')
      } else {
        displayMessages(data.messages)
      }
    }

    function displayMessages(data){
      if(data){
        $.each(data, function(i, elem){
          alert('New message:\n' + elem.text)
        })
      }
    }
  })
</script>
```

This sends the user information as a ```POST``` call to the API (the Rails app). If the user is new, the program will thank you for installing. If the user is not new, an alert will display the newest unread message to the user, if one exists.