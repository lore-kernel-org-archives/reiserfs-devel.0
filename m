From: David Masover <ninja@slaphack.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 01 Jul 2005 16:39:25 -0500
Message-ID: <42C5B80D.2050100@slaphack.com>
References: <OF23DC8299.F6F2200B-ON88257031.005B3A9B-88257031.00650D8F@us.ibm.com> <42C5A06F.40906@slaphack.com> <20050701211006.GA13311@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20050701211006.GA13311@wohnheim.fh-wedel.de>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Ric Wheeler <ric@emc.com>, Al Boldi <a1426z@gawab.com>, Chris Wedgwood <cw@f00f.org>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

J=F6rn Engel wrote:
> On Fri, 1 July 2005 14:58:39 -0500, David Masover wrote:
>=20
>>Bryan Henderson wrote:
>>[...]
>>
>>>What you'd really like is to fsync a multi-file unit of work (transa=
ction)=20
>>>-- and not just among open files.  You'd like to open, write, and cl=
ose=20
>>>1000 files in a single transaction and then commit that transaction,=
 with=20
>>>no syncing due to timers in the meantime.  If you're really greedy, =
you'd=20
>>>also ask for complete rollback if the system fails before the commit=
=2E
>>
>>Both of these are planned for Reiser4.  Or is it 4.1?
>=20
>=20
> Both are pretty trivial to implement for a tree-based fs like
> reiserfs.  Non-trivial is the user interface.  Not sure if sys_reiser
> is the answer to that.

It is intended to be, I think.  But sys_reiser has been pushed off to=20
4.1, last I checked.

 From the general attitude here, I'm guessing that it should *not* be=20
called sys_reiser.  We're already doing the meta-files interface for=20
doing anything we want to do with reiser, which means sys_reiser=20
currently only does two things:  allows simultaneous access to lots of=20
small files efficiently (versus open()-ing each of them), and=20
transactions.  While the two may or may not belong in the same system=20
call, I don't believe they should be Reiser-specific.
-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
