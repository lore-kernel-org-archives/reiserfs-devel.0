From: Russell Coker <russell@coker.com.au>
Subject: another IDE-DISK issue in 2.4.21-rc3
Date: Thu, 29 May 2003 23:53:38 +1000
Message-ID: <200305292353.39052.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

I have finally installed 2.4.21-rc3.  I compiled the base IDE driver into the 
kernel but make the ide-disk driver a module (to save RAM on machines without 
IDE hardware).

Following is a selection from the kernel message log.  As you can see I get 
some nasty and worrying error messages when the kernel tries to access 
/dev/hda before the ide-disk module is loaded.

If this is not a known bug then let me know so I can send it to linux-kernel.

ReiserFS seems to be working fine in 2.4.21-rc3.

Uniform Multi-Platform E-IDE driver Revision: 7.00beta3-.2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
PIIX4: IDE controller at PCI slot 00:07.1
PIIX4: chipset revision 1
PIIX4: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0x1c10-0x1c17, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0x1c18-0x1c1f, BIOS settings: hdc:pio, hdd:pio
hda: IC25N030ATCS04-0, ATA DISK drive
blk: queue c02a8680, I/O limit 4095Mb (mask 0xffffffff)
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Partition check:
 hda:end_request: I/O error, dev 03:00 (hda), sector 0
end_request: I/O error, dev 03:00 (hda), sector 2
end_request: I/O error, dev 03:00 (hda), sector 4
end_request: I/O error, dev 03:00 (hda), sector 6
end_request: I/O error, dev 03:00 (hda), sector 0
end_request: I/O error, dev 03:00 (hda), sector 2
end_request: I/O error, dev 03:00 (hda), sector 4
end_request: I/O error, dev 03:00 (hda), sector 6
 unable to read partition table
[boring stuff removed]
hda: attached ide-disk driver.
hda: host protected area => 1
hda: 58605120 sectors (30006 MB) w/1768KiB Cache, CHS=3876/240/63, UDMA(33)
 /dev/ide/host0/bus0/target0/lun0: p1 p2 p4 < p5 p6 p7 p8 >

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

