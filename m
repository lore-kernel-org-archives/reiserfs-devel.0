From: "Elias Ignacio Contreras" <enito@eudoramail.com>
Subject: PLZ HELP, my 160gb 's DANGER :(
Date: Sat, 01 Mar 2003 21:41:20 -0800
Message-ID: <OAHNNKPPIFJJIBAA@whowhere.com>
Reply-To: enito@eudoramail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Language: en
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi

sorry for my bad english, but im a bit dissapear for this situation. I have a strange trouble i show you with pastes of the weird situation.

First:
PDC20269: chipset revision 2
PDC20269: not 100% native mode: will probe irqs later
    ide2: BM-DMA at 0x9000-0x9007, BIOS settings: hde:pio, hdf:pio
    ide3: BM-DMA at 0x9008-0x900f, BIOS settings: hdg:pio, hdh:pio
hda: Maxtor 5T030H3, ATA DISK drive
hdb: ASUS CD-S520/A, ATAPI CD/DVD-ROM drive
hdc: HL-DT-ST GCE-8400B, ATAPI CD/DVD-ROM drive
hde: Maxtor 4G160J8, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
ide2 at 0xa400-0xa407,0xa002 on irq 5
hda: 60030432 sectors (30736 MB) w/2048KiB Cache, CHS=3736/255/63
blk: queue c037494c, I/O limit 4095Mb (mask 0xffffffff)
hde: 320173056 sectors (163929 MB) w/2048KiB Cache, CHS=317632/255/63, UDMA(133)ide-floppy driver 0.99.newide
Partition check:
 hda: hda1 hda2 hda3 hda4 < hda5 >
 hde: unknown partition table

you can see, hde, unknow partition!!

and i do this one:
[root@burrillo root]# reiserfsck --check /dev/hde

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --check started at Sun Mar  2 02:37:46 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished                               
Comparing bitmaps..finished

Checking Semantic tree:
finished                                                                       
No corruptions found
There are on the filesystem:
	Leaves 42644
	Internal nodes 296
	Directories 2391
	Other files 27519
	Data block pointers 39755577 (0 of them are zero)
	Safe links 0
###########
reiserfsck finished at Sun Mar  2 02:39:28 2003
###########

as i can see, all fine "weird" 

and look
[root@burrillo root]# fdisk -l /dev/hde

Disk /dev/hde: 255 heads, 63 sectors, 19929 cylinders
Units = cylinders of 16065 * 512 bytes

Disk /dev/hde doesn't contain a valid partition table


and ..the weirdo i can mount and see dirs and stuff 
with mount -t reiserfs /dev/hde /mnt/disk

what can be trouble system tell me now unknow partition?

plz help me im a bit dissaspear for lost my 160gb .(

thx a lot for take your time
enito










Need a new email address that people can remember
Check out the new EudoraMail at
http://www.eudoramail.com
