From: Mira Tempir <mira-list@cekit.cz>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Wed, 27 Nov 2002 14:38:35 +0100
Message-ID: <20021127133835.GA358@mail.cekit.cz>
References: <20021125143634.GC9006@mail.cekit.cz> <20021126225625.GB16567@mail.cekit.cz> <20021127103315.A3712@namesys.com> <200211271546.47417.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200211271546.47417.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Hi!

Vitaly Fertman - 27/11/02 15:46 napsal:
| 
| Did you run fsck some times during last days and you had the 
| same low speed, right?

Last night, I tried older r-fsck 3.6.2 (I was quite desperate)
and after 14hours, it was still more than 100 blocs per sec.
(which was great in comparison with current r-fsck, but still
not enough to rebuild whole FS in few weeks)

| memmove is called when an item is removed and when an objectid 
| is marked as used in objectid map. Backtraces say that it is 
| the second case here, strange. Could you run reiserfsck again, 
| wait for such a low speed and look at map->m_page_count and 
| map->m_used_slots_count from mark_objectid_really_used.
| 
| And it is strange also that there are so many wrong tails. 
| Which kernels did you use before? Which kernel do you think 
| you used when the most amount of files were created? 

I'm not sure about the first used with reiserfs, it could be
something like 2.4.1x, most files were created under 2.4.18 (and .17).


Thanks

-- 
   mira tempir <mira#cekit,cz> -- cekit s.r.o.
   bratislavska 2, 602 00 brno, czech republic

