From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: AS performance with reiser4 on 2.6.3
Date: Thu, 26 Feb 2004 21:02:56 +0300
Message-ID: <16446.13520.5837.193556@laputa.namesys.com>
References: <200402261748.i1QHmJE12429@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402261748.i1QHmJE12429@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: markw@osdl.org
Cc: piggin@cyberone.com.au, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

markw@osdl.org writes:
 > Hi Nick,
 > 
 > I started getting some results with dbt-2 on 2.6.3 and saw that reiser4
 > is doing a bit worse with the AS elevator.  Although reiser4 wasn't
 > doing well to begin with, compared to the other filesystems.  I have
 > links to the STP results on our 4-ways and 8-ways here:
 > 	http://developer.osdl.org/markw/fs/dbt2_stp_results.html

There were no changes between 2.6.2 and 2.6.3 that could affect reiser4
performance, so it is not clear why numbers are so different. Probably
results should be averaged over several runs. Also can you run test with

http://www.namesys.com/snapshots/2004.02.25/extra/e_05-proc-sleep.patch

applied? To use it turn CONFIG_PROC_SLEEP on (depends on
CONFIG_FRAME_POINTER), and do "cat /proc/sleep" before and after test
run.

 > 
 > -- 
 > Mark Wong - - markw@osdl.org

Nikita.
