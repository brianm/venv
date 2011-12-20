To use, place <code>venv.bash</code> somewhere on your path and:

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

Demo:

    brianm@binky:~$
    brianm@binky:~$ venv create spiffy
    New python executable in /Users/brianm/.venv/spiffy/bin/python
    Installing setuptools............done.
    Installing pip...............done.
    brianm@binky:~$ venv use spiffy
    (spiffy)brianm@binky:~$ which python
    /Users/brianm/.venv/spiffy/bin/python
    (spiffy)brianm@binky:~$ venv ls
    spiffy
    (spiffy)brianm@binky:~$ deactivate 
    brianm@binky:~$ 

Use <code>$VENV_PROMPT_COLOR</code> to set an ansi color code for the
color of the virtual env name in the prompt. I like
<code>VENV_PROMPT_COLOR='38;5;53'</code> in xterm-256color. In
traditional 16 color <code>xterm-color</code> I would tend towards
<code>VENV_PROMPT_COLOR='0;35'</code>.

Use <code>$VENV_DIR</code> if you don't want virtual environments
stored in <code>~/.venv</code>.

