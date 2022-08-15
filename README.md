# I use NeoVim BTW

Installation requirements:
- Make sure you have neovim stable installed
- `sudo/doas ./install-libs` for GNU/Linux (in Mac dont use sudo)
- Get on NeoVim and run :PackerSync then :TSUpdate
- Reboot NeoVim
- Done!


If there's any significant error I am sure you can solve it in your own by using `:checkhealth`

# Controls

## Main
```
Leader Key: Space 
```

## Window Navigation
```
CTRL + h -> Left
CTRL + j -> Up
CTRL + k -> Down
CTRL + l -> Right
```

## Window Resize
```
CTRL + Up -> reduces window size horizontally by -2
CTRL + Down -> reduces window size horizontally by -2
CTRL + Left -> reduces window size vertically by -2
CTRL + Right -> reduces window size vertically by -2
```
`[! Disclaimer: In MacOS these keybinds do not work because they are taken by the OS ]`


## Which-key
This is your mainframe of keybinds

How to use:
- Just press Leader key and then follow along the interface

Disclaimer: It's case sensitive <br>

Base 
```
Space + w = Save 
Space + Q = Quit by Force (Data loss may occur)
Space + c = Close buffer
Space + C = Closes all buffers except active one
Space + h = Highlight
Space + e = Opens NvimTree
```

Telescope
```
Space + f = Opens telescope in search of files in current active directory
Space + F = Opens telescope in search of text in current active directory
Space + P = Opens Project 
Space + b = Opens telescope in search of active buffers
Space + r = Rename (Not Available)
Space + / = Comment (Not Available)
```

Groups
```
Space + p = Opens Packer group
Space + l = Opens LSP group
Space + g = Opens Git group (Some contents do not work for now)
Space + t = Opens ToggleTerminal 
```

![Screenshot 2022-07-19 at 10 33 28 PM](https://user-images.githubusercontent.com/30930688/179842099-584f9ecd-cba3-486e-9814-aae06f32ad40.png)
![Screenshot 2022-07-19 at 10 34 07 PM](https://user-images.githubusercontent.com/30930688/179842115-1dc2ba6f-9a3d-4e51-a7da-29a8659574d0.png)
