From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.27
Date: Mon, 13 Oct 2008 13:57:29 +0400
Message-ID: <48F31B89.2060602@gmail.com>
References: <48F1174B.5050704@gmail.com> <19940006.post@talk.nabble.com> <48F21DC0.9070409@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48F21DC0.9070409@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: callx <pascalim@gmail.com>, reiserfs-devel@vger.kernel.org

Jeff Mahoney wrote:
> callx wrote:
> > I was trying the patch and  get this error..
>
> > Kernel: arch/x86/boot/bzImage is ready (#1)
> >    Building modules, stage 2
> >    MODPOST 45 modules
> > ERROR: "swapper_space" [fs/reiser4/reiser4.ko] undefined!
> > make[1]: *** [__modpost] Error 1
> > make: *** [modules] Error 2
>
> This one looks like it's due to swapper_space not being exported. I

Yup, I have shoved this to reiser4 with page_mapping(),
which is too generic in our case.
It seems, we need to patch vfs library with one more version
of set_page_dirty..

Edward.

> don't know if that's on purpose or just overlooked since all the current
> users of page_mapping() are in core code.
>
> -Jeff
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


