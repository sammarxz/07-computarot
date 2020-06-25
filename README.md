![Preview of tarot bash command](https://raw.githubusercontent.com/sammarxz/07-computarot/master/Windowshot_2020-06-25_12%3A51%3A57.png)

# Computarot
And we come to the last day, a script for a simple tarot drawing straight from your terminal. I used the `jq` again to read a [json file with all 78 cards](https://raw.githubusercontent.com/dariusk/corpora/master/data/divination/tarot_interpretations.json) and their meanings. I learned a lot about bash script in practice and I think you can really do good automation things with him, who knows more up front I don't create something like that ...

---

## How to use
```
$ cp .computarot ~/
```
* Open `~/.bashrc` or `~/.zshrc` using any text editor you have
* Add the following command after the last line or anywhere you want:
`source ~/.computarot`
* Save file after adding the new line and reboot the terminal: `source .zshrc` or `source .bashrc`

Now you have access to the command like this:

```
$ tarot
```
