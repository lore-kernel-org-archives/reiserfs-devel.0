From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Wed, 25 Jun 2003 15:17:42 +0200
Message-ID: <3EF9A0F6.4030401@g-house.de>
References: <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030625054031.GA11576@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Try to compile with CONFIG_REISERFS_CHECK=y the kernel that known-bad for you.
> (e.g. 2.5.72/2.5.73)
> 
yes, 2.5.72 with CONFIG_REISERFS_CHECK=y is compiling now.

over night the alpha finished compiling 2.5.65 and 2.5.69. i had to 
compile reiserfs statically, inserting modules gave these "Invalid 
module format" errors.

under both (2.5.65+2.5.69) i was able to mkreiserfs sde2. mounting the 
fs went ok, but copying data (cp -a /lib /mnt/reiserfs) brought several 
kernel-errors (see https://ephigenie.kicks-ass.net/browse/reiserfs/).

but: diff -r showed _no_ differences betweeen the directories, a 
following reiserfsck brought no vpf-10680 anymore!

so i'd say the problem occurs somewhere between 2.5.69 and 2.5.70.

thanks,
Christian.

