From: prymitive@pcserwis.net
Subject: Re: reiser4 stability
Date: Sat, 26 Nov 2005 23:14:45 +0100 (CET)
Message-ID: <1419.127.0.0.1.1133043285.squirrel@pcserwis.net>
References: <4388A592.40103@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4388A592.40103@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS List <reiserfs-list@namesys.com>

> has improved a lot since the VFS changes moved all the furniture to the
> left side of the room, but there are currently problems with NFS support.

I tried yesterday 2.6.14 with reiser4 patch from namesys, it's build into
the kernel as I use it for / so I didn't applied module patch, I had
oopses during compile/heavy usage so I switched back to 2.6.13, it's
perfectly stable. Good thing that reiser4 is data lose proof, I had power
losts, kernel oopses, hard locks but I never lost a single file, that
makes testing reiser4 quite safe now (I had corrupted r4 partitions but
that was way back in the past, once it was caused by repacker).
Any news about inclusion to vanilla? I didn't noticed any new email about
current status for some time.

=A3ukasz Mierzwa

