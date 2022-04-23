if [ "$TERM" = "linux" ]
then
    printf '\e]P0{{black}}'
    printf '\e]P1{{red}}'
    printf '\e]P2{{green}}'
    printf '\e]P3{{yellow}}'
    printf '\e]P4{{blue}}'
    printf '\e]P5{{magenta}}'
    printf '\e]P6{{cyan}}'
    printf '\e]P7{{white}}'
    printf '\e]P8{{black_br}}'
    printf '\e]P9{{red_br}}'
    printf '\e]PA{{green_br}}'
    printf '\e]PB{{yellow_br}}'
    printf '\e]PC{{blue_br}}'
    printf '\e]PD{{magenta_br}}'
    printf '\e]PE{{cyan_br}}'
    printf '\e]PF{{white_br}}'
fi
