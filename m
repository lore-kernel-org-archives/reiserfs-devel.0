From: Bastian Kruse <reiserfs@postdienst.net>
Subject: Is it a bug or not?
Date: Tue, 30 Sep 2003 06:59:49 -0700 (PDT)
Message-ID: <20030930135949.F318D3984@sitemail.everyone.net>
Reply-To: reiserfs@postdienst.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com, bastian@postdienst.net

Hello,
I have tried:
dd if=3D/dev/hda bs=3D6400k | gzip -v1 > /windows/bak/hda.img=20
After it the reiserfs is broken on /dev/hda3 which is root and I can not re=
pair it using reiserfsck --rebuild-tree or --fix-fixable
System is as follows:
/dev/hda1 : ntfs
/dev/hda2 : ntfs
/dev/hda3 : reiserfs (/)
/dev/hda4 : swap
/dev/hdb1 : reiserfs (mounted at /windows/bak/)
I don=C2=B4t think that I=C2=B4m using the latest reiserfsprogs, as Suse 8.=
1 is installed. I would like to accent that the problems arise when I reboo=
t after I have copied an image to /windows/bak and that no data is written =
back from the image to /dev/hda sofar.
Bastian
P.S. dd if=3D/dev/hda of=3D/dev/hdb bs=3D6400 works great without any probl=
ems. Both harddisk can be used as wished containing the same data.

_____________________________________________________________
Registrieren auch Sie Ihre kostenlose Email-Adresse bei <a href=3D"http://w=
ww.postdienst.net" target=3D"_top">postdienst.net</a><br>Internet-Services =
by Herbert Krems<p><a href=3D"http://www.schadenbearbeitung.de" target=3D"_=
top">schadenbearbeitung.de</a><br><a href=3D"http://www.praxisleitfaden.de"=
 target=3D"_top">Praxisleitfaden bei Versicherungsschaden</a><br><a href=3D=
"http://www.hilfsprojekte.de" target=3D"_top">Private Hilfsprojekte</a><br>
