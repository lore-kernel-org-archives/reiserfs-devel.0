From: Tom Vier <tmv@comcast.net>
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Tue, 29 Oct 2002 21:32:17 -0500
Message-ID: <20021030023217.GA9548@yzero>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net>
 <15801.26994.705639.374241@laputa.namesys.com>
 <20021025200014.A1763@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20021025200014.A1763@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, Oct 25, 2002 at 08:00:14PM +0400, Oleg Drokin wrote:
> > I guess we should address this issue in reiser4. This is -security-
> > feature after all. Hans? It is not clear how to intehgrate this with
> > journalling though.
> 
> Zero out all freed blocks (mount option). This will kill write performance
> though.

you could add support for the +s attr. zero-out current contents on delete.
it's sloppy, but like hans said, anyone serious about it should never let it
hit the disk unencrypted.

i'm the author of (one) wipe (aka ya-wipe, there's more than one "wipe") and
i made a point to be clear in the docs and on wipe.sf.net that encryption is
the only complete solution. my app is most useful for using on whole drives,
if you're going to sell it on ebay or something, and you want non-secret
personal stuff off (or at least invisible to almost all).

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
