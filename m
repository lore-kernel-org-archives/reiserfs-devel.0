From: Lars Grobe <grobe@gmx.net>
Subject: Quota-patches for 2.4.20 conflict with evms (?)
Date: Thu, 12 Jun 2003 15:20:30 +0200 (MEST)
Message-ID: <21554.1055424030@www65.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Hi there,

just setting up a test machine, we got a recent kernel (2.4.20),
quota-patches
from ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20, the
newest evms (2.0.1) with the device-mapper patches (2.4.20-10).

When I make vmlinux, I get

fs/fs.o: In function `fsync_dev_lockfs':
fs/fs.o(.text+0x39f0): undefined reference to `DQUOT_SYNC'

, obviously a result from changes in the Quota-patches
05_quota-patch-2.4.15-1-2.4.16
that are to enable quota support for reiser.

So I wonder if anyone out there has been able to get reiserfs (3.x) with
quotas on
evms (2.x) - or am I really the first with this crazy idea?

CU Lars.

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!

