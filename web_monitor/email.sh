echo "To: aep00010@mix.wvu.edu
Subject: Updates found on site
From: aheperera@gmail.com
Content-Type: text/html; charset=\"utf8\"

<html>
<body>

An update was found in the follow <a href=$1>$1</a><br>
Check it out !

</body>
</html>" > /tmp/mail.txt

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
  --mail-from 'aheperera@gmail.com' --mail-rcpt 'aep00010@mix.wvu.edu' \
  --upload-file /tmp/mail.txt \
  --user 'aheperera@gmail.com:<app_password>'
