From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Wed, 25 Jun 2003 02:42:24 +0200
Message-ID: <3EF8EFF0.6020207@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF888B2.4000900@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Christian Kujau schrieb:
> of course, the best thing i can do is the el-cheapo-hacking approach: 
> compiling 2.5.60...up to 2.5.72 and see *when* it breaks. hm, compiling 
> a 2.5 kernel takes 180min on this machine. but anyway, i'll start with 
> 2.5.60 now, see what it gives.

no, i started with 2.5.66 but the kernel did not compile. 2.5.65 did 
compile (don't ask how long....) and has already booted. but trying to 
mount the newly created reiserfs gives:

module reiserfs: Relocation overflow vs section 9

in the log. the reiserfs module was not loaded. "modprobe reiserfs" gives:

lila:~# modprobe reiserfs
FATAL: Error inserting reiserfs 
(/lib/modules/2.5.65/kernel/fs/reiserfs/reiserfs.ko): Invalid module format
lila:~# uname -a
Linux lila 2.5.65 #4 Wed Jun 25 00:48:46 CEST 2003 alpha GNU/Linux

i compiled the module with CONFIG_REISERFS_CHECK=y.

shall i go on with 2.5.64 or better 2.5.67 ?

good night,
Christian.

