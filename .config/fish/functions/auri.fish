function auri -a pkg_name  --description "Install AUR package"
    set url https://aur.archlinux.org/cgit/aur.git/snapshot/"$pkg_name".tar.gz 
    
    curl -sO "$url" && tar -xvf "$pkg_name".tar.gz && cd "$pkg_name" && makepkg --noconfirm -si && cd .. && rm -rf "$pkg_name" "$pkg_name".tar.gz ;
end
