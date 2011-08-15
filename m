From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Any progress in fixing "block_alloc.c:151"?
Date: Mon, 15 Aug 2011 18:21:29 +0200
Message-ID: <4E494789.7040001@gmail.com>
References: <4E492FB9.3040501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4E492FB9.3040501@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 08/15/2011 04:39 PM, Ivan Shapovalov wrote:
> Hello,

Hello.

>
> is there any progress in fixing "kernel BUG at
> fs/reiser4/block_alloc.c:151" problem?
>
> I use reiser4 on my /home partition with cryptocompress regular file
> plugin.
> As of kernel 2.6.38, the bug still happens in data-intensive
> applications (amarok, firefox, nepomuk, etc).
> The 'estimate_dirty_cluster' patch didn't work for me, only delaying the
> appearance of problem.
>
> I guess it's somehow related to frequent fsync() calls in databases used
> by these applications..


I am trying to narrow down the problem. Debugging messages show problems
in the code, which performs compression on commit. TBH this code is
unclear and should be rewritten. Unfortunately I do have only weekends
for this, so it all long..

Thanks,
Edward.


>
> Thanks in advance,
> Ivan Shapovalov.
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

