require "mynewsdesk"

# Exempel:
# 
# Om du definerar en klass och ärver från MynewsdeskType så kommer den klassen att
# matchas med "type_of_media" värdet för listingar i API:et. Om man definerar 
#   class Pressrelease < MynewsdeskType;end
# så kommer den att kunna rendreras som en parital och letar då efter en template
# som heter _pressrelease.html.erb. Metoder som defineras i klassen finns tillgängliga
# vid rendreringen, se ContectPerson#photo nedan.

class ContactPerson < MynewsdeskType
  
  def photo
    self["image_thumbnail_medium"] || "http://www.croydonkorfball.com/images/players/profiles/unknown.gif"
  end
  
end
