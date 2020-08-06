From: Hgntkwis@vfemail.net
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Date: Wed, 5 Aug 2020 20:01:29 -0400
Message-ID: <20200805200129.0ce62f36@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
 <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
 <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=cBlIM0iIpgAS
        X6jPln2dXnKmSot3xYQw5rrzWqdwnv0=; b=pOFgYIUDmYq69NxF5liShlVHkkmJ
        9VKnD/ITItMtUMg8ZrgAaI428h29oPUGJ6vOjpU7qupJ2l4UcbiXgb5Hhy5z9kl+
        qIHXF3/Bt4v2qq0lXjE7zKY0oysJsJzuyCPxxd0aYew9v4UtGWq2hazMN9t3Z5P1
        ceIdwo7XYnsA4BI=
In-Reply-To: <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Wed, 5 Aug 2020 12:51:41 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
> >
> > It's been over 1 week since I sent this into the reiserfs-devel
> > mailing list. I'm escalating this as the kernel docs recommend.
> > I'm still willing to help debug and test a fix for this problem.  
> 
> The thing is, you're using an ancient 4.14 kernel, 

Sorry, I didn't realize kernel development went that fast.
I did try to go to the 5.X series, but the AMDGPU drivers don't work on
my SI card anymore (I need to bisect which takes time and many re-boots
to find the problematic commit).
I'll try the Radeon-SI driver and see if I can reproduce this reliably.

> and a filesystem
> that isn't really maintained any more. You'll find very few people
> interested in trying to debug that combination.
> 
> You *might* have more luck with a more modern kernel, but even then
> ... reiserfs?
> 
>               Linus
> 

Why does no one (I've met others who share a similar sentiment), like
reiserfs? I'm not looking for fight, I'm incredulous. It's a great FS
that survives oops-es, power failures, and random crashes very very well.
It's the only FLOSS FS with tail packing.

Thanks,
David
