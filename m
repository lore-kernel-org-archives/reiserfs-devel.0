From: Wolfgang Rohdewald <wolfgang@rohdewald.de>
Subject: file attributes destroyed.
Date: Sun, 26 Oct 2003 12:27:18 +0100
Message-ID: <200310261227.18711.wolfgang@rohdewald.de>
Reply-To: wolfgang@rohdewald.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

last night, some files and directories involved in starting bash went defec=
t:

$HOME had very wrong permissions
/etc/bashrc was empty

and a few more. I did not make notes, I was rather trying to fix that ASAP.

This never happened before. I am running an up to date debian unstable=20
with only ReiserFS and 2.4.22

Last night, the summer daylight saving ended. The modification time of
/etc/bashrc was 03:29, I believe.

Any ideas?

--=20

mit freundlichen Gr=FCssen

with my best greetings

Wolfgang Rohdewald

dipl. Informatik Ing. ETH Rohdewald Systemberatung
Karauschenstieg 4
D 21640 Horneburg
Tel.:     04163 826 819
Fax:      04163 826 828
Internet: www.rohdewald.de
