From: David Masover <ninja@slaphack.com>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled
 fs, looks stable to me...)
Date: Wed, 09 Aug 2006 00:01:42 -0400
Message-ID: <44D95E26.8040309@slaphack.com>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local> <44D773D6.4020504@slaphack.com> <20060808095658.GA6834@hermes.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060808095658.GA6834@hermes.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Christian Trefzer wrote:
> On Mon, Aug 07, 2006 at 01:09:42PM -0400, David Masover wrote:
>> Christian Trefzer wrote:
>>> Few people keep a 32MB ext2 for /boot purposes these days, so it
>>> really is imperative that grub can read kernel images off a reiser4
>>> /.
>> I think there are patches, but I do keep a 32 meg ext3 for /boot,
>> because it seems like no matter what FS I choose, there's some sort of
>> caveat involving Grub.  I know when installing XFS as a root FS on
>> Ubuntu, it talks about Grub problems...
> 
> New installations is what I had in mind there. People see they could use
> something fancy, but their bootloader-du-jour won't take it. Bummer. The
> warning message is the only thing keeping folks from running into a
> broken installation. No good.

A warning isn't good?  Would you rather it be an error?  Some people 
would like to test Grub's XFS support...

It's not necessarily broken, just potentially unreliable, and difficult 
to work with (you have to set arcane mount options or somesuch).  Same 
for ReiserFS3, by the way.

Really, while Grub is useful, it's a rather large duplication-of-code 
effort.  XOSL is even moreso, especially considering it doesn't support 
Linux or multiboot natively -- it must boot Grub or Lilo in order to run 
Linux or HURD.  Why aren't we using kexec for this already?

>> I mean, having Grub support everything would be nice, but if you're
>> reformatting anyway, I don't think it's that imperative.
> 
> Yeah, _if_ you are s.o. who knows how to turn a partition table upside
> down without losing a single bit of data.

It's called "backup and restore."  Or did you have a different idea for 
how to convert an existing installation to another root FS, or do a 
fresh installation without nuking your partitions anyway?
