From: Oleg Drokin <green@namesys.com>
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Wed, 30 Oct 2002 09:36:28 +0300
Message-ID: <20021030093628.A5560@namesys.com>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net> <15801.26994.705639.374241@laputa.namesys.com> <20021025200014.A1763@namesys.com> <20021030023217.GA9548@yzero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021030023217.GA9548@yzero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Oct 29, 2002 at 09:32:17PM -0500, Tom Vier wrote:
> > > I guess we should address this issue in reiser4. This is -security-
> > > feature after all. Hans? It is not clear how to intehgrate this with
> > > journalling though.
> > Zero out all freed blocks (mount option). This will kill write performance
> > though.
> you could add support for the +s attr. zero-out current contents on delete.

That won't work with editors that create temporary file, write new content into
it and then rename that temp file into new one.

> i'm the author of (one) wipe (aka ya-wipe, there's more than one "wipe") and
> i made a point to be clear in the docs and on wipe.sf.net that encryption is
> the only complete solution. my app is most useful for using on whole drives,

Another one (for deleted data to stay deleted) is to zero out all freed blocks
;)

> if you're going to sell it on ebay or something, and you want non-secret
> personal stuff off (or at least invisible to almost all).

Is that somehow better than badblocks -w /dev/hdX ? ;)

Bye,
    Oleg
