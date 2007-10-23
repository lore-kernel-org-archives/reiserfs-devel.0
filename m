From: Edward Shishkin <edward@namesys.com>
Subject: Re: [PATCH 0/8] More cleanup of errors and warnings found by	checkpatch.pl
Date: Tue, 23 Oct 2007 16:38:52 +0400
Message-ID: <471DEB5C.2020608@namesys.com>
References: <1193141006.6236.22.camel@krshina3.gekom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1193141006.6236.22.camel@krshina3.gekom>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dusanc@absolutok.net
Cc: reiserfs-devel@vger.kernel.org

Ok,
I'll review it and we'll push them into -mm tree.

Thanks,
Edward.

Dushan Tcholich wrote:

>This series of patches removes some of the errors and warnings found by
>checkpatch in following files (reiser4 for 2.6.22-2):
>					errors	warnings
>[PATCH 1/8] as_ops.c cleanup		-2	-1
>[PATCH 2/8] block_alloc.c cleanup	-11	-14
>[PATCH 3/8] block_alloc.h cleanup	-2	-6
>[PATCH 4/8] blocknrset.c cleanup	-6	-4
>[PATCH 5/8] carry.c cleanup		-15	-9
>[PATCH 6/8] carry.h cleanup		-51	-36
>[PATCH 7/8] carry_ops.c cleanup		-28	-27
>[PATCH 8/8] tree.c cleanup		-11	-8
>				SUM=	126	105
>So now reiser4-for-2.6.22-2.patch with these and previous cleanup should
>be at 2054 errors and 1801 warnings, from 2488 errors and 2439 warnings
>in its orriginal form.
>
>These can be aplied independently of my previous cleanup megapatch.
>Patches aren't tested.
>
>Have a nice day
>
>Dushan
>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

