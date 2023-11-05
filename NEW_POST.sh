# Be sure you are in the right directory
ls -l _posts/posts
ls -l _drafts

today=$(date +"%Y-%m-%d")
fulldate=$(date +"%Y-%m-%d %T %z")

title='"How to teach remotely?"'
slug="$today-how-to-teach-remotely"

# One category only. Add more categories later to front matter section
# Categories:
#       "Azure"
#       "PowerShell"
#       "Git and GitHub"
#       "Artificial Intelligence"
#       "Learning"
category="Learning"

# One tag only. Add more tags later to front matter section
tag="Visual Learning"

#-----------------------------

imagedir="assets/images/$slug"
mkdir $imagedir
touch $imagedir/.gitkeep

postfile="_drafts/$slug.md"
#postfile="_posts/posts/$slug.md"

echo "---"                                                                    > $postfile
echo "title: $title"                                                         >> $postfile
echo "date: $fulldate"                                                       >> $postfile
echo "categories:"                                                           >> $postfile
echo "  - $category"                                                         >> $postfile
echo "tags:"                                                                 >> $postfile
echo "  - $tag"                                                              >> $postfile
echo "classes: wide"                                                         >> $postfile
echo "image1: /$imagedir/dummy.png"                                          >> $postfile
echo "---"                                                                   >> $postfile
echo ""                                                                      >> $postfile
echo "<!-- Kommentar -->"                                                    >> $postfile
echo ""                                                                      >> $postfile
echo "[Microsoft Learn]: https://learn.microsoft.com/en-us/"                 >> $postfile
echo ""                                                                      >> $postfile
echo "# How it works"                                                        >> $postfile
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