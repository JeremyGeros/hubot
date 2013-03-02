# Deploy with capistrano
#
# Usage:
# deploy <repo>
# what can you deploy?
#
hackers = [
  "http://hubot-assets.s3.amazonaws.com/hackers/1.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/2.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/3.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/4.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/5.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/6.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/7.gif",
]
 
 
module.exports = (robot) ->
  robot.respond /deploy/i, (msg) ->
    #send waiting messages
    msg.send 'Attempting deploy. Please hold.'
    msg.send msg.random hackers

    #hit the sinatra app to do the deploy
    msg.http("http://localhost:4567/deploy")
    .get() (err, res, body) ->
      if res.statusCode == 404
        msg.send body
        msg.send 'Something went horribly wrong'
      else
        msg.send 'Deployed like a boss'
        msg.send 'http://hubot-assets.s3.amazonaws.com/fuck-yeah/3.gif'
        msg.send body
 
 
  robot.respond /(what can you deploy?)/i, (msg) ->
    msg.send 'I can deploy the shit out of ' + repos.join(", ")