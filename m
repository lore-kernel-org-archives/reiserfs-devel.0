From: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Sat, 08 Nov 2003 13:40:46 +0100
Message-ID: <m3vfpvav8x.fsf@toyland.sauerland.de>
References: <m3ptg42t8l.fsf@toyland.sauerland.de>
	<20031108101133.GS11516@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031108101133.GS11516@backtop.namesys.com> (Alex
	Zarochentsev's message of "Sat, 8 Nov 2003 13:11:33 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Alex!

> test-9/reiser3 works fine for us.  Your problems could be due to a bug in
> updated IDE driver, for example.  Do other filesystems (like ext2) work? 

I only have one big reiserfs partition, so I can't test it.

> Can you send a .config (from 2.6.0-test-9) and describe your hardware
> configuration to the reiserfs-dev@namesys.com mailing list?

Sorry, I did an "rm -rf" on the 2.6.x tree two days ago. I guess that
enabling TCQ was the mistake, as Quinn Harris pointed out.

-- 
Ciao, Sebastian
