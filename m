From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Fri, 09 Jun 2006 01:05:39 -0700
Message-ID: <44892BD3.5090604@namesys.com>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero> <1149604706.6389.40.camel@tribesman.namesys.com> <20060606153035.GF10672@HAL_5000D> <4485D69B.1090608@namesys.com> <20060608140653.GA5851@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060608140653.GA5851@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Make both XFS or both reiser4, and speed will likely increase.  Please
try and report the result if you could.


Tom Vier wrote:

>On Tue, Jun 06, 2006 at 12:25:15PM -0700, Hans Reiser wrote:
>  
>
>>Maybe I should ask the following: is the slow drive using reiser4?  If
>>    
>>
>
>No, it was ext2.
>
>  
>
>>reiser4, was the slow drive image created by copying from a reiser4
>>image or an ext3 image?   (Standard benchmarking mistake: creating an
>>image for a test from a filesystem not the one that is being tested. 
>>readdir order matters.)
>>    
>>
>
>Would that really make much difference?
>
>I think the problem here is a general problem with delayed allocation,
>regardless of which fs impliments it. The fs'es need to stream out writes.
>If it's possible (i don't know if fs'es are allowed this info from the vfs),
>i think after a short timeout of a file no longer being open for writing, it
>should be written. Maybe have a longer delay for smaller files, so they pack
>better. Past a certain size threshold, once a file is closed (or only opened
>read-only) i think it should be flushes without much delay. Especially if
>the blk dev is idle (but knowing that at the fs level may well be impossible
>w/o modding the vfs api). I think linux (and other os'es) are in need of
>more intelligent io scheduling (higher level than just sector elevators).
>
>One problem with my suggestion is that apps don't always close or reopen
>read-only after they write a file.
>
>  
>

