From: William Stearns <wstearns@pobox.com>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 7 Sep 2004 17:05:01 -0400 (EDT)
Message-ID: <Pine.LNX.4.58.0409071658120.2985@sparrow>
References: <41323AD8.7040103@namesys.com> <20040831131201.GA1609@elf.ucw.cz>
 <413E170F.9000204@namesys.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413E170F.9000204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Pavel Machek <pavel@ucw.cz>, Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, ML-reiserfs <reiserfs-list@namesys.com>, William Stearns <wstearns@pobox.com>

Good day, all,

On Tue, 7 Sep 2004, Hans Reiser wrote:

> >What about choosing just "..." instead of "metas"? "metas" is string
> >that needs translation etc, while "..." is nicely neutral.
> >
> >cat /sound_of_silence.mp3/.../author
> >
> >does not look bad, either...
> >
> "..." is pretty good, but I think it has been used by others, but I 
> really forget who.  I could live with "...", but I think "metas" and 

	Some trojans and rootkits have used it to store files; 
/usr/lib/... , /usr/doc/... , /usr/sbin/... , /usr/local/bin/... , 
/dev/... , and /usr/include/... are used by bobkit.
	This might trigger false positives for rootkit detection tools 
like chkrootkit and rootkit-hunter.
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "What is the most effective Windows NT remote management tool? 
A car."
        -- Network Intrusion Detection, An Analyst's Handbook
           2nd Edition, 2000
           Stephen Northcutt et al, page 147
(Courtesy of Rodrigo Goya <lucent@securenet.com.mx>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------
