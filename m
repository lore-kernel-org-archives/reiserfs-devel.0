From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: cannot mount reiserfs with nonstandard journal size
Date: Tue, 9 Sep 2003 19:34:54 +0400
Message-ID: <200309091934.54101.vitaly@namesys.com>
References: <20030909111301.GA3688@WS-VPK-054> <20030909145344.GB3177@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030909145344.GB3177@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurenz Brein <brein@culturall.com>
Cc: reiserfs-list@namesys.com

Hi, 

On Tuesday 09 September 2003 18:53, Oleg Drokin wrote:
> Hello!
>
> On Tue, Sep 09, 2003 at 01:13:01PM +0200, Laurenz Brein wrote:
> > I'm using reiserfsprogs 3.6.11 on a Slackware 9.0 machine with Kernel
> > 2.4.20 which I patched with the patches from
> > /pub/reiserfs-for-2.4/2.4.20-pending If, however, I create it with
> >   mkreiserfs -s 1025 /dev/sdb1
> > or any other journal size, the same mount will fail with
> >   mount: wrong fs type, bad option, bad superblock on /dev/sdb1,
> >          or too many mounted file systems
>
> Yes. You need extra patch with support for nonstandard journals.
> You can get one at e.g.
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20/01-relocati
>on-5.diff.gz
>
> > Checking the file system with
> >   reiserfsck /dev/sdb1
> > fails with the message
> >   Failed to open the journal device ((null)).
> > The check works fine if I either add the --no-journal-available or the
> > -j /dev/sdb1 option.
>
> Hm. We had similar bug fixed already.
> Vitaly is looking at this currently and will provide you with a bugfix.

yes, I fixed it but it have not got into any release yet, so you have to specify 
the journal device with 3.6.11.

-- 
Thanks,
Vitaly Fertman
