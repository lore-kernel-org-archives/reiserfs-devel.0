From: =?windows-1252?Q?Xabo=20Garc=EDa?= <xabigf@gmx.net>
Subject: ReiserFS Root Filesystem mounts read-only.
Date: Thu, 29 Aug 2002 18:54:53 +0200
Message-ID: <QKWTUOYX2YWREA54E02X2U6343WRIGLJ.3d6e51dd@xoglar>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11345-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com

	After I exec the reiserfsck to correct some problems (--fix-fixable), I re=
tarted my
computer. The problem is that now the filesystem is mounted read-only at th=
e both time
(any init.d script is started). I look in /etc/fstab and /etc/lilo.conf, bu=
t this files
don't seem to be wrong. I don't know what is happening, because the reiserf=
sck --check
says that there isn't corruptions. =BFMay someone tell me what I need to do=
?. Thanks.


