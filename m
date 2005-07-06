From: "Doug Wicks" <doug@ccbill.com>
Subject: RE: reiser4 plugins
Date: Wed, 6 Jul 2005 15:52:43 -0700
Message-ID: <889A47B16278164FB657E0FFB1CAB8C7B729A3@hq-exchange.ccbill-hq.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Can you please take me off your email list? I have sent numerous emails
and still nobody will assist me.

Please, can you help me with this or should I contact your provider?

Doug@cavecreek.com

=20
Doug
=20

-----Original Message-----
From: Hans Reiser [mailto:reiser@namesys.com]=20
Sent: Tuesday, July 05, 2005 11:45 PM
To: Hubert Chan
Cc: Alexander G. M. Smith; ross.biro@gmail.com; vonbrand@inf.utfsm.cl;
mrmacman_g4@mac.com; Valdis.Kletnieks@vt.edu; ltd@cisco.com;
gmaxwell@gmail.com; jgarzik@pobox.com; hch@infradead.org; akpm@osdl.org;
linux-kernel@vger.kernel.org; reiserfs-list@namesys.com;
zam@namesys.com; vs@thebsh.namesys.com; ndiller@namesys.com;
ninja@slaphack.com; vitaly@thebsh.namesys.com
Subject: Re: reiser4 plugins

Hubert Chan wrote:

>On Tue, 05 Jul 2005 20:50:08 -0400 EDT, "Alexander G. M. Smith"
<agmsmith@rogers.com> said:
>
> =20
>
>>That sounds equivalent to no hard links (other than the usual parent
>>directory one).  If there's any directory with two links to it, then
>>there will be a cycle somewhere!
>>   =20
>>
>
>What we want is no directed cycles.  That is A is the parent of B is
the
>parent of C is the parent of A.  We don't care about A is the parent of
>B is the parent of C; A is the parent of B is the parent of C.
>
>OK, here's a random idea that just popped into my head, and to which
>I've given little thought (read: none whatsoever), and may be the
>stupidest idea ever proposed on LKML, but thought I would just toss it
>out to see if it could stimulate someone to come up with something
>better (read: sane):  Conceptually, foo/.... is just a symlink to
>/meta/[filesystem]/[inode of foo].
> =20
>
Except that we want the metafiles to go away when the base file goes
away.

>And a question: is it feasible to store, for each inode, its parent(s),
>instead of just the hard link count?
> =20
>
Ooh, now that is an interesting old idea I haven't considered in 20
years.... makes fsck more robust too....

