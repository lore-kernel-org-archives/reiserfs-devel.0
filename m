From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Tue, 25 Feb 2003 19:41:31 +0300
Message-ID: <200302251941.31941.vitaly@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C071E@CORPUSMX1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C071E@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

On Tuesday 25 February 2003 19:25, berthiaume_wayne@emc.com wrote:
> Vitaly, how does "check-followed-by-fixable" in 3.6.3 compare to
> "-a" at boot in 3.6.5?

First, 3.6.3 is quite old version and many bugs were fixed since then,
you should update it.

When you run reiserfsck-3.6.5-pre2 -a, it does a few light-weight checks
- check some fields in the super block, replay the journal, bitmap, if 
the last block of the fs is readable, and just 2 upper levels of internal 
tree are checked. It is supposed to take not more then a few seconds.

reiserfsck in check mode goes through the whole internal tree, not just 
2 levels, checking nodes structure and links between them, and then (if 
there is no fatal corruptions) does semantic check - goes through the 
whole tree of directories checking them and checking all files. 
This takes more time.

-- 

Thanks,
Vitaly Fertman
