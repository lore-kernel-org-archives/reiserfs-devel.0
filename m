From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Atomic filesystem or not
Date: Thu, 15 Jul 2004 14:34:21 +0200
Message-ID: <200407151434.23082.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

I tried to do a crash-test with Reiser4. I copied a 650 MB file from direct=
ory=20
A to directory B and pressed the reset buttom at approx 300 MB (the=20
testmachine has 256 MB RAM).=20

After reboot the 300 MB chunk was still in B.
I thougt it should be either there full or not at all? Or did I understand=
=20
something wrong? Does it work only with files < RAM? What's the difference=
=20
then?

Marcel
=2D-=20
=C3=9Cdv=C3=B6zlettel -- Mit freundlichen Gr=C3=BCssen,
Marcel Hilzinger
