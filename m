From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 corruption on initial copy
Date: Sat, 02 Sep 2006 13:27:11 -0500
Message-ID: <44F9CCFF.5050201@slaphack.com>
References: <ed9412$2r9$1@sea.gmane.org> <44F8B5B1.1020009@slaphack.com> <edbm8q$ana$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <edbm8q$ana$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Peter wrote:
> On Fri, 01 Sep 2006 17:35:29 -0500, David Masover wrote:
> 
>> Peter wrote:
>>
>>> 2) I did run badblocks on the dest, and it was clean. 3) I am using the
>>> patch from 2.6.17.3 and in my kernel, I have full preempt and cfq
>>> scheduling.
>> What about the kernel on the livecd?
> 
> 
> Anticipatory
> Voluntary

Yes, that should be fine, but I was wondering if it's the same version, 
if you built it yourself, etc etc.

> Plus, it is smp, so there are some additional options checked. Should I
> have preempt=none with reiser4?

I'm not sure.
