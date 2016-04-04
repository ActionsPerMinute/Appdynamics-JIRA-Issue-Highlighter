saveOptions = ->
  chrome.storage.sync.set
    username: document.getElementById('username').value,
    password: document.getElementById('password').value,
    lastChecked: 0 # force a refresh on next load
  , ->
    status = document.getElementById('status')
    status.textContent = 'Options saved.'
    setTimeout ->
      status.textContent = ''
    , 750

restoreOptions = ->
  chrome.storage.sync.get
    username: "",
    password: "",
  , (items) ->
    document.getElementById('username').value = items.username
    document.getElementById('password').value = "****"

document.addEventListener 'DOMContentLoaded', restoreOptions
document.getElementById('save').addEventListener 'click', saveOptions
