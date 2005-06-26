From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 12:21:52 -0500
Message-ID: <42BEE430.7010505@slaphack.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <42B8BB5E.8090008@pobox.com> <42B8E834.5030809@slaphack.com> <20050622053656.GB28228@infradead.org> <42B91764.1080208@slaphack.com> <20050626165246.GB18942@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050626165246.GB18942@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christoph Hellwig wrote:
> On Wed, Jun 22, 2005 at 02:46:44AM -0500, David Masover wrote:
> 
>>>>There's been sloppy code in the kernel before.  I remember one bit in
>>>>particular which was commented "Fuck me gently with a chainsaw."  If I
>>>>remember correctly, this had all of the PCI ids and the names and
>>>>manufacturers of the corresponding devices -- in a data structure -- in
>>>>C source code.  It was something like one massive array definition, or
>>>>maybe it was a structure.  I don't remember exactly, but...
>>>
>>>
>>>Every device driver has a big array of corresponing device ids as an
>>>array in C code - oh my god we're doomed  .. not.
>>
>>I could throw the same sarcasm back at you.  We must be doomed because
>>Reiser does some stuff that VFS already does!  Or am I misunderstanding
>>the complaint?
> 
> 
> I rather wanted to say I absolutely don't see any correlation of your
> PCI driver example to what we're discussing here.  PCI driver hardcode
> ID tables because they are supposed to do that.  And if a PCI driver works
> around hardware bugs for a specific subset of hardware it needs to use
> an ID table for that one aswell.  And adding a strong comment about broken
> hardware is considered to be just fine in Linux kernel land aswell.

I seem to remember the comment was more about hardcoded ID tables.

And this was the generic ID code database, which is now maintained out
of the kernel:

/usr/share/misc/pci.ids
	A list of all known PCI ID's (vendors, devices, classes and sub-classes).

That is what I was referring to, that used to be in the kernel.

What this has to do with is whether you believe that it's better to keep
code out until it's perfectly clean, or to let in code that has some
things about it that you don't like, but works, is useful, and the
maintainers seem very willing to fix it later on.

I believe it's better to let stuff in so long as it works and doesn't
break anything, so long as it is being improved to the *real* standards
along the way.  But, this opinion obviously isn't shared by most people
here, so I'm going to stop arguing it now.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQr7kMHgHNmZLgCUhAQIHdg/+M0ExRndz9Wym0rTcnSjlg4dc3cM5ZW7N
LZ1lcLM+4Vtwsj16dc9ezNj7VLAx7Vmj/3afW3TxmjQKn50J53ZlTfd6HgpBvkAi
i3V7syjYJg/WaqOlEWCDwO3i/HzYdd9QAgJBbL30g56/ZtJj6SNFlKvb6UizYjIf
dHgY/ZG3BuUKLBTQFUaFuBmkb/eHlhZAq7qbwn6om3bR9UmjDr41l6nP/Ry9k438
gKvwNUQZX9EkQK/F34uDM8S1bbqt8YBcULbUBYp6A12kTL8dLS3Ax8TMbHK0Zxk1
OAMpel7e9kVUbC+NAGv2PRgJQEL4jDzwWS8kP12oBbeacxRnwj1WAKixBM+3v+uq
ThGwcN8CXCfPW8DBokzqYw32vVA+PVpz3tCmnVyobPPPQZdZ5wlKTgZ+Yg4NCp+M
WstSf/LE6OjVIH7xjVLBeZGuynmXHshuEubwRwaiHJKp9kUli+WEpJconvR0W3ph
4WQ6/7px64XxOPnxfR7jjSCNVKjzEZjeXOf1LbJF0a8yh6eVd5g1lsxYS3Ht04w3
yEup3PKWkhvIlGZw8w7IxR4fDI80/t4F9EugILJMLDwMwvJ1k5rRWrEpzF1/I6OM
wdq99cj380B600peLWZ1PIQpqb0iDj+FBqio/MIQSz4Pqlg7qaME21kI8PHxIPib
kJUIRwlarKA=
=TNGY
-----END PGP SIGNATURE-----
