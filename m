From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 15:01:12 -0500
Message-ID: <3FAFEE88.3040002@ysu.edu>
References: <3FAAB330.5040503@nrao.edu>	 <1068152277.2556.13.camel@redeeman.linux.dk> <1068152634.2455.37.camel@dragonball>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068152634.2455.37.camel@dragonball>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Tinsley <btlists@emageon.com>
Cc: reiserfs-list@namesys.com

I set labels on my ReiserFS filesystems, but I can't use LABEL= in /etc/fstab. 
I thought that was the point of having filesystem labels.  Is there some 
configuration setting that I'm missing?
Thanks,
John

Brian Tinsley wrote:

> reiserfstune --label <new label> /dev/xxx
> 
> That ought to do it  ;)
> 
> 
> On Thu, 2003-11-06 at 14:57, Redeeman wrote:
> 
> 
>>now you talk about label, how to change a label?
>>
>>On Thu, 2003-11-06 at 21:46, Boyd Waters wrote:
>>
>>>-----BEGIN PGP SIGNED MESSAGE-----
>>>Hash: SHA1
>>>
>>>Perhaps this is obvious, but I cannot find a way to print out the UUID
>>>or the label of a mounted reiser filesystem, in a manner similar to
>>>xfs_admin.
>>>
>>>Best way to do this?
>>>
>>>On a mounted filesystem?
>>>
>>>As non-root user?
>>>
>>>Thanks!
>>>
>>>~ - boyd
>>>
>>>Boyd Waters
>>>http://www.aoc.nrao.edu/~bwaters
>>>National Radio Astronomy Observatory
>>>Socorro, New Mexico
>>>
>>>-----BEGIN PGP SIGNATURE-----
>>>Version: GnuPG v1.2.3 (GNU/Linux)
>>>Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>>>
>>>iD8DBQE/qrMw0is8k1r0QeURAhekAJ9N7Q7USe7Hull5ydP99vdS/uYO2gCgrj0v
>>>v5MuJNmUlLEJyYWUaVjqn2M=
>>>=J7uc
>>>-----END PGP SIGNATURE-----
> 
> 

