From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: R4 2.6.33 inconsistent keys
Date: Fri, 19 Mar 2010 17:29:31 +0100
Message-ID: <4BA3A66B.5000508@gmail.com>
References: <e4cc97d91003190852r374b43d5j5838a12eca1eec08@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e4cc97d91003190852r374b43d5j5838a12eca1eec08@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Luciano <luciano@joublanc.com>
Cc: reiserfs-devel@vger.kernel.org

Luciano wrote:
> First, thanks for this great filesystem. Been using it for years
> without probs, so I hope it gets integrated into the mainline soon.
>
> However, I'm having some problems after upgrading from kernel 2.6.31.6
> to 2.6.33. This is a 64 bit gentoo-patched kernel (just patches for
> stability, I believe - no new features), with the reiser4 patches from
> Edward's site. It's happened to me twice now that my X session locks
> up and I see the following in my logs:
>
> Mar 19 15:05:23 [kernel] WARNING: Keys are inconsistent. Fsck?
> Mar 19 15:05:23 [kernel] reiser4[gconfd-2(6033)]: cbk_level_lookup
> (fs/reiser4/search.c:963)[vs-3533]:
>   

Yup, I know about this problem. I think this is an old bug which was
sleeping and has woken up after mainline upgrade to 2.6.31.X

I remember that VS pursued this bug with partial success right
before leaving 2.5 years ago.

This is reproducible for me and I am trying to narrow down the
problem. However, I have only weekends for this, so perhaps it
will take a time..

Thanks,
Edward.

P.S. One more old nasty thing: a phantom ENOSPC:
sometimes an application returns the ENOSPC while there is a lot
of space on the device. This bug is unix-file plugin-specific.
 
> The previous time it happened the messages were similar but the
> process was 'firefox' instead of gconfd.
>
> When this happens it quickly fills up the logs and old ones are
> overwritten; so I'm never able to get initial messages that may help
> diagnose the problem. I have the full set of logs if you are
> interested, but it just repeats the same message over and over.
>
> After this, I can only cold boot, and the filesystem refuses to mount,
> but I'm able to fix it with fsck. It complains about 'delimiting' keys
> being zero. I fix this with the relevant fsck switch and as far as I
> can tell there is no permanent damage to my files.
>
> Finally I should mention that I also have a R4 root partition but that
> hasn't had any problems. This is only happening on my home partition.
> I should also note that it's mounted over a LUKS device using
> /dev/mapper. I don't know much about the way that works, but I think
> it just treats it as a block device, so if the problem were there, it
> would manifest itself in different ways in the R4 layer. The fact that
> it's always setting the delimiting keys to zero makes me think it's an
> R4 problem. But then again I don't know much about this so I could be
> utterly wrong.
>
> Please let me know if I can contribute in any way.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

