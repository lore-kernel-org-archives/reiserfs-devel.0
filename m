From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: Autoconf error
Date: Tue, 29 Jul 2003 13:43:46 -0500
Message-ID: <3F26C062.4070409@mrs.umn.edu>
References: <3F255543.8010409@mrs.umn.edu>  <3F255920.3070804@mrs.umn.edu>	 <1059455220.7235.13.camel@haron.namesys.com>	 <1059459151.14479.5.camel@localhost>	 <1059459291.27547.3.camel@haron.namesys.com>	 <1059460212.1881.1.camel@localhost> <1059460229.10291.0.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059460229.10291.0.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Ok, I tried reiser4progs-0.4.10 with libaal-0.4.8, then used that 
mkfs.reiser4 to make a fs.  Trying to mount, mount said "wrong mount 
type, too many filesystems, etc." so I went back to the other snapshot 
(libaal-0.4.7 and reiser4progs-0.4.9) and used that mkfs.reiser4.  After 
that I could mount the filesystems!  So I copied my system over to this 
reiser4 fs and ran it a bit; so for it works great, no corruptions etc. 
  Although stuff like "echo "500" > file/..uid" seemes to lock up the 
file system requiring a reboot.

