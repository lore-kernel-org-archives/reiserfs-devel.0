From: Oleg Drokin <green@namesys.com>
Subject: Re: cannot mount reiserfs with nonstandard journal size
Date: Tue, 9 Sep 2003 18:53:44 +0400
Message-ID: <20030909145344.GB3177@namesys.com>
References: <20030909111301.GA3688@WS-VPK-054>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030909111301.GA3688@WS-VPK-054>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurenz Brein <brein@culturall.com>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello!

On Tue, Sep 09, 2003 at 01:13:01PM +0200, Laurenz Brein wrote:

> I'm using reiserfsprogs 3.6.11 on a Slackware 9.0 machine with Kernel 2.4.20
> which I patched with the patches from /pub/reiserfs-for-2.4/2.4.20-pending
> If, however, I create it with
>   mkreiserfs -s 1025 /dev/sdb1
> or any other journal size, the same mount will fail with
>   mount: wrong fs type, bad option, bad superblock on /dev/sdb1,
>          or too many mounted file systems

Yes. You need extra patch with support for nonstandard journals.
You can get one at e.g. ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20/01-relocation-5.diff.gz

> Checking the file system with
>   reiserfsck /dev/sdb1
> fails with the message
>   Failed to open the journal device ((null)).
> The check works fine if I either add the --no-journal-available or the
> -j /dev/sdb1 option.

Hm. We had similar bug fixed already.
Vitaly is looking at this currently and will provide you with a bugfix.

> My questions:
> - Is this behaviour correct?

It is correct for the kernel, not correct for reiserfsck

> - Is there a way (mount option?) to mount reiserfs with non-standard
>   journal sizes?

You need to apply a patch to 2.4.20 (or upgrade to 2.4.22 or 2.6.0-test)

Bye,
    Oleg
