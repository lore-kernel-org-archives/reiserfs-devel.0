From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 21:59:16 +0300
Message-ID: <3E5D0E84.1000403@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1> <200302261914.29475.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302261914.29475.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: berthiaume_wayne@emc.com, philippe.gramoulle@mmania.com, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>Hi,
>
>tests shown that almost all the time was spent on reading bitmap blocks.
>And the same reading is done at mount time actually.
>
>  
>
Hmmm, I wonder if it is really making all the drives work actively when 
reading those bitmaps, or if instead something needing optimizing is 
happening?

If it is the bitmap blocks that are taking the 48 seconds, then your 
recent changes are acceptable.

-- 
Hans


