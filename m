From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 10:15:03 +0400
Message-ID: <20020625101503.A878@namesys.com>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org> <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com> <1141375583133.20020626230935@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1141375583133.20020626230935@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jun 26, 2002 at 11:09:35PM -0700, Kevin wrote:

> > Reformatted as in mkreiserfs?
> Correct.  That's the only change I've made to it though.  Would
> rebuilding the superblocks help?  Last time it happened, I rebuilt the

No. Superblock is fine in your case.

> tree, and it deleted the files that I had trouble with.  So it's hard

--fix-fixable can fix such errors. (it just zeroes offending pointers),
It would be nice if you first run reiserfsck --check and show us the output,
though. Because you may have other kinds corruptions as well.

Bye,
    Oleg
