From: Spam <spam@tnonline.net>
Subject: Re: [patch] Repacker stats
Date: Fri, 22 Oct 2004 19:38:03 +0200
Message-ID: <1378615689.20041022193803@tnonline.net>
References: <200410202159.46110.sikkh@wp.pl>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200410202159.46110.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


  Hello,

  I was interested in testing the repacker statistics tool that Piotr
  Neuman wrote (and others later added to). But from what I can see
  the repacker is disabled in 2.6.9-rc4-mm1, because of this patch:

     http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc4/2=
.6.9-rc4-mm1/broken-out/reiser4-disable-repacker.patch

  Is there something wrong with the repacker that is has to be
  disabled?

  ~S
 =20
> Hi

> This is my second attempt at repacker statistics, this time based on comm=
ents
> from Alex Zarochentsev (thanks ;-).

> This patch allows reading of repacker stats while it is working. It creat=
es
> two files in repacker sysfs hierarchy: formatted_nodes and unformatted_no=
des,
> which correspond to the stats that repacker prints after it has finished.

> Download:

> http://kem.p.lodz.pl/~peter/reiser4_repacker_stats-2.patch

> Regards

> Piotr Neuman
=B4

--=20

