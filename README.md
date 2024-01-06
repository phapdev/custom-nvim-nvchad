# nvim
My custom neovim linux - windowns

# Ubuntu 22.04
- Bước 1: Tải neovim từ github
```pwh
sudo apt install neovim
```

- Bước 2: Tải dependencies.
```pwh
sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++
```
- Bước 3: Tải kho lưu trữ (mục đích là nâng version của neovim lên cao nhất).
- From the PPA repository
```pwh
sudo add-apt-repository ppa:neovim-ppa/unstable
```
- Update và tải lại:
```pwh
sudo apt-get update
sudo apt-get install neovim
```
