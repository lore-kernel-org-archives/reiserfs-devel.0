From: berthiaume_wayne@emc.com
Subject: RE: --rebuild-sb
Date: Fri, 6 Sep 2002 18:13:47 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFF8C@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11391-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com

	I know which partitition I've targeted. I need to automate system
recovery. You provide exit codes to indicate the possible need for
--fix-fixable and --rebuild-tree which I'm able to key in on; however, for
when the superblock gets corupted after a power failure the only way to
detect the need to use --rebuild-sb will be an ugly parsing of the results
from reiserfsck --check. This results in ugly code and some uncertainty. If
an exit code 3, for instance, was issued I'd be able to quickly see I need
to do a reiserfsck --rebuild-sb to start the recovery of the system. 
Regards,
Wayne

"One man can make a difference, and every man should try."  - JFK


-----Original Message-----
From: Vitaly Fertman [mailto:vitaly@namesys.com]
Sent: Saturday, August 31, 2002 10:41 AM
To: berthiaume_wayne@emc.com; reiserfs-list@namesys.com
Subject: Re: [reiserfs-list] --rebuild-sb



Hi, 

On Saturday 31 August 2002 00:49, berthiaume_wayne@emc.com wrote:
> 	Helllo Vitaly. Going through the reiserfsck manpage I see exit codes
> that tell me to use --fix-fixable and --rebuild-tree; however, I can't
seem
> to find anything for --rebuild-sb. Outside of parsing stdout, is there
> another way to determine from an undocumented exit code the need for
> --rebuild-sb? 	While testing a double power failure scenario I was
able to
> corupt the superblock and I'd like to automate my recovery scripts. So far
> we start with a reiserfsck -q --check /dev/<something> >> <some log file>
> and based on the exit code run a --fix-fixable or --rebuild-tree next.
Your
> advice would be most appreciated.

rebuild-sb was not involved as in a half of cases people run reiserfsck 
on the partition that has never contained reiserfs. I do not think that 
you would like to get "rebuild-sb is needed" instead of "no reiserfs found" 
when running reiserfsck on your ext2 partition. rebuild-sb should be run on 
the partition only after you checked twice that the partition is correct.

-- 

Thanks,
Vitaly Fertman
