From: Yury Umanets <umka@namesys.com>
Subject: Re: Autoconf error
Date: Wed, 30 Jul 2003 09:17:47 +0400
Message-ID: <1059542267.14095.11.camel@haron.namesys.com>
References: <3F255543.8010409@mrs.umn.edu>  <3F255920.3070804@mrs.umn.edu>
	 <1059455220.7235.13.camel@haron.namesys.com>
	 <1059459151.14479.5.camel@localhost>
	 <1059459291.27547.3.camel@haron.namesys.com>
	 <1059460212.1881.1.camel@localhost>
	 <1059460229.10291.0.camel@haron.namesys.com> <3F26C062.4070409@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F26C062.4070409@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

On Tue, 2003-07-29 at 22:43, Grant Miner wrote:
> Ok, I tried reiser4progs-0.4.10 with libaal-0.4.8, then used that 
> mkfs.reiser4 to make a fs.  Trying to mount, mount said "wrong mount 
> type, too many filesystems, etc." so I went back to the other snapshot 
> (libaal-0.4.7 and reiser4progs-0.4.9) and used that mkfs.reiser4.  After 
> that I could mount the filesystems!

Hello,

The problem probably is that, since 0.4.10 large keys are supported in
reiser4progs and they are used by mkfs as default key policy. But, you
also should enable large keys in reiser4 kernel code.

Or just use mkfs option --keys=SHORT

>   So I copied my system over to this 
> reiser4 fs and ran it a bit; so for it works great, no corruptions etc. 
>   Although stuff like "echo "500" > file/..uid" seemes to lock up the 
> file system requiring a reboot.

Probably mr. Nikita will comment this.

Thanks.

-- 
We're flying high, we're watching the world passes by...

