From: Oleg Drokin <green@namesys.com>
Subject: Re: how long is reiserfsck expected to run?
Date: Sun, 25 May 2003 15:06:35 +0400
Message-ID: <20030525110635.GA2119@namesys.com>
References: <200305241131.40837.pegasus@nerv.eu.org> <20030524093710.GA15753@namesys.com> <20030524222324.2580002e.pegasus@nerv.eu.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030524222324.2580002e.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jure Pecar <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, May 24, 2003 at 10:23:24PM +0200, Jure Pecar wrote:
> > It can take pretty long time.
> It just finished, after about 40h.
> 2859 found corruptions can be fixed only during --rebuild-tree.
> yay. And manual page strongly suggest backing up the partition before
> --rebuild-tree. But i neither have 500gb handy nor time to do that ...

Well, reiserfsck --rebuild-tree is much more robust these days.
The only thing you should not have on tihs fs is images of other reiserfs
filesystems in plain form (not compressed or encrypted).

> Btw, how long is --rebuild-tree going to take? Even longer i guess? :)

Generally speaking yes. But with the version I sent you it should be
faster. It would be interesting to know how long rebuild-tree run of
new reiserfsprogs will take

[parts of old data sticked into fs horrors]

> Has anyone been through something like this before? Is this fixable
> afterall?

It should be somewhat fixable, I think.
Some of the files (esp. aleady deleted ones) may easily end-up in
lost_found, though.

> Well if it is i think i owe you (the reiserfs team) something ... what do
> you prefer? :)

we have this http://namesys.com/support.html page that describes ways to
give us money if you feel the need to ;)

> Btw this is on rh AS with their 2.4.9-e16 kernel, based on 2.4.9-ac10. I'd
> say that reiserfs code in this kernel is exactly the same as in the Alan's
> ac10. I'm using reiserfsprogs 3.6.6.

This kernel is buggy and generally is not recommended for reiserfs operations.
I wonder if you can easily stick in at least some 2.4.19 flavour?

Also please use reiserfsprogs version I sent you.

Bye,
    Oleg
