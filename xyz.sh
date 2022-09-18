clear
echo "   1. Cài đặt"
echo "   2. Thay config"
echo "   3. Khởi động lại"
read -p "  Vui lòng chọn một số và nhấn Enter (Enter theo mặc định Cài đặt)  " num
 [ -z "${num}" ] && num="1"

    case "${num}" in
        1) apt update -y && apt install nginx -y && ufw allow 'Nginx HTTP'
        cd /etc/nginx/sites-available
        cat >default <<EOF
server {
        listen 80;
        location /4gsieure.net{
                proxy_pass http://127.0.0.1:1001;
                proxy_http_version 1.1;
                proxy_set_header Upgrade 4gsieure.net;
                proxy_set_header Connection "upgrade";
                proxy_set_header Host 4gsieure.net;
        }
        
        location /4g.giare.me {
                proxy_pass http://127.0.0.1:1000;
                proxy_http_version 1.1;
                proxy_set_header Upgrade 4g.giare.me;
                proxy_set_header Connection "upgrade";
                proxy_set_header Host 4g.giare.me;
        }
        location /4ghatde.com {
                proxy_pass http://127.0.0.1:999;
                proxy_http_version 1.1;
                proxy_set_header Upgrade 4ghatde.com;
                proxy_set_header Connection "upgrade";
                proxy_set_header Host 4ghatde.com;
        }
        
}
EOF
 systemctl restart nginx && systemctl enable nginx && systemctl status nginx
        
        
        ;;
        2) nano /etc/nginx/sites-available/default
        ;;
        3) systemctl restart nginx && systemctl enable nginx && systemctl status nginx
        ;;
        *) rm -f $HISTFILE && unset HISTFILE && exit
        ;;
    esac
