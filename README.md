# LiveStateComments

This is a demo project for [`live_state`](https://github.com/gaslight/live_state). It's designed to 
be the "back end" of this [repo](https://github.com/gaslight/livestate-comments) which contains the custom element with will interact with CommentsChannel.

## Usage

Typical phoenix:

```
mix deps.get
mix ecto.create
mix ecto.migrate
mix phx.server
```

This will run the server, to see the front end demo go to the [front end repo](https://github.com/gaslight/livestate-comments) and follow instructions there.