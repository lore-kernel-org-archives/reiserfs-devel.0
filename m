From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck on /
Date: Wed, 25 Sep 2002 17:27:04 +0400
Message-ID: <20020925172703.A1730@namesys.com>
References: <Pine.LNX.4.33L2.0209251521300.8332-100000@mailbackup.pi.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33L2.0209251521300.8332-100000@mailbackup.pi.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ole Tange <reiserfs@tange.dk>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Sep 25, 2002 at 03:22:36PM +0200, Ole Tange wrote:

> Summary: How do I run reiserfsck on / ?

Summary answer: Boot off rescue disk and run reiserfsck.

> seems to be a bit more picky.
> I can run reiserfsck --check:
>   There were found 175 corruptions which can be fixed with --fix-fixable
> but not --fix-fixable:
> reiserfsprogs 3.6.2
> Will check consistency of the filesystem on /dev/hdb2
> Will fix what can be fixed w/o --rebuild-tree
> Will put log info to 'stdout'
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> ###########
> reiserfsck --fix-fixable started at Wed Sep 25 15:12:04 2002
> ###########
> Filesystem seems mounted read-only. Skipping journal replay..
> --fix-fixable ignored
> So how do I correct the errors on / through ssh? I am willing to sacrify
> all files made after last reboot, so I guess the journal is not important
> to me.

The only supported way is to boot off separate boot device (be it another
partition on same drive, floppy or CD).

There are unsupported ways of course, but doing so you are voiding our
warranty ;).

Bye,
    Oleg
