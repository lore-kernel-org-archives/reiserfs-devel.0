From: Davide Magatti <davmago@libero.it>
Subject: mounting partitions, system hangs on Replaying journal
Date: Tue, 29 Apr 2003 11:04:57 +0200
Message-ID: <200304291104.57287.davmago@libero.it>
Reply-To: davmago@libero.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello, i have a problem with a reiser partition after a blackout

partition in on 2 raid 0 ide disks (quantum 60GB ata 100)
(ataraid). Controller is an HPT 372, the driver (written by highpoint) works 
in scsi emulation, and it is loaded as a module. The array status is ok 

When it is loaded it saw all the partitions:

sda1 /boot ~50 MB
sda2 / ~ 15 GB
sda3 swap ~ 1 GB
sda4 extended:
sda5 (/usr) ~ 15 GB
sda6 (/opt) ~ 15 GB
sda7 (/home) and is the one with trouble. 75 GB

I can mount all partitions except for the /home (sda7) which was mounted 
during the blackout

When the system installed on the raid disks (Suse 8.0) try to mount the home 
it hangs on :
kernel: reiserfs: checking transaction log (device 08:07) ...

The other system (Slack 9) is on another disks (ide). When i try to mount 
sda7, hangs on the same message. The system slow down and i can't kill the 
mount process

yesterday i tried reiserfsck --check [as in man page] (from slackware) but the 
system hang on "Replaying journal" (i try to leave it for about 12 h but 
nothing happened). The load is gone to 3 and the system slow down a lot.

My question is:
can i recover data in any way?.

My idea, is mounting the device ignoring the journal, saving all the data and 
reinstalling the system (or at least formatting the partition)
Is it possible?
Thank you a lot  in advance
davide



