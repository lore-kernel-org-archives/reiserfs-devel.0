From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.06.14-internal.testing/
Date: Wed, 16 Jun 2004 20:08:42 +0400
Message-ID: <200406162008.42653.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200406161558.45139.vitaly@namesys.com> <24295.212.0.249.130.1087400686.squirrel@webmail.xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19215-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <24295.212.0.249.130.1087400686.squirrel@webmail.xs4all.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sander Sweers <sandersweers@xs4all.nl>, reiserfs-list@namesys.com

> I'm trying to build reiser4 support in grub but it ends with the following
> error:
>
> /lib/libaal-alone.a(libaal_alone_la-malloc.o)(.data+0x0): In function
> `aal_mem_init':
> /var/tmp/portage/libaal-0.5.2/work/libaal-0.5.2/src/malloc.c:189:
> undefined reference to `free'
> /lib/libaal-alone.a(libaal_alone_la-malloc.o)(.data+0x4): In function
> `aal_mem_free':
> /var/tmp/portage/libaal-0.5.2/work/libaal-0.5.2/src/malloc.c:196:
> undefined reference to `malloc'
> collect2: ld returned 1 exit status
> make[2]: *** [pre_stage2.exec] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: Leaving directory
> `/var/tmp/portage/grub-0.94-r1/work/grub-0.94/stage2'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/var/tmp/portage/grub-0.94-r1/work/grub-0.94'
> make: *** [all] Error 2
> ----------
>
> I have build reiser4progs and libaal with --enable-stand-alone.

you should configure libaal with --enable-stand-alone --enable-memory-manager.
or you can implement your own memory methods and use them in stand-alone mode.

-- 
Thanks,
Vitaly Fertman

