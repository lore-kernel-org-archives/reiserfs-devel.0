From: Lars Grobe <grobe@gmx.net>
Subject: Re: Quota-patches for 2.4.20 conflict with evms (?)
Date: Thu, 12 Jun 2003 15:54:34 +0200 (MEST)
Message-ID: <9457.1055426074@www65.gmx.net>
References: <1055425043.2059.6.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christophe Saout <christophe@saout.de>
Cc: reiserfs-list@namesys.com

Hi!

> Did you get any rejects while applying the patches (look for .rej files
> with find -name \*.rej)?

No rejects...

> What patches did you exactly try to apply?

Clean 2.4.20
+Patches:
everything from
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20
diskmapper: 2.4.20-dm-10
evms-2.0.1
bonding-patches for 2.4

> If the only problem is in fs/buffer.c: [...]
> change the DQUOT_SYNC to DQUOT_SYNC_DEV in this file.

Thank you, the kernel compiled with that! (I will know soon if it works,
too...)

CU Lars.

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!

