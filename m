From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs/emacs incompatibility/bug ?
Date: Mon, 30 Sep 2002 14:30:24 +0400
Message-ID: <20020930143024.A24986@namesys.com>
References: <H38NZB$69AAF5A88B45DCEF699FDF55EA5A8356@voila.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11564-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <H38NZB$69AAF5A88B45DCEF699FDF55EA5A8356@voila.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "arthur.chereau" <arthur.chereau@voila.fr>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Sep 30, 2002 at 08:42:47AM +0200, arthur.chereau wrote:

> > What kernel versions have you tried (that show this behavior)?
> It happens with 2.4.18 and 2.4.19.

Hm. I cannot reproduce locally with emacs-x11-20.7-125 (from SuSE 7.3)
Every time I tried inode numbers for test and test~ files were the same.
(that's it, test~'s inode number did not changed over several emacs invocations
(and actually I do not see why it should have changed at all)).

Can you please capture strace output from such a session where
inode numbers are not in right order and original permissions are lost
and send it to me?

Thank you.

Bye,
    Oleg
