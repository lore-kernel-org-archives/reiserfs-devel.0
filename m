From: Daniel Khan <d.khan@ventigo.com>
Subject: Directory gone
Date: Mon, 07 Feb 2005 23:26:32 +0100
Message-ID: <4207EB18.3070902@ventigo.com>
Reply-To: d.khan@ventigo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello List,

I am maintaining a SuSE Box with Reiserfs 3.6 on board.
I tell the whole story - maybe someone detects some kind of pattern... :)

System:
2.4.21-169-athlon (SuSE OpenExchange Server)

Partitions:
/dev/sda5            /                    reiserfs   
defaults              1 1
/dev/sda6            /var                 reiserfs   
defaults,data=writeback,noatime 1 2
/dev/sda7            swap                 swap       
pri=42                0 0
/dev/hdb1            /shareall            reiserfs   
defaults              1 2

The sd* are IDE Disks connected to a 3ware IDE Raid controller.
The hdb1 is a spare disk connected to the IDE port.

The box was unstable from the beginning.
Sometimes the services didn't start because files and directories in 
/var/run were in a "zombie" state and even not deleteable by root. It 
was very much like described here: 
http://marc.theaimsgroup.com/?l=reiserfs&m=110735687324061&w=2
I fixed this with reiserfsck and blamed the customer for not rebooting 
properly.

Some months later the system locked down when mounting hdb1.
So I thought that I found the problem and removed the disk.
But I checked the disk on another system - everything was fine.
Anyway - hdb1 is a brandnew disk now.

Today the customer did a reboot because he wasn't able to use the samba 
shares anymore.
And ... /var/spool/ was nearly empty (/var/spool/cron was there - but I 
think it was recreated during service startup).
Everything - esp. all *imap Maildirs* are gone.

I unmounted the /var partition and did a reiserfschk - no corruptions - 
data still gone.

But dmesg shows strange errors for hdb1:

hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
end_request: I/O error, dev 03:41 (hdb), sector 132680
hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
ide0: reset: success

I know - I had no data loss on hdb1 - but maybe this points to the real 
problem(?)

I don't have much hope to recover the maildirs but I have to give some 
kind of information to the customer.
What happened? What can be done to prevent this in future?
I think it is a hardware problem - RAM, Motherboard, CPU?

Maybe someone has experience with this kind of worst case scenario?

Thanks in advance.

-- 
Daniel Khan


