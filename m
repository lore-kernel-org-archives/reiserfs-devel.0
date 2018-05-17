From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/6] vfs: change inode times to use struct timespec64
Date: Wed, 16 May 2018 21:13:05 -0400
Message-ID: <CAK8P3a0d6j2KF+pSZQ5uM3jQ7=OZQXnc+ZjPb--52kdBV=k_vQ@mail.gmail.com>
References: <20180512045921.18311-1-deepa.kernel@gmail.com>
 <20180512045921.18311-7-deepa.kernel@gmail.com> <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
 <CABeXuvpi_dm6TE3pH_KGehgNwW177hJFBmR8u29w6KJH1aA1Kg@mail.gmail.com>
 <CAGXu5jJpO+z8k_=UuVY9WAeiEgABQg4gWE6nz82BX0_UhaPUWw@mail.gmail.com>
 <CABeXuvrO5XLD5QhBPui-v_G6JX=FgcaZLOL0C6B40f4oCyqOWg@mail.gmail.com>
 <CAGXu5jLdPMK_EN5wekwbusaKzYOwsFCsFmy7coOEqxB-sGv+JQ@mail.gmail.com> <CABeXuvomY6EYxdPrbMymqBkw0fnYernvOhU0R9By0aKihHYTuA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=XwK4G7sLLHgZWTVSPkYAMgOchcQRKswxmnx7hCJVTmU=;
        b=M5mRYzJGhDfO8Yu0wDkbm9gfK126qia7K93oByfHehgofoOTBf3QaykTcO1Q9BG3Ua
         PSkWYBYkhlaaBqo6wsGCQUzAaJ69rvUrkoK+a51iDbX5ZSByYTh7kD02k2bxQON7oY/s
         iB5QTvd87iJTlMMf6z1HVrUqb+Btwz7GdxgmTEa2BW9LBdAVKozRfVQHv7KpHXub72j9
         OJg+oKt/Yn52NUn56Ctb7dvjzoE9XxSbMu823t0mSlrnYPItiBZNz8mkjG8Di8/N8ziF
         QsjLEJWY/cH7ecG9xENi6unrhe9BDG3EG/9am9WanAJOsNTOGFWvAGWK6SfENDNsz/4Y
         AThQ==
In-Reply-To: <CABeXuvomY6EYxdPrbMymqBkw0fnYernvOhU0R9By0aKihHYTuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, anton@tuxera.com, Felipe Balbi <balbi@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, "Darrick J. Wong" <darrick.wong@oracle.com>, David Howells <dhowells@redhat.com>, David Sterba <dsterba@suse.com>, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mike Marshall <hubcap@omnibond.com>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, Jiri Slaby <jslaby@suse.com>, Mark Fasheh <mark@f>

On Mon, May 14, 2018 at 2:23 PM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Mon, May 14, 2018 at 10:53 AM, Kees Cook <keescook@chromium.org> wrote:
>> On Mon, May 14, 2018 at 10:25 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>>> On Mon, May 14, 2018 at 9:30 AM, Kees Cook <keescook@chromium.org> wrote:
>>
>> Can we do something like:
>>
>> #if __BITS_PER_LONG == 64
>> # define TVSEC_FMT "%ld"
>> #else
>> # define TVSEC_FMT "%lld"
>> #endif
>>
>> so we can do stuff like:  sprintf(buf, "seconds: " KTIME_FMT, time->tv_sec)
>>
>> ? It seems easier to clean up than casts.
>
> We have already introduced these casts in many places now.
> It would be easier to do the clean up if they all follow a similar
> pattern. ( I could probably write a coccinelle script that is not very
> long).
> But, it would be not much trouble if you wanted to follow this for pstore.
>
> We also contemplated adding a format specifier for time. But, I think
> we deferred it until we have a uniform way of using time internally.

I have recently submitted a patch to completely remove the hack that
leads to 'timespec64' and 'timespec' being aliases for the same type on
64-bit architectures. Once that goes in, we can just remove the type casts
that got added over time, and won't need a format macro.

        Arnd
