From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 03:16:37 +0400
Message-ID: <4828CFD5.7000408@gmail.com>
References: <loom.20080512T225740-889@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20080512T225740-889@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Mat wrote:

>Hi,
>
>sure,
>
>debugfs.reiser4 -p /dev/foo
>  
>

No, with the option "-p" debugfs.reiser4 (and other utilities
of reiser4progs package) prints the "default vector of plugins"
and doesn't look at /dev/foo..

Edward.

>should print everything needed
>
>Regards
>
>Mat
>
>--
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

