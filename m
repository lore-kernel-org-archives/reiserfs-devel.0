From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Crash: the problem was DMA!
Date: Sat, 25 Jan 2003 17:15:16 +0100
Message-ID: <3E32B814.3070209@mb.tu-ilmenau.de>
References: <20030118100157.C5575@humilis> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 01/24/2003 11:28 PM, Francois-Rene Rideau wrote:
 > Dear reiserfs developers,
 >
 > here's an update on the trouble I had lately (the second disk crash):
 > the culprit was IDE DMA!
 >
[snip: success story && reiserfsck did a good job]
 >
 > PS: YES, my old kern.log's from before the BIOS update do show
 > hda: 240121728 sectors (122942 MB) w/2048KiB Cache, CHS=14946/255/63,
 > UDMA(66)
 > While the newer one lack the UDMA(66).
 > VP_IDE: VIA vt82c686a (rev 1b) IDE UDMA66 controller on pci00:04.1
 > In case anyone cares, that's an ASUS K7M motherboard.
 > Darn. I still have this performance bug - but at least, the
 > computer works.
 > Advice welcome, though it's becoming off-topic (so private message
 > might be more suited).

Hi!

Since I have this cheap Notebook (Clevo 8500V, Taiwan) I've been
fiddling to work around the buggy chipset and/or the buggy BIOS.

I have a
    VP_IDE: VIA vt82c686a (rev 22) IDE UDMA66 controller on pci00:07.1

and @ ide0:
    hda: 39070080 sectors (20004 MB) w/2048KiB Cache, CHS=2432/255/63,
         UDMA(66)
@ ide1:
    hdd: 35433216 sectors (18142 MB) w/418KiB Cache, CHS=35152/16/63,
         UDMA(66)
    hdc: ATAPI 24X DVD-ROM drive, 128kB Cache, UDMA(33)

BIOS settings do not have an effect to my disk configuration under
Linux. Under Win98 I get severe transfer timeouts when hdc has a wrong
(increased) UDMA setting in the BIOS.

I mainly use the following to configure my chipset/disks under Linux:
* Kernel: append = ide0=ata66 ide1=ata66 [...]
           config: CONFIG_BLK_DEV_VIA82CXXX=y
                   and the DMA related stuff, of course.
* hdparm @bootup:  -qB255qS0qW1qa16qd1qu1qK1qk1qX68 /dev/hda
                    -...                      ...X67 /dev/hdd
                    -qa16qd1qu1qK1qk1qX67 /dev/hdc
    (I know each of them is over-tuned in -X by at least  1 ...
     but so the hardware or kernel based max. settings stay on.
     If I issued values according to and higher than the max.
     rate I get "... not functional" errors but the original
     values remain)
   --> see ftp://sunsite.unc.edu/pub/Linux/system/hardware/ for
       the latest release of hdparm)
* powertweak settings
   --> http://powertweak.sourceforge.net/

(Some of the settings may be outdated by now, I've kept them "in
tradition". Oh, yes, and they may be dangerous!!! Backups...)

"cat /proc/ide/via" gives me some hints if I really misconfigured
something but it doesn't show real conditions concerning the transfer
rate.

I tried many ways to adjust the parameters in former times to get equal
rates for hda and hdd for testing purposes. But the transfer rate
relation between hda and hdd (based on "hdparm -t /dev/drivename" and
real world ReiserFS copy sessions) _always_ stays between 1.3 and 1.45 .


Maybe one setting shown above could at least release your machines
general performance.


Best wishes and happy testing,

Manuel


