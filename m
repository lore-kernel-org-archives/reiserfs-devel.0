From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Grub segfaults when trying to access reiser4
Date: Fri, 30 Jul 2004 17:24:36 +0400
Message-ID: <200407301724.36902.vitaly@namesys.com>
References: <e7963922040726145045bdb0cd@mail.gmail.com> <200407291557.17078.vitaly@namesys.com> <e796392204072906512e7eb143@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e796392204072906512e7eb143@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Schweizer <sschweizer@gmail.com>, reiserfs-list@namesys.com

On Thursday 29 July 2004 17:51, Stefan Schweizer wrote:
> On Thu, 29 Jul 2004 15:57:17 +0400, Vitaly Fertman wrote:
> > thy this improved patch (it includes the previous one)
> > and a bit modified grub patch please.
>
> ok, in /bin are still only 5 files, although it segfaults less often
> now, it only segfaults if i try to access files like kernel
> (hd0,0)/bin/bash[enter] I cannot get it to segfault only with tab. It
> does not list the contents of /usr/doc or /usr/src and if I try
> (hd0,0)/usr/src/linux[enter]
>
> Error 15: File not found
>
> But I swear its there, same result with /usr/doc, I can navigate
> through my home with [tab], but I cannot get any of the files, It
> either segfaults or says file not found ..

Was it grub-0.95 that segfaulted? It is on reiser4 also, right?

I cannot reproduce these segfaults actually. grub-0.94 works and 
the only case 0.95 segfaults for me is '(hd2,[tab]'. 

Could you make evth clean and build again from scratch?

-- 
Thanks,
Vitaly Fertman

