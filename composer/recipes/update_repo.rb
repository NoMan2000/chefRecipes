composer_project "/srv/www/cellcontrol/current" do
    dev false
    quiet true
    prefer_dist false
    action :install
end

#update project vendors
composer_project "/srv/www/cellcontrol/current" do
    dev false
    quiet true
    action :update
end

#dump-autoload for project
composer_project "/srv/www/cellcontrol/current" do
    dev false
    quiet true
    action :dump_autoload
end