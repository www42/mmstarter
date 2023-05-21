# My Minimal Mistakes remote theme starter

Minimal Mistakes theme is from  [Michael Rose](https://mmistakes.github.io/minimal-mistakes/). Thank you!

Starter repo  [mmistakes/mm-github-pages-starter](https://github.com/mmistakes/mm-github-pages-starter/)


# How to create a new blog

Fork the repo, then clone it locally.

Add following line to `Gemfile`:
```bash
gem "webrick", "~> 1.7"
```

Install gem and build `Gemfile.lock`:
```bash
bundle update
```

Run jekyll locally and test the new site at `http://127.0.0.1:4000/`:
```bash
bundle exec jekyll serve --livereload
```

Commit changes, push to GitHub and enable GitHub Pages in the repo settings.

Et voilà!
