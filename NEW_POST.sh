# Be sure you are in the right directory
ls -l _posts/posts
ls -l _drafts

today=$(date +"%Y-%m-%d")
fulldate=$(date +"%Y-%m-%d %T %z")

title='"Why there is a Terraform state?"'
slug="$today-why-there-is-a-terraform-state"

category="Azure"
tag="Terraform"

#-----------------------------

imagedir="assets/images/$slug"
mkdir $imagedir
touch $imagedir/.git_keep
cp assets/images/dummy.png $imagedir

#postfile="_drafts/$slug.md"
postfile="_posts/posts/$slug.md"

echo "---"                                                                    > $postfile
echo "title: $title"                                                         >> $postfile
echo "date: $fulldate"                                                       >> $postfile
echo "categories:"                                                           >> $postfile
echo "  - $category"                                                         >> $postfile
echo "tags:"                                                                 >> $postfile
echo "  - $tag"                                                              >> $postfile
echo "image1: /$imagedir/dummy.png"                                          >> $postfile
echo "---"                                                                   >> $postfile
echo ""                                                                      >> $postfile
echo "[Microsoft Docs]: https://docs.microsoft.com/en-us/"                   >> $postfile
echo ""                                                                      >> $postfile
echo "## How it works"                                                       >> $postfile
echo ""                                                                      >> $postfile
echo '[See documentation.][Microsoft Docs]{:target="_blank"}'                >> $postfile
echo ""                                                                      >> $postfile
echo '<img src="{{ page.image1 | relative_url }}" alt="dummy" width="300"/>' >> $postfile
echo ""                                                                      >> $postfile


cat $postfile

# Next steps:
#    * Edit the postfile (Markdown)
#    * Save images to imagedir
#    * Test it locally: bundle exec jekyll serve 
#                       bundle exec jekyll serve --drafts