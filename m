From: Denis Vlasenko <vda.linux@googlemail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Tue, 25 Jul 2006 17:08:13 +0200
Message-ID: <200607251708.13660.vda.linux@googlemail.com>
References: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932408AbWGYPIZ@vger.kernel.org>
In-Reply-To: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Cc: Mike Benoit <ipso@snappymail.ca>, Matthias Andree <matthias.andree@gmx.de>, Hans Reiser <reiser@namesys.com>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Monday 24 July 2006 23:51, Horst H. von Brand wrote:
> > Once the inodes ran out the entire system pretty much came to a
> > screeching halt.
> 
> Get a clue by for, apply to the vendor (for the design, or at the very
> least for not warning unsuspecting users)?
> 
> >                  We basically had two options, use ReiserFS, or find
> > another piece of software that didn't use tiny little files as its
> > database.
> 
> Or reconfigure the filesystem with more inodes (you were willing to rebuild
> the filesystem in any case, so...)

The fact that _many_ UNIX filesystem formats have inode number limit
(configurable only at mkfs time) doesn't make it a good design.

By the same virtue you may declare that it is okay to smoke
and drink lots of vodka. Why not? Sizable portion if population does that...

I, on the contrary, want software to impose as few limits on me
as possible.
--
vda
