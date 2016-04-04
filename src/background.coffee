chrome.runtime.onInstalled.addListener =>
  context = "selection"
  title = "Jira Bugs for Selected Text"
  id = chrome.contextMenus.create {"title": title, "contexts":[context], "id": "context" + context}

chrome.contextMenus.onClicked.addListener (info, tab) =>
  sText = info.selectionText
  url = "https://singularity.jira.com/issues/?jql=project%20%3D%20CORE%20AND%20issuetype%20%3D%20Bug%20AND%20affectedVersion%20>%204.1%20AND%20affectedVersion%20<%204.2.1%20AND%20(status%20%3D%20%22In%20Progress%22%20or%20resolution%20not%20in%20(%22Cannot%20Reproduce%22%2CDuplicate%2C%22Not%20a%20bug%22%2C%22By%20Design%22%2C%22No%20Response%22%2C%22No%20Work%20Required%22))%20AND%20priority%20>%3D%20P3%20AND%20Severity%20in%20(S1%2CS2%2CS3)%20and%20summary%20~%20%22" + encodeURIComponent sText
  url += "%22"
  window.open url, '_blank'
