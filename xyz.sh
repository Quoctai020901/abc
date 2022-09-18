clear
echo "   1. Cài đặt"
echo "   2. Thay config"
echo "   3. Khởi động lại"
read -p "  Vui lòng chọn một số và nhấn Enter (Enter theo mặc định Cài đặt)  " num
 [ -z "${num}" ] && num="1"

    case "${num}" in
        1) apt update -y && apt install nginx -y && ufw allow 'Nginx HTTP'
        cd /etc/nginx/sites-available
        rm -rf default
       wget https://raw.githubusercontent.com/Quoctai020901/abc/main/default
 systemctl restart nginx && systemctl enable nginx && systemctl status nginx
        
        
        ;;
        2) nano /etc/nginx/sites-available/default
        ;;
        3) systemctl restart nginx && systemctl enable nginx && systemctl status nginx
        ;;
        *) rm -f $HISTFILE && unset HISTFILE && exit
        ;;
    esac
