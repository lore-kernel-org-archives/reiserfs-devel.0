From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug #152548: docs about reiserfsprogs is confused
Date: Wed, 7 Jan 2004 15:13:25 +0300
Message-ID: <200401071507.38208.vitaly@namesys.com>
References: <3FFBA8ED.8050100@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16432-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@libero.it>, reiserfs-list@namesys.com
Cc: 152548@bugs.debian.org

> > this is the last of the known ones, i'd like to make the package as clean
> > as possible, next release of debian distribution doesn't look too far
> > (BTW, any chance to have 3.6.12 soon?).

yes, I think in a week or so.

> > thanks for your contribute to the debian project.
> >
> > cheers
> > domenico
>
> Package: reiserfsprogs
> Version: 3.x.1b-1
> Severity: normal

this is very old version, you should try the latest -- 3.6.11.

> Man reiserfsck mentions
>
>        2. Run reiserfsck --check --logfile check.log /dev/hda1. If
> reiserfsck --check exits with status 0 it  means
>        no errors were discovered.
>
> and then says
>
> TODO
>        Faster recovering, signal handling, i/o error handling, 
> return reasonable exit codes, etc.
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> With -fy, exit status 0 is reported if filesystem is not found on
> specified disk. That seems like a bug.

As was mentioned in the man page exit codes were not always 
correct in that version, but it is already fixed in last versions.

I have also checked the exit code of 
	reiserfsck --check /dev/hda1
from 3.x.1b where /dev/hda1 was not the reiserfs. SuperBlock was 
not found and it was aboted -- 134 was returned.

Would you try it all again with 3.6.11 and email me about the results?

-- 
Thanks,
Vitaly Fertman
