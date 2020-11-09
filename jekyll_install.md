# Installing Jekyll for local workstation/server edits of these pages

## Ubuntu

```
sudo apt install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Now you should be able to locally serve (on port: 4000) the web content:

```
./jekyll_serve.sh
```
