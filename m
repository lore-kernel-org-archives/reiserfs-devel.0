From: Oleg Drokin <green@namesys.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 23:24:27 +0400
Message-ID: <20030913192427.GB24770@namesys.com>
References: <3F632446.30004@namesys.com> <Pine.LNX.4.44.0309131039450.32678-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0309131039450.32678-100000@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Hans Reiser <reiser@namesys.com>, Reiser FS mailing list <reiserfs-list@namesys.com>

Hello!

On Sat, Sep 13, 2003 at 10:41:47AM -0400, Robert P. J. Day wrote:
> > did you adjust our headers to be redhat compatible?  If not, please do.
> i didn't see anything in the READ.ME about adjusting headers, but would
> this also explain why, if i build reiser 4 support directly into the 
> kernel, my "make modules_install" works fine, but if i make it modular,
> i get

reiser4 is not supposed to be build as module yet.
Hm, I thought I disabled this in Kconfig, but it seems I done this not fully.

Anyway the list of unresolved symbols you provided is valuable and we will
export those on next snapshot.

>   just curious.  haven't rebooted under the new kernel yet, but i'd like 
> to clear up the above before i do that.  thanks.

Bye,
    Oleg
