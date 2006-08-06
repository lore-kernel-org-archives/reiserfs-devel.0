From: TongKe Xue <xue@ai.stanford.edu>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sun, 6 Aug 2006 12:21:10 -0700 (PDT)
Message-ID: <Pine.LNX.4.62.0608061220270.17723@robo.Stanford.EDU>
References: <87bqqzbaug.fsf@baldur.nicundtas.de>
 <Pine.LNX.4.62.0608051913200.12088@robo.Stanford.EDU> <44D5A650.3080708@namesys.com>
 <200608061304.42692.bernd-schubert@gmx.de> <eb4o19$5ik$1@sea.gmane.org>
 <44D6403B.1010701@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D6403B.1010701@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Lexington Luthor <Lexington.Luthor@gmail.com>, reiserfs-list@namesys.com

I'm a total idiot. Please forgive my stupidity.

From a purely technical perspective, what does VFS lack that makes 
VFS-modules so much harder than Reiser-modules?

Thanks,
--TongKe

On Sun, 6 Aug 2006, David Masover wrote:

> Lexington Luthor wrote:
>> Bernd Schubert wrote:
>>> An alternative might be a reiser4 fuse port. Has some advantages:
>
>> Please please no. The kernel people will use that as an argument for 
>> keeping it out of the kernel.
>
> They'll use anything as an argument for keeping it out of the kernel. This 
> one is particularly shallow, especially if we still have the kernel version, 
> because the performance difference will be significant.
>
> If it isn't, maybe it is time for things like FUSE to take us in the 
> direction of microkernels...
>
>> I want reiser4 to be popular enough to make my apps depend on it and not 
>> have the users complain about having to use an obscure fs.
>
> Well, an obscure program (FUSE) is probably a lot easier to convince users of 
> than an obscure filesystem (reiser4 in-kernel).
>
>> Besides, the only thing about reiser4 that interests me more than XFS or 
>> reiserfs is the speed.
>
> That's you.  There are other reasons to like it.
>
> But I agree with you in that I don't think it's worth the resources to do a 
> FUSE port, especially when there is (again) NO guarantee that anything we do 
> will get us in the kernel, so better to do things that will either get us 
> users anyway (like distro inclusion) or do things the kernel people 
> specifically ask for.
>
