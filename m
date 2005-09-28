From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Thu, 29 Sep 2005 00:05:56 +0400
Message-ID: <200509290005.56659.vitaly@namesys.com>
References: <1127914812.12894.96.camel@laptop> <200509282040.27371.vitaly@namesys.com> <1127930269.12894.143.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1127930269.12894.143.camel@laptop>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Fionn Behrens <fionn@spamfilter.de>

On Wednesday 28 September 2005 21:57, Fionn Behrens wrote:
> On Mi, 2005-09-28 at 20:40 +0400, Vitaly Fertman wrote:
> 
> > remember that reiser4progs-1.0.4 supports both formats, in other words
> > having the format updated to the new one, you are able to use new
> > kernelonly. If you want to move back to 2.6.10, you have to build-fs
> > with 1.0.3 version or reiser4progs.
> 
> Do I get this right? I had reiser4progs 1.0.4 and it should already know
> the new format? If what you say is right then fsck should have not
> complained about an error in the first place AND I still should not be
> able to boot with the old kernel any more after --build-fs. 
> But it found an error. And I ran --build-fs with it. And now I am using
> the old kernel again and it does NOT complain about errors any more.
> (except for that flag we discussed already). 
> 
> Pardon me, I am confused.

hm, before writing that I had checked 1.0.4 progs and thought there
was another older fsck you could run that time, but I have just double 
checked it and have found that 1.0.4 version I looked into was changed 
a bit. You are right, 1.0.4 works with the old format. and if you run it 
again with --check, you get rid of the ERROR flag in the super block.

-- 
Vitaly
