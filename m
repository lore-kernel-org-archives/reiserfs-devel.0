From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 crash
Date: Thu, 25 Nov 2004 20:48:32 +0200
Message-ID: <20041125184832.GI26192@nysv.org>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi> <1101369249.1628.13.camel@tribesman.namesys.com> <20041125221919.2180794b.hihone@bigpond.net.au> <20041125112343.GG26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041125112343.GG26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cal <hihone@bigpond.net.au>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Thu, Nov 25, 2004 at 01:23:43PM +0200, Markus T=F6rnqvist wrote:
>
>I don't remember if I mentioned it, but there were two patches
>from Piotr Neuman's -cko that were required by Reiser4 (according
>to him) but seemed to patch well onto vs's patched system...
>
>Can anyone give any info on this?
>Mr. Neuman for example :)

I checked the patches, from Piotr's broken-out cko3 which he kindly
gave me.

#needed by reiser4
make-tree_lock-an-rwlock.patch.bz2=20
invalidate_inodes-speedup.patch.bz2=20

What are those? Are they merged?

I'm gonna try the second reiser4 for 2.6.9 patch PROBABLY today,
as it seemed to contain something beyond the transaction patch
vs sent later, but so far the current setup has been working well.

Great work, guys!

--=20
mjt

