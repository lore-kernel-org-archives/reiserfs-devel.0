From: markw@osdl.org
Subject: AS performance with reiser4 on 2.6.3
Date: Thu, 26 Feb 2004 09:48:10 -0800 (PST)
Message-ID: <200402261748.i1QHmJE12429@mail.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: piggin@cyberone.com.au
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hi Nick,

I started getting some results with dbt-2 on 2.6.3 and saw that reiser4
is doing a bit worse with the AS elevator.  Although reiser4 wasn't
doing well to begin with, compared to the other filesystems.  I have
links to the STP results on our 4-ways and 8-ways here:
	http://developer.osdl.org/markw/fs/dbt2_stp_results.html

I noticed that __preempt_spin_lock was near the top of the profile and
about 2 times higher the with AS, compared to deadline.

I'm going to run through the other filesystems to see how the elevators
affect them.

-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
