From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: fix problem of non-deletable directories
Date: Sun, 12 Oct 2014 13:43:39 +0200
Message-ID: <543A696B.5000408@gmail.com>
References: <5425C5FD.6020907@gmail.com> <CAL2jS+nSR9gc57sEhvhthkDB9oy16VhjQHmphKtcLz0568ogKA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=wjq5crXIBbQq2BUNCRxiOmPrGuOuI8o072cGqG8QUgI=;
        b=RWWyDiHzlW2DpWqtVVnuqWZs7mr5NoEMJQ3glGOq2uaZ3ZUwT6IpADJq/6gbCZNoEU
         sEOaSvakzAjUjR0cGHN1wlneRjWIrIUoDoFlmlXf1Sf0FovyFi1fYcl/nMWfK3xDqHqr
         6RTmHKK+Mu0gHoutI4/iCAKKMoMsP0+8iI5RpAnmAeSJCDRj2nmJEw1MhD2mg70/kJ6d
         VzwC98Fjn4dO3OCQyhvXOu5paxX0ymOnJkySHVZP9vEigr271p2CyDw4HA+gfC0RVoII
         /A7+DAyL8tACofH4gBGWoAf301cLBbyS7/6LUA0TlAWB+mBXYk1TSC6HPc+CidOYd6q0
         ZI3A==
In-Reply-To: <CAL2jS+nSR9gc57sEhvhthkDB9oy16VhjQHmphKtcLz0568ogKA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Evgeniy <iron.udjin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Thank *you* for the pattern. I used it to narrow down the problem.

Common comments: you have a large number of hash collisions on
your partition. It can lead to performance drop. I would recommend
to use tea hash in your case. This is not default and should be specified
by mkfs option "-o hash=tea_hash" when formatting a partition.

Not an urgent issue, juts FYI.

Thanks,
Edward.


On 09/27/2014 04:22 AM, Evgeniy wrote:
> Thank you very much, Edward. I was waiting for this patch a few years.
> :) I just tested it and seems it fixes the problem with non-deletable
> directories. I'll test it a week or two and I'll provide feedback
> about the problem.
>
> Thank you Edward and Ivan for your work, I'm really glad to see
> activity in development here.
>
> On 26 September 2014 23:01, Edward Shishkin <edward.shishkin@gmail.com> wrote:

