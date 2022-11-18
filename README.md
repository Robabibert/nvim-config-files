This is a development environment with neovim inside a dockercontainer mainly for rust based on the neovim configuration files by [Rodrigo Santiago](https://github.com/rsdlt/nvim-config-files)

1. clone this repo  `git clone https://github.com/Robabibert/nvim-config-files`
2. go into cloned repo `cd nvim-config-files` 
3. build docker container `docker-compose up --build -d` 
4. open a shell in the docker container `docker-compose exec development bash`
5. open your code with nvim inside the docker container `nvim /base`
