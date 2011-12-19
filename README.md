To use, place <code>venv.bash</code> somewhere and source it, a la:

    . venv.bash
    
You can do this by hand or put it in your <code>~/.bashrc</code>,
which I suggest for ongoing use.

Once it is "installed" via that eval, it defines a <code>venv</code>
function which supports:

    venv [create <name>]
         [destroy <name>]
         [use <name>]
         [ls]
         
to create, destroy, use, and list virtual environments respectively.

Use <code>$VENV_PROMPT_COLOR</code> to set an ansi escape code for the
color the virtual env name should appear in prompt as. I like
<code>38;5;53</code> in xterm-256color personally :-)
