From: Brian Thomas Sniffen <bts@alum.mit.edu>
Subject: Re: reiser4 non-free?
Date: Thu, 06 May 2004 12:43:44 -0400
Message-ID: <877jvpy08v.fsf@aule.evenmere.org>
References: <4097CCA4.4060707@namesys.com> <87fzag139k.fsf@aule.evenmere.org>
	<4099A868.9030406@slaphack.com>
	<20040506.083242.41632888.wlandry@ucsd.edu>
	<87k6zpy8ke.fsf@aule.evenmere.org>
	<20040506143643.GB25505@raptus.homelinux.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040506143643.GB25505@raptus.homelinux.org> (Domenico
 Andreoli's message of "Thu, 6 May 2004 16:36:43 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiser@namesys.com
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Domenico Andreoli <cavok@debian.org> writes:

> On Thu, May 06, 2004 at 09:44:01AM -0400, Brian Thomas Sniffen wrote:
>> Walter Landry <wlandry@ucsd.edu> writes:
>> 
>> > David Masover <ninja@slaphack.com> wrote:
>> >> First and foremost:  Hans, this is your project.  Someone willing to
>> >> replace entire APIs with things that feel like files is obviously not
>> >> afraid of creating something new.  So at the end of the day, it
>> >> shouldn't matter too much that it's in Debian Non-free, especially if
>> >> (assuming I heard correctly) XFree86 is also non-free.
>> >
>> > People seem to be missing this issue, so I'll bring it up again.  The
>> > problem is not so much whether the license is free or not.  The
>> > problem is that it is incompatible with the GPL.  That means that
>> > Debian can't distribute it _at all_.  Not in main, not in non-free.
>> > Not at all.
>> >
>> > The license may be perfectly free (e.g. the IBM CPL), but if it is
>> > incompatible with the GPL, then Debian can't distribute it.
>> 
>> You're right, Walter, and thank you for the clarification.  To clarify
>> further, Debian can't distribute a derivative work of the Linux kernel
>> which is not licensed under the GPL.
>
> if linux kernel distributes itself such a derivative work why debian
> can't?

Someone who is the sole copyright holder of the Linux Kernel can
distribute it linked with some other program which is not under a
GPL-compatible license.  But nobody is in that position.

It is not Debian's business to attempt to control what the kernel
folks do -- we're all grateful for shier contributions, and that's
about that.

Reiser can distribute his filesystem and tools, because they depend
only on components included with the OS, and others can redistribute
for the same reason -- but Debian, as an OS distributor, can't do
that.  It's part of why we require OpenSSL-targeted license extensions
from GPL'd work which links against libcrypto.

-Brian

-- 
Brian Sniffen                                       bts@alum.mit.edu
