From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 08 Jul 2002 09:51:33 -0400
Message-ID: <1026136293.5663.56.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D2396AF.8020508@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2002-07-03 at 20:28, Manuel Krause wrote:
 
> So far the 13 prerelease works fine under rootflags boot and 
> mount/remount option "data=ordered" on here.

I think I've got the bug, it was newly introduced in -13.  New stuff
will be uploaded today.

> 
> Can you, please, answer my old questions as of:
> 
> On 06/25/2002 02:55 AM, Manuel Krause mainly wrote (but too much more):
> 
>  > Is the rootflag needed any more? Does your patchset work with all
>  > pending ReiserFS patches together, now?

Yes, you still need the rootflag.  I haven't tried to merge it with all
the namesys pending patches, except for the journal relocation stuff and
the commit_super speedups.
 
> 
> Thanks,
> 
> I don't get a performance decrease with "13", and: Is it really 
> dangerous to use "13" in this mode of operation?

It is dangerous to use -13 at all, although the bug is pretty difficult
to trigger.  Please run reiserfsck --check before upgrading.

-chris


