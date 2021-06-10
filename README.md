## xxh-plugin-zsh-vundle
This plugin allows for <a href="https://github.com/VundleVim/Vundle.vim">Vundle</a> to be used over <a href="https://github.com/xxh/xxh">xxh</a>. 

## Installation
To install run the following command
```
xxh +I https://github.com/elihopk/xxh-plugin-zsh-vundle
```
## Environment Variables
The vundles environment variable holds plugin names exactly as they would be formatted in Plugin 'author/plugin', these are delimited by '|'. For example:
```
-e:
  - vundles="'Vundle/Vundle.vim'|'author/plugin'"
``` 
 
 The customrc environment variable holds any extra commands that should be added to the vimrc file, also delimited by a '|'. For example:
 ```
 -e:
   - customrc="command 1|command 2"
 ```

🔎 [Search xxh plugins on Github](https://github.com/search?q=xxh-plugin-zsh&type=Repositories) or [Bitbucket](https://bitbucket.org/repo/all?name=xxh-plugin-zsh) or 💡 [Create xxh plugin](https://github.com/xxh/xxh-plugin-zsh-example)
