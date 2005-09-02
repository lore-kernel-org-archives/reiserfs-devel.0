From: David Masover <ninja@slaphack.com>
Subject: Re: Incite into reiser5?
Date: Fri, 02 Sep 2005 16:53:44 -0500
Message-ID: <4318C9E8.80804@slaphack.com>
References: <1125596442.5207.11.camel@jove> <b14e81f0050901193220855450@mail.gmail.com> <1125685758.9150.8.camel@jove> <43189B26.2030602@slaphack.com> <873bonuurh.fsf@evinrude.uhoreg.ca> <4318AB3B.1090204@slaphack.com> <dfacls$4pd$2@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dfacls$4pd$2@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lexington Luthor <lexington.luthor@gmail.com>
Cc: reiserfs-list@namesys.com

Lexington Luthor wrote:
> David Masover wrote:
> 
>> It has one.  It's called Lustre.
>>
>> What Linux needs is good, distributed filesystem that runs on the 2.6
>> kernel, without users having to pay licensing fees.
>>
> 
> Lustre is expensive, but the -mm kernel now has ocfs (or is it ocfs2?)
> as well as gfs.

Don't know about ocfs, I'll look it up later.

But, AFAIK, GFS is for things like ATA-over-ethernet, where you have
multiple machines attached to the same hard drive -- not for situations
where multiple machines each have their own drive, and you want them to
appear as one logical drive.
