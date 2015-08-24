$ = require('../../vendor/javascripts/jquery.1.11.0.min.js')
sightglass = require('../../vendor/javascripts/sightglass.js')
rivets = require('../../vendor/javascripts/rivets.min.js')

class Theme
  constructor: (renderTo, context, html) ->
    @renderTo = $(renderTo)
    @html = html || @defaultHtml
    @context = context

  render: =>
    @elem = $(@defaultHtml)
    rivets.bind(@elem, @context)
    @renderTo.replaceWith(@elem)

    @findElements()

    return @elem

  findElements: ->
    @progressBarElement = @elem.find('.progress-bar')
    @playPauseElement = @elem.find('.play-button')
    @backwardElement = @elem.find('.backward-button')
    @forwardElement = @elem.find('.forward-button')
    @speedElement = @elem.find('.speed-toggle')

    @buttons = @elem.find('.buttons')
    @panels = @elem.find('.panels')

  addButton: (button) =>
    @buttons.append(button)

  addPanel: (panel) =>
    @panels.append(panel)

  defaultHtml:
    """
    <div class="video-player">
      <div class="info">
        <img rv-src="logo_url" />
        <div class="title">{ title }</div>
        <div class="description">{ subtitle }</div>
      </div>
      <audio id="player" rv-src="playlist.mp3" preload="metadata"></audio>
      <div class="progress-bar">
        <div class="progress-bar-time-played" title="Switch display mode"></div>
        <div class="progress-bar-rail">
          <span class="progress-bar-loaded"></span>
          <div class="progress-bar-buffering"></div>
          <span class="progress-bar-played"></span>
        </div>
      </div>

      <div class="controls">
        <i class="fa fa-backward backward-button" title="Backward 10s"></i>
        <i class="fa fa-play play-button" title="Play/Pause"></i>
        <i class="fa fa-forward forward-button" title="Forward 30s"></i>

        <span class="speed-toggle" title="Playback speed">1x</span>
      </div>

      <div class="buttons">
        <span class="chromecast-ui">
          <img class="chromecast-button" title="Play on chromecast" src="/samples/chromcast.png"/>
          <span class="chromecast-receiver"></span>
        </span>
      </div>
      <div class="panels">
      </div>
    </div>
    """

module.exports = Theme