From: Josh Konkol <samba@guidemail.com>
Subject: Drive corruption (Times two)
Date: Mon, 17 Mar 2003 12:20:21 +0000 (UTC)
Sender: news <news@main.gmane.org>
Message-ID: <Xns934140A0FF091jkonkolguidemailcom@80.91.224.249>
Return-path: <reiserfs-list-return-13292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

This has happened to me twice now and I'm beginning to think there's 
something I"m missing.  I've googled the error messages and there just 
isn't much out there.

I'm running Suse 8.0. I lost power two weeks ago and it started giving me 
errors in the /var/log/message file:

Mar 17 02:27:14 nagios kernel: hda: dma_intr: status=0x51 { DriveReady 
SeekComplete Error }
Mar 17 02:27:14 nagios kernel: hda: dma_intr: error=0x40 { 
UncorrectableError }, LBAsect=862032, sector=283688
Mar 17 02:27:14 nagios kernel: end_request: I/O error, dev 03:03 (hda), 
sector 283688
Mar 17 02:27:14 nagios kernel: vs-13070: reiserfs_read_inode2: i/o 
failure occurred trying to find stat data of [107701 108504 0x0 SD]
Mar 17 02:28:20 nagios kernel: hda: dma_intr: status=0x51 { DriveReady 
SeekComplete Error }
Mar 17 02:28:20 nagios kernel: hda: dma_intr: error=0x40 { 
UncorrectableError }, LBAsect=862032, sector=283688
Mar 17 02:28:20 nagios kernel: end_request: I/O error, dev 03:03 (hda), 
sector 283688
Mar 17 02:28:20 nagios kernel: vs-13070: reiserfs_read_inode2: i/o 
failure occurred trying to find stat data of [107701 108504 0x0 SD]

The box is pretty busy and I figured it was in the middle of doing 
something when the power when out.  So I setup another box (exact same 
hardware).  Installed the same software on it (Nagios, MySQL, Apache).  
It ran fine for a week, THEN we lost power again.  Then the EXACT same 
things started happening on this box.  

I found somewhere on google where they said to run the badblocks command 
to see if there were any bad blocks.  I ran:

badblocks -s -o badblocks.hda /dev/hda

This produced a file with 569 lines in it so I guess there are a couple.

I also ran:

nagios:/usr/local # reiserfsck -V
reiserfsck 3.x.1b (2002)

Someone mentioned this was old, is that true ??

Any help is apprecaited !!!!

Josh

