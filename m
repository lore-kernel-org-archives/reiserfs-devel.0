From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-sb
Date: Sat, 31 Aug 2002 18:40:49 +0400
Message-ID: <200208311840.49967.vitaly@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049BFF3D@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049BFF3D@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: berthiaume_wayne@emc.com, reiserfs-list@namesys.com


Hi, 

On Saturday 31 August 2002 00:49, berthiaume_wayne@emc.com wrote:
> 	Helllo Vitaly. Going through the reiserfsck manpage I see exit codes
> that tell me to use --fix-fixable and --rebuild-tree; however, I can't seem
> to find anything for --rebuild-sb. Outside of parsing stdout, is there
> another way to determine from an undocumented exit code the need for
> --rebuild-sb? 	While testing a double power failure scenario I was able to
> corupt the superblock and I'd like to automate my recovery scripts. So far
> we start with a reiserfsck -q --check /dev/<something> >> <some log file>
> and based on the exit code run a --fix-fixable or --rebuild-tree next. Your
> advice would be most appreciated.

rebuild-sb was not involved as in a half of cases people run reiserfsck 
on the partition that has never contained reiserfs. I do not think that 
you would like to get "rebuild-sb is needed" instead of "no reiserfs found" 
when running reiserfsck on your ext2 partition. rebuild-sb should be run on 
the partition only after you checked twice that the partition is correct.

-- 

Thanks,
Vitaly Fertman
