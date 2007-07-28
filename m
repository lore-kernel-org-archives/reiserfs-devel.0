From: Edward Shishkin <edward@namesys.com>
Subject: reiser4-for-2.6.22-2.patch
Date: Sun, 29 Jul 2007 00:54:00 +0400
Message-ID: <46ABACE8.4050306@namesys.com>
References: <loom.20070728T013136-358@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20070728T013136-358@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Mat wrote:

>I compiled a 2.6.22-based kernel with this patch & ran some tests with default
>reiser4 today - all I can say:
>
>you guys did an excellent job!
>there's no corruption anymore, reiser4 feels rockstable & fast as always
>
>thanks a lot :)
>
>(I will test cryptcompress later, probably during the weekend & post if I
>encounter any significant problems which I don't expect to happen :) )
>  
>

Yes, please.. Have the latest patch:
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.22/reiser4-for-2.6.22-2.patch.gz
(it fixes some problems in the case when compression is enabled _and_ debug
option is on).

Thanks,
Edward.

>keep up the good work!
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

