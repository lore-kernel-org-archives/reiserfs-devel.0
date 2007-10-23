From: Dushan Tcholich <dusanc@absolutok.net>
Subject: Status after some cleanup patches
Date: Tue, 23 Oct 2007 19:54:04 +0200
Message-ID: <1193162044.6236.111.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser4 <reiserfs-devel@vger.kernel.org>

	Here it is what a total outsider can do for ~ 1 day. So all those who
want to get reiser4 in mainline have no more excuses to whine :), as
they can help if they want.

                                        errors  warnings
megapatch				-308	-533
[PATCH 1/8] as_ops.c cleanup            -2      -1
[PATCH 2/8] block_alloc.c cleanup       -11     -14
[PATCH 3/8] block_alloc.h cleanup       -2      -6
[PATCH 4/8] blocknrset.c cleanup        -6      -4
[PATCH 5/8] carry.c cleanup             -15     -9
[PATCH 6/8] carry.h cleanup             -51     -36
[PATCH 7/8] carry_ops.c cleanup         -28     -27
[PATCH 8/8] tree.c cleanup              -11     -8
[PATCH 9/8] carry_ops.h cleanup		-3	-1
[PATCH 10/8] context.c cleanup		-2	-2
[PATCH 11/8] coord.c cleanup		-41	-53
[PATCH 12/8] coord.h cleanup		-64	-31
[PATCH 13/8] debug.c cleanup		-1	 0
[PATCH 14/8] debug.h cleanup		-41	-12
[PATCH 15/8] dformat.h cleanup		-3	-1
[PATCH 16/8] dscale.c cleanup		-2	 0
[PATCH 17/8] dscale.h cleanup		-3	 0
[PATCH 18/8] entd.c cleanup		-3	 0
[PATCH 19/8] eottl.c cleanup		-3	-2
[PATCH 20/8] estimate.c cleanup		-6	-12
[PATCH 21/8] partial flush.c cleanup	-71	-346

				SUM=	-677	-1098
Current reiser4 2.6.22-2		2488	 2439
					_____________
Left to do:				1811(72%) 1341(55%)

Have fun

Dushan

PS. Get informed about what should be cleaned up upfront, as to not
overlap with other patches.

