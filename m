From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patches and todo list
Date: Sun, 08 Jan 2012 17:13:24 +0100
Message-ID: <4F09C0A4.1000109@gmail.com>
References: <28ea2828ed5cb6c7b01630c1aa548a67@mail.velocitynet.com.au>	<4F05AB45.5020003@gmail.com>	<CAJZSrNKytiwVW_0oVmeck=e+jw2NRimAW38OKvWu3QiKb+w5zg@mail.gmail.com>	<4F09B7F2.5030804@gmail.com> <CAJZSrNLmtNDcm=FyqwQQKdo4jQ71NBN_n=GwA=NC2saZG73bww@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=dLi/arMemNrZVEf4p0ZjPmX8Z0gCduzIznejvpdvZzU=;
        b=AVsYaFqBzYMplsqW1KHLcLjapOsS+I7AQoG6Fozu0BpXwSZxabGR8eB/GX3iXBREM6
         AuOv8Gj87Z1oKkIMW3pbwq1oGaNOry4TMZDzYdAkk8ORMlZJxiqEk9ONnJfqyGHbzY2P
         VobrbvXVlTYov3UrdokWZiqq1ewTKCgm1Dr+8=
In-Reply-To: <CAJZSrNLmtNDcm=FyqwQQKdo4jQ71NBN_n=GwA=NC2saZG73bww@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Horne <daniel.horne@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

[...]
On 01/08/2012 04:43 PM, Daniel Horne wrote:
>
>
>         Your patch for 2.6.39-1 seems to compile fine on 3.0, but not on
>         3.1 or
>         3.2. The problem seems to be that the patch re-adds the
>         PF_FLUSHER flag
>         to the sched.h, as it relies on it, but on 3.1 and on that
>         flag's value
>         is used for the PF_NPROC_EXCEEDED flag.
>
>         I'd be tempted to to swap the PF_FLUSHER check for PF_SWAPWRITE,
>         as all
>         kthreads that set PF_FLUSHER also set PF_SWAPWRITE, but there'd
>         be some
>         false-positives there and I'm not sure what effect this would have.
>
>
>     Hello Daniel,
>
>     I don't see any PF_FLUSHER flag in vanilla 3.2, so it shouldn't
>     be an issue.
>
>     There is one more problem with 3.X. I have described it here:
>     http://marc.info/?l=reiserfs-__devel&m=132603099732236&w=2
>     <http://marc.info/?l=reiserfs-devel&m=132603099732236&w=2>
>
>     Thanks,
>     Edward.
>
>
>
> There isn't a PF_FLUSHER, but the value it used to have is now defined
> as PF_NPROC_EXCEEDED.

Ah, you are right.

> I suppose we could define PF_FLUSHER to be 0x00080000, as that doesn't
> seem to be taken.

Yes, that's the way.
We need to make sure that task is a flusher, so I think using
PF_SWAPWRITE for this purpose is not a good idea..

Thanks!
Edward.
