From: Oleg Drokin <green@namesys.com>
Subject: Re: Problems with journal size option on mkfs
Date: Thu, 16 May 2002 19:09:11 +0400
Message-ID: <20020516190911.A2877@namesys.com>
References: <OF61DE11CE.F7B7B7AE-ON85256BBB.0051CE0D@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF61DE11CE.F7B7B7AE-ON85256BBB.0051CE0D@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, May 16, 2002 at 09:59:46AM -0500, Steve Pratt wrote:
 
> >This is because non-standard journal support is only included in 2.5
> kernel
> >series.
> >2.4 support is available as separate patch for now.
> So just to be sure I understand this:the current 2.4 kernel code (2.4.18)
> does not include support for ANY non-standard journal options, including
> non default size of an inline log??

Yes, this is correct.

> If this is true, wouldn't it have made sense to put some checking in the
> utilities to detect the level of support in the kernel and either put out a
> meaningful error message or simply ignore the option?  As it stands now,
> from the command line mkfs doesn't even indicate that there was an error.

There were no error at mkfs time. May be user is doing mkfs from some bootable
floppy with old kernel and then plans to boot into more modern kernel, for
example.

> Even if the ReiserFS utilities don't check, is there some way I can query
> the ReiserFS kernel code to detect the presence of these features?

Well, the simplest way is to have (or make) small file with reiserfs image
with non-standard journal and try to mount it ;)
Or you can try to mount valid reiserfs fs with jdev= mount option, which
is only present on code with nonstandard journaling support.
In short, there is no easy way. But if you can think of any,
we might implement it if it non-intrusive and easy enough.
Actually this is not very reliable in the sence that you cannot say
which kernel user plans to use later on.

Bye,
    Oleg
