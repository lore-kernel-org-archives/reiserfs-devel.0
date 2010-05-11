From: Bernhard Sadlowski <sat06@mat.mohn.bertelsmann.de>
Subject: Re: No mount of reiserfs 3.6 after power loss
Date: Tue, 11 May 2010 14:10:15 +0200
Message-ID: <201005111410.15708.sat06@mat.mohn.bertelsmann.de>
References: <201005101803.15557.sat06@mat.mohn.bertelsmann.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <201005101803.15557.sat06@mat.mohn.bertelsmann.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Am Montag 10 Mai 2010 schrieb Bernhard Sadlowski:
> Hello,
>
> I have trouble to mount a reiserfs 3.6 filesystem after a power loss. It is
> living on a md raid1 (2xSATA) with cryptsetup. I have used this setup for
> years without any problem so far. With "strings" I see data and text inside
> the /dev/mapper/... device, so it seems the data could be intact.
>
> [139977.209415] REISERFS (device dm-2): found reiserfs format "3.6" with
> standard journal
> [139977.209852] REISERFS (device dm-2): using ordered data mode
> [139977.214845] attempt to access beyond end of device
> [139977.214858] dm-2: rw=0, want=18401083744, limit=1781801088
> [139977.214870] REISERFS warning (device dm-2): sh-459 journal_init: unable
> to read journal header
> [139977.247350] REISERFS warning (device dm-2): sh-2022
> reiserfs_fill_super: unable to initialize journal space
>
> I found also a mail with similiar content from 5/2009 but no solution:
> http://marc.info/?l=reiserfs-devel&m=124143380020910&w=2
>
> I can break the mirror and experiment with the second copy.

Everything is fine again! I can mount the filesystem again. Solution for
my issue and to the issue above was, that the wrong cipher was used. 

I did an upgrade of debian/sid and got updates for the kernel 2.6.32 and
for cryptsetup to version 1.1.0. Probably the default cipher did change
without notice. After a power loss and reboot this problem occured, but
it was not the power loss itself.

Bernhard
