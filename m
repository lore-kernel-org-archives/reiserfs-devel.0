From: Edward Shushkin <edward@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Tue, 08 Apr 2003 14:10:44 +0400
Sender: edward
Message-ID: <3E92A024.3FCE40CF@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <3E8DD2C6.2040106@namesys.com> <3E91C59B.3823865C@namesys.com> <200304071836.04241.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Pierre Abbat wrote:
> 
> On Monday 07 April 2003 14:38, Edward Shushkin wrote:
> > Hans Reiser wrote:
> > > Edward Shushkin wrote:
> > > > On the
> > > >other hand, on the last seminar we made a conclusion to check key
> > > > validness in oredr to avoid a possible security hole when read() first
> > > > looks for uptodate (decrypted!) pages in memory before reading
> > > > encrypted data from disk..
> > >
> > > So how about making a key of 0 be a special case which gets you the file
> > > in its encrypted form?
> >
> > Let's rather use special flags of reiser4_open() system call, or something
> > else instead of new special keys.
> > So everyone want:
> > 1) To make cheap backup (without decryption/encryption been involved)
> >    of ciphertext possible.
> > 2) To make this       backup possible for everyone who has appropriate
> >    permissions but doesn't have a secret key.
> 
> If we have a special flag of the reiser4_open() call, it has to be
> encapsulated into a special program. We can't expect every program in the
> world to know how to do a reiser4_open.
> 

Sure, it will be so.. I didn't encapsulate it to not obscure main sense ;)

> If I understand right, encrypted files are compressed before encryption,

Yes.

> so they consist (usually) of blocks of <4K each with their start points every
> multiple of 4K.

Yes. To be precisely, multiple of cluster size, which is 4,8,16,32,..K

> A normal read() on a file like that will read as if the block
> were padded with zeros, 

Only if it is a hole. In accordance with current policy, the file system
recognize a hole cluster by absence of the item with appropriate offset,
so fast backup will write nothing but real compressed data

> I think we need a tar-like program that turns such a
> file of short blocks into some format that other programs can deal with.
