# NvChad config on Windows Environment

> _A pecial thanks to **Siduck** and the NvChad development team for creating such an incredible distribution for Neovim, making it easier and more enjoyable to customize and enhance our editing experience._

- [NvChad](https://nvchad.com)

## Acknowledgments

Special thanks to [Alexis](https://github.com/Alexis12119) for inspiring parts of my configuration; several sections were built upon your work

---

If you want to run code like I do in my YouTube videos, add the following script to your $PROFILE:

```ps1
function RunCode {
    clang++ -std=c++23 .\main.cpp -o main.exe

    if (Test-Path .\main.exe) {
        Start-Process -FilePath ".\main.exe" -ArgumentList "< input.txt"
    } else {
        Write-Host "Compilation failed, executable not found."
    }
}
```

I have no more ideas, I'll come back later 🙌
