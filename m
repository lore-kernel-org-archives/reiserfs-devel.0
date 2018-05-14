From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH 6/6] vfs: change inode times to use struct timespec64
Date: Sun, 13 May 2018 21:05:58 -0700
Message-ID: <CABeXuvpi_dm6TE3pH_KGehgNwW177hJFBmR8u29w6KJH1aA1Kg@mail.gmail.com>
References: <20180512045921.18311-1-deepa.kernel@gmail.com>
 <20180512045921.18311-7-deepa.kernel@gmail.com> <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=jDh+i07Pe9WEAalJkpyiaZWn9LJ6rsESkWXJWFyZxQ4=;
        b=BMxkfupRsobyMKv2jGEdmW+yy0ZAaBQadPNB45C6KOihnl6Rl0QOKjue/oCR6wtflz
         2ismheKrxzIVtgCLU5yFxelPxmOJIXR/07lJ24kc6zbS7SkWeblODtPDUq8Yo9j2JajR
         km+B7R8IutGstTZlQsp/XXTbAEQyFK9WkMaF/fvxp84qW7bgBD8GEAq/ioL79uerddya
         ApffjIFi+w6SBTYYd90ppp2C+e9J2/sbn8818GEa023NenIGQacuLHGQ6aQE6WZdz39d
         rmwcYLE1WABajJwwBZHIsjvvV5oPeGGgpRsBu0ctA/6BN0/M40PJJONWOZI0hTlEYE5z
         OrEw==
In-Reply-To: <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, anton@tuxera.com, Felipe Balbi <balbi@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, "Darrick J. Wong" <darrick.wong@oracle.com>, David Howells <dhowells@redhat.com>, David Sterba <dsterba@suse.com>, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mike Marshall <hubcap@omnibond.com>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, Jiri Slaby <jslaby@suse.com>, Mark Fasheh <mark@fashe>

Al,

Are you ok with this approach to changing vfs timestamps?

Kees mentioned that he wants to merge a patch to pstore that changes
it to use timespec64 internally for 4.17:
https://lkml.org/lkml/2018/5/13/3

I'm not sure how we usually merge such flag day patches. Should this
be targeted for 4.17 or 4.18? The above might or might not be a
problem based on when this series is merged.

If you are ok with this approach, I could post a v2 with a couple of
requested fix-ups.

-Deepa

On Fri, May 11, 2018 at 11:44 PM, Kees Cook <keescook@chromium.org> wrote:
> On Fri, May 11, 2018 at 9:59 PM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
>> index 5fcb845b9fec..fb681d302bb3 100644
>> --- a/fs/pstore/inode.c
>> +++ b/fs/pstore/inode.c
>> @@ -392,7 +392,7 @@ int pstore_mkfile(struct dentry *root, struct pstore_record *record)
>>         inode->i_private = private;
>>
>>         if (record->time.tv_sec)
>> -               inode->i_mtime = inode->i_ctime = record->time;
>> +               inode->i_mtime = inode->i_ctime = timespec_to_timespec64(record->time);
>>
>>         d_add(dentry, inode);
>
> I'm fine to just convert pstore internally to timespec64 right now. Is
> it correct to say that I should use timespec64_to_timespec() here
> until this flag day patch? And I'd need to do this as well, yes?
>
> fs/pstore/platform.c:     record->time =
> ns_to_timespec64(ktime_get_real_fast_ns());
>
> Thanks!
>
> -Kees
>
> --
> Kees Cook
> Pixel Security
