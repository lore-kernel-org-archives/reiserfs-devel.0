From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Comparison of notail and notail,iicache(14) 2.4.19-pre7
Date: Thu, 25 Apr 2002 00:25:32 +0200
Message-ID: <3CC730DC.1000602@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi all!

I tried the patch linux-2.4.19p6-iicache-new-14.patch on 2.4.19-pre7 in 
addition to Olegs first speedup patches, some AA and AKPM ones and made 
a comparison of my backup timings:

/dev/hda11             5550248   4804584    745664  87% /mnt/beta

noatime,notail:
---------------
to udma-33       real   9m46.648s   user 0m1.970s   sys 1m45.070s
                         7.800 MB/s      (used FS)
			
back to udma-66  real  11m 7.432s   user 0m1.940s   sys 1m43.530s
                         7.030 MB/s      (unused FS)
	
noatime,notail,iicache (new-14):
--------------------------------
to udma-33       real   9m38.230s    user 0m1.970s   sys 1m48.670s
                         8.114 MB/s      (unused FS)
                                  +1.45% rate (first copy)
				
back to udma-66  real  10m54.870s    user 0m2.230s   sys 1m46.280s
                         7.165 MB/s      (unused FS)
	                         +1.92% rate (second copy)
020424 23:55


File size distribution statistics are available upon requst.


Thanks
and best wishes,


Manuel

