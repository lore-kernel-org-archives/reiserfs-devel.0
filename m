From: teague <teague@fourth-world.com>
Subject: reiserfs failure on linux 2.4.18
Date: Sat, 4 May 2002 00:39:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0205040037160.7627-100000@manray.fourth-world.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hey folks,

I'm running Reiserfs on a Maxtor 45 GB drive (7200 rpm).  I'm also running
linux 2.4.18.  I encountered a problem yesterday.  I rebooted the machine
and it was apparent that things were wrong with the fs.  I couldn't even
get past the inits.  I rebooted off an old Slackware (4.0) cdrom.  I've
run reiserfsck --rebuild-tree from different flavors of reiserfsprogs.

here are the errors i've received:

version 3.x.1c-pre2
during Pass 2 with 97845 left
direct2indirect: incorrect item found in 133809 block
IOT trap/Abort

version 3.x.1c-pre3
during Pass 2 with 99129 left
mark_block_used: (27895) used already
IOT trap/Abort

version 3.x.1c-pre3 (run #2)
during Pass 2 with 99125 left
mark_block_used: (33930) used already
IOT trap/Abort

I've included log files for the pre2 run (log.cp2) and from the pre3 run
(log.cp3).  I'll be more than happy to give you all the info you need to
help you solve this.  I'm looking at loosing 40G of data that I really
need.  Please keep me informed.

Thanks,

Michael

ps I initially tried to include my log files, but your mail server refused
to take anything of 40k.  I'll be happy to send them if you advise me how.

