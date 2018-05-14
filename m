From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH 6/6] vfs: change inode times to use struct timespec64
Date: Mon, 14 May 2018 10:25:06 -0700
Message-ID: <CABeXuvrO5XLD5QhBPui-v_G6JX=FgcaZLOL0C6B40f4oCyqOWg@mail.gmail.com>
References: <20180512045921.18311-1-deepa.kernel@gmail.com>
 <20180512045921.18311-7-deepa.kernel@gmail.com> <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
 <CABeXuvpi_dm6TE3pH_KGehgNwW177hJFBmR8u29w6KJH1aA1Kg@mail.gmail.com> <CAGXu5jJpO+z8k_=UuVY9WAeiEgABQg4gWE6nz82BX0_UhaPUWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=G2XsUxKaW76IkM7zC3ywVLkBFjrUf8WtN8273hRxdD0=;
        b=BJzvEn94fewSSQIL7KKTjoEz2Z5Flrn19cXi5VEmZ8Vd4b2B6Flhn0Ie38CtkqBuP1
         gSDSH3Lyr4XfNMoi2Wp2SZhxlFrDigY4WIDAD0EHuNJIGGH5gjckBt5JnUNsVAIhNfMA
         14bcBDXQIxz++HbjQIHTerYLhtExte1YVwdeFanzaHukmTxBNTh7umM4KH+RyHSj55D4
         MXqrsxEFSOFmFULCfhJdksu30/TG4YV6swAdUxhUpAlslWZOC/pAC6qgbErBawG5uwrU
         Q8RgUt2Rt9WxwvURZxwa6yS4l8zHZJhj/xpP6Z5PdQShmC/qLtQo+jIXobvn8Z3tkUvM
         WjKg==
In-Reply-To: <CAGXu5jJpO+z8k_=UuVY9WAeiEgABQg4gWE6nz82BX0_UhaPUWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, anton@tuxera.com, Felipe Balbi <balbi@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, "Darrick J. Wong" <darrick.wong@oracle.com>, David Howells <dhowells@redhat.com>, David Sterba <dsterba@suse.com>, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mike Marshall <hubcap@omnibond.com>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, Jiri Slaby <jslaby@suse.com>, Mark Fasheh <mark@fashe>

On Mon, May 14, 2018 at 9:30 AM, Kees Cook <keescook@chromium.org> wrote:
> On Sun, May 13, 2018 at 9:05 PM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>> Kees mentioned that he wants to merge a patch to pstore that changes
>> it to use timespec64 internally for 4.17:
>> https://lkml.org/lkml/2018/5/13/3
>
> I'm still working on a v2 for pstore. What is the correct
> cross-architecture format string for timespec64's tv_sec? In your
> other patches, you're using %lld and a (long long) cast. I'd really
> like to avoid the need for casts.

We cannot really avoid it for now.
struct timespec64 is defined this way for now:

struct timespec {
__kernel_time_t tv_sec; /* seconds */
long tv_nsec; /* nanoseconds */
};

#if __BITS_PER_LONG == 64
/* this trick allows us to optimize out timespec64_to_timespec */
# define timespec64 timespec

#else

struct timespec64 {
time64_t tv_sec; /* seconds */
long tv_nsec; /* nanoseconds */
};

#endif

This will all lead to tv_sec being long on a 64 bit architecture and
long long on a 32 bit architecture.
So there is no way of avoiding the cast for now.

We plan to get rid of this trick and to have a single definition for
timespec64. But, that cleanup is planned for later when we cleanup all
struct timespec uses internally.

-Deepa
