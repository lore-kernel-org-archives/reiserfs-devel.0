From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 13:23:44 +0200
Message-ID: <3EFD7AC0.10902@g-house.de>
References: <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030628095847.GA19610@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Well, looking at this metadata dump, I cann reasonably assure you that
> this dump was taken from fs that was written to without first applying
> the patch I sent. (same block, zero, block, zero pattern in indirect items)

?
should i have missed something? this is bad; so just now i've fetched a 
vanilla 2.5.70, patched ist up to 2.5.72 and applied your patch (again).
damn, will take another 3h to compile now.

> In other mails you write that now you see only some of files are differs
> (as opposed to every file gets corrupted). Or may be there is a pattern
> like "files less than 8k in size are uncorrupted and everything bigger
> is corrupted"?

hm, the fact that not _all_ files get corrupted was written in some 
early mail of mine:

[from 20.06.2003]
 > lila:~# cp -a /lib/ /var/cache/apt-proxy/temp/ | wc -l
 >     329
 > lila:~#
 >
 > (with sde2 mounted on /var/cache/apt-proxy/ (reiserfs).
 > then i did:
 >
 > lila:~# diff -r /lib/ /var/cache/apt-proxy/temp/lib/ | wc -l
 >      62
 > lila:~#

i just wanted to repeat that, because when you asked me to copy only 2 
files to the fs, then do the debugreiserfs, the 2 files were not corrupted!

> So can I look at the debugreiserfs -d output for the filesystm where
> that happens (and I want to know filename of a corrupted file too).

ok, i'll provide this information right after the compile finished.

> My own alpha boot attempts are doomed it seems. the kernel I build on alpha itself
> jumps to address zero before starting init. Hm. Or may be it is just unhappy with gcc 3.2.2,
> time to build gcc 2.95.3 there, it seems.

do you still have my .config file ? on my Avanti the option 
"CONFIG_ALPHA_LEGACY_START_ADDRESS=y" was somehow important to get the 
alpha even started. and perhaps CONFIG_ALPHA_SRM=y too.

Thanks,
Christian.

