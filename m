From: Cliff White <cliffw@osdl.org>
Subject: Re: build failure 11/05 snapshot
Date: Mon, 11 Nov 2002 12:53:12 -0800
Message-ID: <200211112053.gABKrDf29415@mail.osdl.org>
References: <Nikita@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Nikita Danilov <Nikita@namesys.com> 
   of "Mon, 11 Nov 2002 22:03:36 +0300." <15823.65288.345634.69230@laputa.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@namesys.com>
Cc: Cliff White <cliffw@osdl.org>, reiser@namesys.com, reiserfs-list@namesys.com, reiserfs-dev@namesys.com, cliffw@osdl.org

Code now builds, module will not install:

 modprobe reiser4
/lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: unresolved symbol 
balance_dirty_pages
/lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: unresolved symbol 
page_states__per_cpu
/lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: insmod 
/lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o failed
/lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: insmod reiser4 failed
-------------
Will be re-trying on a different machine.
Will try to build reiser4 into the kernel this time.
cliffw


