From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: Terrible performance (<100kb/sec) in a cp -Raf
Date: Mon, 14 Jun 2004 16:20:32 +0200
Message-ID: <20040614162032.62bf86b5@rayanne>
References: <oyd4qpee0fv.fsf@bert.cs.rice.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <oyd4qpee0fv.fsf@bert.cs.rice.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le 14 Jun 2004 08:25:24 -0500, Scott A Crosby <scrosby@cs.rice.edu> a =E9cr=
it
:

> Hello, as part of a planned migration of my computer from ext3 to
> reiserfs I experienced terrible performance. I was running a stock
> linux 2.6.6 kernel on AMD XP-2500+ CPU with 1.5gb of RAM.
>=20
> I was copying about 26 gigabytes from an IDE hard drive to an external
> USB HD when the bulk copy (cp -Raf) appeared to freeze. The HD did
> nothing other than grind itself back and forth. Stracing the copy
> operation showed the write() syscall blocking.

With 2.6.5, I had to apply this patch to avoid firewire misbehaving
(Oopsing, in my case) :

http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D108114119220175&w=3D2

Since I cannot find this code in 2.6.6 either, I guess the patch is still
relevant.

Firewire support doesn't look too solid in 2.6.x yet.
