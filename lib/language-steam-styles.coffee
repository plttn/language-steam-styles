LanguageSteamStylesView = require './language-steam-styles-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageSteamStyles =
  languageSteamStylesView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageSteamStylesView = new LanguageSteamStylesView(state.languageSteamStylesViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageSteamStylesView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-steam-styles:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageSteamStylesView.destroy()

  serialize: ->
    languageSteamStylesViewState: @languageSteamStylesView.serialize()

  toggle: ->
    console.log 'LanguageSteamStyles was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
