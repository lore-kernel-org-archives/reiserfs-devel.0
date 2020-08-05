From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Date: Wed, 5 Aug 2020 12:51:41 -0700
Message-ID: <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com> <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ve0FhzqCgA+9QYmNyfddPNVbN293nU7Jwgp7NV82bPU=;
        b=cfHyS0DGB2cq5rPiD149Ll93B7yA7qPiySelNWAaUDOJtAyK3GXSHWgn7uDDGqCk1z
         Z1y9zWpOStGJHpYvR6PONBcDDxMmupVNiQEwvCghfd10X9FTZ347r/LGGFFeBCws4E9w
         mZpASVTSrMpzkz7myHqtqr20fcH5DMBwRTMOs=
In-Reply-To: <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hgntkwis@vfemail.net
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
>
> It's been over 1 week since I sent this into the reiserfs-devel mailing
> list. I'm escalating this as the kernel docs recommend.
> I'm still willing to help debug and test a fix for this problem.

The thing is, you're using an ancient 4.14 kernel, and a filesystem
that isn't really maintained any more. You'll find very few people
interested in trying to debug that combination.

You *might* have more luck with a more modern kernel, but even then
... reiserfs?

              Linus
