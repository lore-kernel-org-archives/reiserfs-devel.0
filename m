From: =?ISO-8859-1?B?Sm9z6SBBLiBHdXpt4W4=?= <jose@iteso.mx>
Subject: quotas in 2.4.20
Date: Fri, 24 Jan 2003 21:02:02 -0600
Message-ID: <1043463722.3e31fe2a3e267@correo.iteso.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12486-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS List <reiserfs-list@namesys.com>


 Hi everyone,
 Hi Oleg!

 I'm trying to get quotas working on 2.4.20.
 So far they seem to work ok with the dec-3-2002 patches from:=20
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20/=20
with CONFIG_QFMT_V2.

 However the patch from jan-22-2003 in:=20
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/01-iput-deadlock-=
fix.diff
does not apply on top of the testing/quota-2.4.20 patches.

 Also, when compiling a 2.4.20 kernel with testing/quota patches and the la=
test
evms 1.2.1 patches, compilation stops with:
fs/fs.o: In function `fsync_dev_lockfs':
fs/fs.o(.text+0x31a8): undefined reference to `DQUOT_SYNC'


  Are the testing/quota patches recommended for a production box with 2.4.2=
0?
(Debian 3.0, quota 3.08)

  Is there a way to get EVMS working with quotas?


  Thanks!


Jos=E9



---

