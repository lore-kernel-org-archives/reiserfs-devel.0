From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 13:06:57 +0300
Message-ID: <20040722100657.GC4990@nysv.org>
References: <40FE0B47.3010600@slaphack.com> <20040721063607.1A09015C92@mail03.powweb.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40FF3DAD.6020100@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Wed, Jul 21, 2004 at 11:08:13PM -0500, David Masover wrote:
>- have our own area inside 'metas' which is always local, to allow
>things like forcing particular files to always be in the cache

Hmm. This is interesting. Difficult to wrap my brain around it, though :))
Is it a bit like what I've understoon union mounts to be?
Where would this data be stored, if it's in metas? Stat data on the
local partition that's not bound to a specific file? Wouldn't fsck
now fix that as a broken fs?-)

>First question:  Can I manually enable/disable a particular plugin for a
>particular directory?  (like how cryptocompress is supposed to be...)

Sure, but for example with fibration you can't re-fibrate a directory.
You have to move the stuff out and back in after you've changed the
policy.

With tail policies you must access the file in order to get it moved
out of tails, if you change the formatting to never.

The Namesys Guys may want to correct me on those above notions, if
they're totally wrong.

>Second question:  Would such a setting be recursive?  Can I tell it
>whether to recurse or not?

Isn't this unimplemented, and called hsets? Hereditory Plugin Sets,
or something?

I think I read once that they are different plugins from the current
ones, so that you'd have to write them differently from normal plugins.
It must have been documented somewhere in the Reiser4 source code docs,
can't imagine where else they would have been, so I'll just refresh my
memory when I get home..

Anyway, setting propagation is important, but it's also important to
handle conditions like (cool, pseudo-sql! ;)
UPDATE formatting SET policy='never\0' WHERE policy='smart\0' RECURSE;
instead of just
UPDATE formatting SET policy='never\0' RECURSE;
which may break something else...

-- 
mjt

