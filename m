From: Matt Stegman <matts@ksu.edu>
Subject: Re: OT: Advice on SATA sought
Date: Mon, 29 Mar 2004 13:08:32 -0600 (CST)
Message-ID: <200403291943.NAA15551@unix1.cc.ksu.edu>
References: <406605A4.7020903@edsons.demon.nl>
Return-path: <reiserfs-list-return-17576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406605A4.7020903@edsons.demon.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello,

I've got four WD2000JD drives on a Promise SATA TX4, and they work great.  I
haven't seriously tested the hot swap, although removing and replacing an
unmounted, unused drive seems to work just fine.  But I haven't even tried
swapping in a different sized drive than what I remove.  Now, I also have an
onboard VIA SATA controller on the MSI motherboard... the install kernel
hard locked when probing the controller while a disk was attached.  So I'm
not using that one at all.

SUSE Linux 9 is installed, using SUSE's 2.4.21 kernel, so I don't know if
the 2.6 kernel from kernel.org will support it the same.

FYI - the max streaming bandwidth I get from the software RAID5 array is
~90MB/s reading (single disk read maxes at ~50MB/s).  I can't remember the
write bandwidth, and I appear to have deleted or lost my statistics file.  I
wonder if I'm not hitting the practical limit of a 32-bit/33MHz PCI bus.  So
if you need greater bandwidth, you may want to look into 64-bit PCI.  Maybe
a hardware RAID controller, too - I understand that usually performs better
than the software RAID.

--
Matt Stegman
