From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Some questions about pseudo files
Date: Wed, 9 Jun 2004 06:23:05 +0200
Message-ID: <200406090623.05825.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS List <reiserfs-list@namesys.com>

To change the permissions of a filesystem object without chmod one can use

echo 0777 > my_object/metas/rwx

This works great for directory objects, but if I want to change the=20
permissions of a simple file from 744 to 644, then I can't change it any mo=
re=20
without chmod, as the file lacks the x bit, so I can't chdir to metas and I=
=20
can't read rwx.

Is reiser4 designed for keeping the execution bit for each file? If yes, is=
n't=20
this a security problem (e.g. worms and viruses)?

*************
my_object/metas/nlink lists the object hard links. In case of directories
it's some time a dozen or even more. As there are no hard links in this=20
directory, what does nlink list?


Thanks,
Marcel


=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
