From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Re: Grub segfaults when trying to access reiser4
Date: Thu, 29 Jul 2004 15:51:50 +0200
Message-ID: <e796392204072906512e7eb143@mail.gmail.com>
References: <e7963922040726145045bdb0cd@mail.gmail.com> <200407290039.46500.vitaly@namesys.com> <e79639220407281445f3cd00a@mail.gmail.com> <200407291557.17078.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407291557.17078.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

On Thu, 29 Jul 2004 15:57:17 +0400, Vitaly Fertman wrote:
> thy this improved patch (it includes the previous one)
> and a bit modified grub patch please.

ok, in /bin are still only 5 files, although it segfaults less often
now, it only segfaults if i try to access files like kernel
(hd0,0)/bin/bash[enter] I cannot get it to segfault only with tab. It
does not list the contents of /usr/doc or /usr/src and if I try
(hd0,0)/usr/src/linux[enter]

Error 15: File not found

But I swear its there, same result with /usr/doc, I can navigate
through my home with [tab], but I cannot get any of the files, It
either segfaults or says file not found ..
