From: Oleg Drokin <green@namesys.com>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Mon, 27 Jan 2003 14:33:05 +0300
Message-ID: <20030127143305.A26767@namesys.com>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath> <20030127095957.A22720@namesys.com> <20030127112651.GA10556@hell.mine.nu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030127112651.GA10556@hell.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jan 27, 2003 at 12:26:51PM +0100, Francois-Rene Rideau wrote:
> > ftp://ftp.suse.com/pub/people/mason/patches/data-logging
> Thanks for the tip. Can you tell me which patches are needed?

01-relocation-5.diff.gz is the one.

> >> In any case, I think that it is a bug that mkreiserfs doesn't check
> >> the consistency of its parameters with what the kernel is able to handle.
> > No, that's not a bug. mkreiserfs cannot know if you are just making
> > a filesystem and planning to reboot into proper kernel later
> > (or even move the disk to other system).
> > Also it cannot detect if your current kernel have any patches applied or not.
> Well, it could detect that the kernel version is under some version, issue
> a Warning that a patch is required wrt vanilla kernel of same version, and

Well. But given the trend that lots of users are using distro kernels only,
and e.g. SuSE ships these patches for some time already, such a warning
will cause lots of confusion.

> give a pointer to said patch -- that would completely solve the issue with
> newbies like me asking you this question.

So far we have not found any good way to print warning only when it is really needed.
Always printing the warning is not very good idea in my opinion.

Bye,
    Oleg
