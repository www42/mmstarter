# My Minimal Mistakes remote theme starter

Origin  [mmistakes/mm-github-pages-starter](https://github.com/mmistakes/mm-github-pages-starter/). Thank you [Michael Rose](https://mmistakes.github.io/minimal-mistakes/) for this great theme.

## How to create a new blog

Fork the repo, then clone it locally.

Add following line to `Gemfile`:
```bash
gem "webrick", "~> 1.7"
```

Install gem and rebuild `Gemfile.lock`:
```bash
bundle update
```

Run jekyll locally and test the new site at `http://127.0.0.1:4000/`:
```bash
bundle exec jekyll serve --livereload
```

Commit changes, push to GitHub and enable GitHub Pages in the repo settings.






## Troubleshooting

If you have a question about using Jekyll, start a discussion on the [Jekyll Forum](https://talk.jekyllrb.com/) or [StackOverflow](https://stackoverflow.com/questions/tagged/jekyll). Other resources:

- [Ruby 101](https://jekyllrb.com/docs/ruby-101/)
- [Setting up a Jekyll site with GitHub Pages](https://jekyllrb.com/docs/github-pages/)
- [Configuring GitHub Metadata](https://github.com/jekyll/github-metadata/blob/master/docs/configuration.md#configuration) to work properly when developing locally and avoid `No GitHub API authentication could be found. Some fields may be missing or have incorrect data.` warnings.
