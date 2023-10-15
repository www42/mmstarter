# Be sure you are in the right directory
ls -l _posts/posts
ls -l _drafts

$today = Get-Date -Format "yyyy-MM-dd"
$fulldate = Get-Date -Format "yyyy-MM-dd HH:mm:ss K"

$title='"Python virtual environments"'
$slug="$today-python-virtual-environments"

$categories='"Artificial Intelligence"'
$tags="Python, venv"

#-----------------------------

$imagedir="assets/images/$slug"
mkdir $imagedir -ea SilentlyContinue
New-Item -ItemType File -Path $imagedir/.git_keep -ea SilentlyContinue
Copy-Item -Path assets/images/dummy.png -Destination $imagedir

#postfile="_drafts/$slug.md"
$postfile="_posts/posts/$slug.md"

echo "---"                                                                    > $postfile
echo "title: $title"                                                         >> $postfile
echo "date: $fulldate"                                                       >> $postfile
echo "categories: $categories"                                               >> $postfile
echo "tags: $tags"                                                           >> $postfile
echo "image1: /$imagedir/dummy.png"                                          >> $postfile
echo "---"                                                                   >> $postfile
echo ""                                                                      >> $postfile
echo "[Microsoft Learn]: https://learn.microsoft.com/en-us/"                 >> $postfile
echo ""                                                                      >> $postfile
echo "## How it works"                                                       >> $postfile
echo ""                                                                      >> $postfile
echo '[See documentation.][Microsoft Learn]{:target="_blank"}'               >> $postfile
echo ""                                                                      >> $postfile
echo '<img src="{{ page.image1 | relative_url }}" alt="dummy" width="300"/>' >> $postfile
echo ""                                                                      >> $postfile


cat $postfile

# Next steps:
#    * Edit the postfile (Markdown)
#    * Save images to imagedir
#    * Test it locally: bundle exec jekyll serve 
#                       bundle exec jekyll serve --drafts