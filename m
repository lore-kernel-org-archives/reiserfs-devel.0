From: Boyd Waters <bwaters+mac@aoc.nrao.edu>
Subject: Re: OT: Advice on SATA sought
Date: Mon, 29 Mar 2004 13:25:44 -0700
Message-ID: <414AF76E-81BF-11D8-9CD9-000A95C88606@aoc.nrao.edu>
References: <406605A4.7020903@edsons.demon.nl> <200403291943.NAA15551@unix1.cc.ksu.edu>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403291943.NAA15551@unix1.cc.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list <reiserfs-list@namesys.com>

I have had GREAT success with SATA on linux 2.6.0 using the 
sata_promise driver. I have two removable drive trays in a mini-tower, 
and I keep a number of Seagate 160GB drives in rotation. Hot-swap seems 
to WORK - that is, the driver does not lock up - I gracefully unmount 
the filesystem, pop the drive out of the tray, load the new drive, and 
mount the new filesystem. I am not using RAID... at the moment I'm 
using Reiser 3.6 on these but will test Reiser4 Real Soon.

I purchased mine from http://www.newegg.com

22-148-018    HD 160GB|SEAGAT ST3160023AS SATA     $134.00
17-121-114    MOBILERACK SATA KF-72 BEIGE RTL       $12.99
16-102-014    CONTROLLER|PROMISE Sata150 TX2+       $41.00

I would recommend getting the Promise TX4 rather than the TX2+ -- the 
TX2+ has only two SATA ports, two IDE. I intended to get the TX4, which 
has four SATA ports only. You can't daisy-chain SATA like you can with 
(some) SCSI or FireWire, so the TX2+ will support only two drives, not 
really enough for RAID.

  ~ boyd

