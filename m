From: Gorazd Golob <gorazdg@noviforum.si>
Subject: umount and sync delays
Date: Mon, 14 Mar 2005 13:45:20 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0503141338470.25427@dacun>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi!

I have strangely long delay (still waiting at the time) when unmounting or 
syncing partition with reiser4. At the same time writes are occuring to 
disk subsystem - when checking vmstat and of course checking disk activity 
light ;).

Why does it take so long and it will ever finish ?:)
I don't have debug enabled and I'm using 2.6.11-mm1 kernel. Partitions 
were formated with reiser4progs 1.0.4.

gorazd
