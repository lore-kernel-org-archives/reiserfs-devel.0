From: Nigel Cunningham <ncunningham@clear.net.nz>
Subject: Re: [Swsusp-devel] What issues are still outstanding?
Date: Thu, 18 Dec 2003 07:12:33 +1300
Message-ID: <1071684752.3567.9.camel@laptop-linux>
References: <1071549944.28868.9.camel@laptop-linux>
 <3FDFAC82.5090103@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <3FDFAC82.5090103@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <jedi@ninja.dynup.net>
Cc: swsusp-devel <swsusp-devel@lists.sourceforge.net>, reiserfs-list@namesys.com

Hi.

On Wed, 2003-12-17 at 14:08, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Nigel Cunningham wrote:
> 
> >Hi all.
> >
> >Here's another attempt at gathering into one place all the outstanding
> >issues I still need to address before 2.0...
> >
> >- ACPI events during suspend (show stopper?)
> >- SMP support (OSDL project approved)
> >- Suspend script pending changes (Bernard)
> >- Michael's NFS freezer failure
> >- Michael's occasional first-time oops
> >- Dan's suggestions for Documentation changes
> >- Slow image writing (as seen on some computers, including my desktop)

On my computer, it's bootsplash related. If I boot with splash=off, I
get the full speed. Will investigate further later.

> >Others? Please keep the above list and add to it.

> Reiser4 support?  I can't be the middleman here -- I know almost nothing 
> about it except that the latest reiser4 and swsusp snapshots do not like 
> each other.

I'm not going to support it before 2.0, but afterwards I'll roll an
option patch for it.

Regards,

Nigel
-- 
My work on Software Suspend is graciously brought to you by
LinuxFund.org.

