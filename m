From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Wed, 26 Jul 2006 13:26:44 +0200
Message-ID: <20060726112644.GB18329@merlin.emma.line.org>
References: <200607242151.k6OLpDZu009297@laptop13.inf.utfsm.cl> <200607251708.13660.vda.linux@googlemail.com> <20060725204910.GA4807@merlin.emma.line.org> <44C6A390.2040001@slaphack.com> <20060726112039.GA18329@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750942AbWGZL0s@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060726112039.GA18329@merlin.emma.line.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 26 Jul 2006, Matthias Andree wrote:

> But the assertion that some backup was the cause for inode exhaustion on
> ext? is not very plausible since hard links do not take up inodes,
> symlinks are not backups and everything else requires disk blocks. So,
> since reformatting ext2/ext3 to one inode per block is possible
> (regardless of disk capacity), I see no way how a reformatted file
> system might run out of inodes before it runs out of blocks.

OK; ext2/ext3 require 1k blocks, but still you need heaps of files < 1k
to run out of inodes without running of space.

-- 
Matthias Andree
