From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Wed, 26 Jul 2006 13:20:39 +0200
Message-ID: <20060726112039.GA18329@merlin.emma.line.org>
References: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl> <200607251708.13660.vda.linux@googlemail.com> <20060725204910.GA4807@merlin.emma.line.org> <44C6A390.2040001@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932241AbWGZLUm@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44C6A390.2040001@slaphack.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 25 Jul 2006, David Masover wrote:

> Matthias Andree wrote:
> > On Tue, 25 Jul 2006, Denis Vlasenko wrote:
> > 
> >> I, on the contrary, want software to impose as few limits on me
> >> as possible.
> > 
> > As long as it's choosing some limit, I'll pick the one with fewer
> > surprises.
> 
> Running out of inodes would be pretty surprising for me.

No offense: Then it was a surprise for you because you closed your eyes
and didn't look at df -i or didn't have monitors in place.

There is no way to ask how many files with particular hash values you
can still stuff into a reiserfs 3.X. There, you're running into a brick
wall that only your forehead will "see" when you touch it.

Of course, different sites have different needs and if you need
gazillions of inodes or file names, you may see trouble.

But the assertion that some backup was the cause for inode exhaustion on
ext? is not very plausible since hard links do not take up inodes,
symlinks are not backups and everything else requires disk blocks. So,
since reformatting ext2/ext3 to one inode per block is possible
(regardless of disk capacity), I see no way how a reformatted file
system might run out of inodes before it runs out of blocks.

-- 
Matthias Andree
