From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 19:14:29 +0300
Message-ID: <200302261914.29475.vitaly@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: berthiaume_wayne@emc.com, philippe.gramoulle@mmania.com
Cc: reiserfs-list@namesys.com

On Wednesday 26 February 2003 18:12, berthiaume_wayne@emc.com wrote:
> Philippe, how many files were on the partition?
> Regards,
> Wayne.

Hi,

tests shown that almost all the time was spent on reading bitmap blocks.
And the same reading is done at mount time actually.

-- 

Thanks,
Vitaly Fertman

> Hi Vitaly,
>
> here is an output of reiserfsck -a on a ~550 Gb Raid5 array filled about
> 60%.
>
> # df /dev/sdb1
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sdb1            572418604 335826568 236592036  59% /prod
>
>
> #  reiserfsck -V
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.5-pre2
>
>
> # time reiserfsck -a /dev/sdb1
> Reiserfs super block in block 16 on 0x811 of format 3.6 with standard
> journal
> Blocks (total/free): 143109020/59148009 by 4096 bytes
> Filesystem is cleanly umounted
> Replaying journal..
> 0 transactions replayed
> Checking internal tree..finished
>
> real    0m47.890s
> user    0m6.668s
> sys     0m0.732s
>
> Hope that helps.
>
> Thanks,
>
> Philippe
>

