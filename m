From: Tom Vier <tmv@comcast.net>
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Wed, 30 Oct 2002 02:14:33 -0500
Message-ID: <20021030071433.GA824@yzero>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net>
 <15801.26994.705639.374241@laputa.namesys.com>
 <20021025200014.A1763@namesys.com> <20021030023217.GA9548@yzero>
 <20021030093628.A5560@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20021030093628.A5560@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, Oct 30, 2002 at 09:36:28AM +0300, Oleg Drokin wrote:
> On Tue, Oct 29, 2002 at 09:32:17PM -0500, Tom Vier wrote:
> > > > I guess we should address this issue in reiser4. This is -security-
> > > > feature after all. Hans? It is not clear how to intehgrate this with
> > > > journalling though.
> > > Zero out all freed blocks (mount option). This will kill write performance
> > > though.
> > you could add support for the +s attr. zero-out current contents on delete.
> 
> That won't work with editors that create temporary file, write new content into
> it and then rename that temp file into new one.

true. it has several problems. i think ext2 still doesn't support it,
either.

> > i'm the author of (one) wipe (aka ya-wipe, there's more than one "wipe") and
> > i made a point to be clear in the docs and on wipe.sf.net that encryption is
> > the only complete solution. my app is most useful for using on whole drives,
> 
> Another one (for deleted data to stay deleted) is to zero out all freed blocks
> ;)

yes. you could make that a mount option, but i think it would be pointless.
if the data is that important, encrypt it. if it isn't, but it needs to be
wiped, wipe it when you get rid of the drive.

> > if you're going to sell it on ebay or something, and you want non-secret
> > personal stuff off (or at least invisible to almost all).
> 
> Is that somehow better than badblocks -w /dev/hdX ? ;)

yes, it's suppost to be. i personally wouldn't put my life on the line that
guttman's or anyone else's wipe patterns are any better than random data,
but some gov agency require drives be wiped using certain algorthyms (the
next version of my wipe is planned to include at least a few). the thing is,
even random data, overwritten 100 times, it's still theoretically possible
to retrieve the plaintext (random head offset, bad sector reallocation,
etc). i consider it just a matter of money. if someone wants to get data off
a drive, it's probably primarily a matter of time and money. the technology
to do atomic level imaging is there.

i highly recommend people read peter guttman's paper. i have a copy on my
site, his seems to have been moved:

http://wipe.sf.net/secure_del.html

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
