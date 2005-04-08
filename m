From: Blaisorblade <blaisorblade@yahoo.it>
Subject: Re: [patch 1/1] reiserfs: make resize option auto-get new device size
Date: Fri, 8 Apr 2005 10:23:07 +0200
Message-ID: <200504081023.09343.blaisorblade@yahoo.it>
References: <20050408045553.278CA11B7FE@zion> <20050408081047.GX6211@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050408081047.GX6211@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, mtk-manpages@gmx.net

On Friday 08 April 2005 10:10, Alex Zarochentsev wrote:
> Hi,
>
> On Fri, Apr 08, 2005 at 06:55:50AM +0200, blaisorblade@yahoo.it wrote:
> > Cc: <reiserfs-dev@namesys.com>, <reiserfs-list@namesys.com>,
> > <mtk-manpages@gmx.net>
> >
> > It's trivial for the resize option to auto-get the underlying device
> > size, while it's harder for the user. I've copied the code from jfs.
> >
> > Since of the different reiserfs option parser (which does not use the
> > superior match_token used by almost every other filesystem), I've had to
> > use the "resize=auto" and not "resize" option to specify this behaviour.
> > Changing the option parser to the kernel one wouldn't be bad but I've no
> > time to do this cleanup in this moment.
>
> do people really need it?
Note we are speaking of 2 lines of code. And there's no point in omitting 
this.
> user-level utility reisize_reiserfs, being called w/o size argument,
> calculates the device size and uses resize mount option with correct value.
Yes, I know this. But the old versions (the one shipped on Mdk) didn't work 
for online resizing (this was verified by me with lots of warnings and a Oops 
on reiserfs code); in fact, this ability is so new that is not even 
documented in manpages.
-- 
Paolo Giarrusso, aka Blaisorblade
Linux registered user n. 292729
http://www.user-mode-linux.org/~blaisorblade


