From: Steven <stevenaaus@yahoo.com>
Subject: Re: Hi Reiserfs-dev
Date: Sun, 31 Aug 2008 18:20:52 -0700 (PDT)
Message-ID: <234710.28013.qm@web53212.mail.re2.yahoo.com>
References: <48B4A3C9.2090508@acm.org>
Reply-To: stevenaaus@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48B4A3C9.2090508@acm.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

> > even though reiser4's tail packing always got me excited.
> Actually, tail _conversion_ (not packing).

Is this correct ? - R3 has tail packing , and tail coversion is
one of the major new features in R4. What is "tail
conversion" ?

> As I understand it, on an IDE drive, a barrier is pretty
> slow because it forces a full write queue flush, does the
> write, then flushes the queue *again* before continuing.
> On a real SCSI device with tagged queuing this works much
> more quickly because it can continue to issue disk

Looking briefly at the 2.6.24 doco and my dmesgs, it's not
obvious if barriers are used by default.  Is it be advisable
to mess around with barriers=0 on a sata drive (/dev/sda).
Are sata drivers totally different to ide and real scsi ?

Steven

------------------------

[ I can't find much stats in /proc. For reference, here's dmesg:

scsi0 : sata_via
scsi1 : sata_via
ata1: SATA max UDMA/133 cmd 0x9800 ctl 0x9c00 bmdma 0xa800 irq 11
ata2: SATA max UDMA/133 cmd 0xa000 ctl 0xa400 bmdma 0xa808 irq 11
ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
ata1.00: HPA detected: current 976771055, native 976773168
ata1.00: ATA-7: SAMSUNG HD502IJ, 1AA01109, max UDMA7
ata1.00: 976771055 sectors, multi 16: LBA48 NCQ (depth 0/32)
ata1.00: configured for UDMA/133
ata2: SATA link down 1.5 Gbps (SStatus 0 SControl 300)
scsi 0:0:0:0: Direct-Access     ATA      SAMSUNG HD502IJ
1AA0 PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] 976771055 512-byte hardware sectors (500107 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 0:0:0:0: [sda] 976771055 512-byte hardware sectors (500107 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sda: sda1 sda2 sda3 < sda5 sda6 sda7 sda8 > sda4
sda4: <bsd: sda9 sda10 >
sd 0:0:0:0: [sda] Attached SCSI disk
sd 0:0:0:0: Attached scsi generic sg0 type 0

My mobo is a k8vm800m (VIA K8M800 Chipset. VIA VT8237 Chipset).  ]


      
