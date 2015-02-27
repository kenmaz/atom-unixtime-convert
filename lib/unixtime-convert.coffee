module.exports = UnixtimeConvert =

  activate: (state) ->
    console.log 'activate'
    atom.workspaceView.command "unixtime-convert:convert", => @convert()

  convert: ->
    console.log 'convert'

    editor = atom.workspace.activePaneItem
    text = editor.getText()
    res = text.replace /\d{10}/g, (word) ->
      d = new Date(parseInt(word) * 1000)

      date = [
        d.getFullYear(),
        d.getMonth()+1,
        d.getDate()
      ].join('/')

      time = [
        ('0'+d.getHours()).slice(-2),
        ('0'+d.getMinutes()).slice(-2),
        ('0'+d.getSeconds()).slice(-2)
      ].join(":")

      return word + " ("+ date + " " + time + ")"

    editor.setText(res)
