From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Snapshot against 2.6.1 released.
Date: Mon, 19 Jan 2004 19:22:49 +0300
Message-ID: <16396.1113.203997.785571@laputa.namesys.com>
References: <16395.60465.989777.981597@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16395.60465.989777.981597@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Nikita Danilov writes:
 > Hello,
 > 
 > new snapshot against 2.6.1 kernel is at
 > 
 > http://namesys.com/snapshots/2004.01.19/
 > 
 > look into READ.ME file for details.

Please also apply last-minute-fix.diff from there: it fixes some bug
that slipped into snapshot.

last-minute-fix.diff should be applied from fs/reiser4:

$ cd /somewhere/fs/reiser4
$ patch -p1 < /somewhereelse/last-minute-fix.diff


Sorry for this.

 > 

Nikita.
