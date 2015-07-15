module.exports = UnixtimeConvert =

  activate: (state) ->
    console.log 'activate'
    atom.commands.add 'atom-workspace', 'unixtime-convert:convert', => @convert(false)
    atom.commands.add 'atom-workspace', 'unixtime-convert:convert-flat', => @convert(true)
    console.log 'command added'

  convert: (flat) ->
    console.log 'convert flat:' + flat

    workspace = atom.workspace
    editor = workspace.getActiveTextEditor()
    text = editor.getText()
    res = text.replace /\d{10}/g, (word) ->
      d = new Date(parseInt(word) * 1000)

      d_sep = if flat then '' else '/'
      t_sep = if flat then '' else ':'

      date = [
        d.getFullYear(),
        d.getMonth()+1,
        d.getDate()
      ].join(d_sep)

      time = [
        ('0'+d.getHours()).slice(-2),
        ('0'+d.getMinutes()).slice(-2),
        ('0'+d.getSeconds()).slice(-2)
      ].join(t_sep)

      if flat
        return word + "." + date + "" + time
      else
        return word + " (" + date + " " + time + ")"

    editor.setText(res)
