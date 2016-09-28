function fish_prompt --description 'Write out the prompt'
  set last_status $status

  # set default colors
  set user_color $fish_color_user
  set host_color $fish_color_host
  set cwd_color $fish_color_cwd

  # get current values
  set cur_user (whoami)
  set cur_host (hostname -s)
  set cur_cwd (echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||')

  # write prompt
  set_color $user_color;           echo -n $cur_user
  set_color $fish_color_separator; echo -n '@'
  set_color $host_color;           echo -n $cur_host
  set_color $fish_color_separator; echo -n ':'
  set_color $cwd_color;            echo -n $cur_cwd
  set_color normal;                prompt_git_status

  echo
  if not test $last_status -eq 0
    set_color $fish_color_error
  end
  echo -n '▸ '
  set_color normal
end
