From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Thu, 3 Aug 2006 15:58:11 +0200
Message-ID: <20060803135811.GA7431@merlin.emma.line.org>
References: <200607312314.37863.bernd-schubert@gmx.de> <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain> <44CF84F0.8080303@slaphack.com> <1154452770.15540.65.camel@localhost.localdomain> <44CF9217.6040609@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932450AbWHCN6X@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44CF9217.6040609@slaphack.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

On Tue, 01 Aug 2006, David Masover wrote:

> >RAID deals with the case where a device fails. RAID 1 with 2 disks can
> >in theory detect an internal inconsistency but cannot fix it.
> 
> Still, if it does that, that should be enough.  The scary part wasn't 
> that there's an internal inconsistency, but that you wouldn't know.

You won't usually know, unless you run a consistency check: RAID-1 will
only read from one of the two drives for speed - except if you make the
system check consistency as it goes, which would imply waiting for both
disks at the same time. And in that case, you'd better look for drives
that allow to synchronize their platter staples in order to avoid the
read access penalty that waiting for two drives entails.

> And it can fix it if you can figure out which disk went.

If it's decent and detects a bad block, it'll log it and rewrite it with
data from the mirror and let the drive do the remapping through ARWE.

> >Depending how far you propogate it. Someone people working with huge
> >data sets already write and check user level CRC values for this reason
> >(in fact bitkeeper does it for one example). It should be relatively
> >cheap to get much of that benefit without doing application to
> >application just as TCP gets most of its benefit without going app to
> >app.
> 
> And yet, if you can do that, I'd suspect you can, should, must do it at 
> a lower level than the FS.  Again, FS robustness is good, but if the 
> disk itself is going, what good is having your directory (mostly) intact 
> if the files themselves have random corruptions?

Berkeley DB can, since version 4.1 (IIRC), write checksums (newer
versions document this as SHA1) on its database pages, to detect
corruptions and writes that were supposed to be atomic but failed
(because you cannot write 4K or 16K atomically on a disk drive).

-- 
Matthias Andree
