From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 13 May 2003 22:52:40 +0100
Message-ID: <5.2.0.9.2.20030513224724.01cc3d10@pop.tvnet.hu>
References: <3EB30852.6090402@netscape.net>
 <200305062134.42520.christian.mayrhuber@gmx.net>
 <1052250298.14612.235.camel@tiny.suse.com>
 <200305062156.27595.Dieter.Nuetzel@hamburg.de>
 <1052400685.14617.489.camel@tiny.suse.com>
 <20030512072943.GA21604@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EC0FE02.9030007@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list@namesys.com

wow could somebody make my mind a bit more clear: what patches to use 
exactly to have the more error less functioning with datalogging without 
quota? Manuel uses patches posted only on the mailing list but not present 
on suse.de or namesys.com apparently. is it better to use what he uses, or 
some of them are +- useless as not on namesys, or what happens exactly?
cheers,
greg

ps: what about iget5_locked? is it safe to use?

>Currently running 2.4.21-rc2 +
>
>patch-2.4.21-rc2.rfs01.m02-akpm-b_journal_head-1.diff
>patch-2.4.21-rc2.rfs02.m03-relocation-8.diff
>patch-2.4.21-rc2.rfs03.m04-reiserfs-sync_fs-4.diff
>patch-2.4.21-rc2.rfs04.m05-data-logging-37.diff
>patch-2.4.21-rc2.rfs05.m06-logging-export.diff
>patch-2.4.21-rc2.rfs06.m06-write_times.diff
>patch-2.4.21-rc2.rfs07.m09.kinoded-9.ML.diff
>patch-2.4.21-rc2.rfs08.m11.inode-dirty-for-kinoded.ML.diff
>patch-2.4.21-rc2.rfs09.m12.search_reada-4.diff
>patch-2.4.21-rc2.rfs10.iget5_locked_for_datalogging.namesys.noquota.diff
>preempt-kernel-rml-2.4.21-rc2-was-pre1-1.0.patch
>patch.mk.01.Makefile.diff
>patch.mk.02.r128_drv.diff
>patch.mk.03.2.4.21-rc2-Config.in.diff
>
>applied in this order.
>
>-
>rfs??=reiserfs, m??=Chris' patches, ML=posted to reiserfs-list only, mk=my 
>own needed changes


