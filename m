From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree fails in pass 2
Date: Thu, 15 Jan 2004 16:07:37 +0300
Message-ID: <200401151601.25022.vitaly@namesys.com>
References: <400689ed.42cd.0@cpinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400689ed.42cd.0@cpinternet.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mharnois@cpinternet.com, reiserfs-list@namesys.com

Hello,

On Thursday 15 January 2004 15:39, Michael Harnois wrote:
> I am running a 2.6.1 kernel pulled from bk yesterday and using
> reiserfsprogs-3.6.11. Something happened after I rebooted that
> caused filesystem corruption which instructed me to run
> rebuild-tree. But it will not run to completion. During pass 2
> it fails with
> 	Assertion `*first < bm->bm_bit_size' failed
>
> Any ideas?

Looks like a broken hardware (RAM?) or probably you build the 
progs not statically on one computer and then run reiserfsck on 
another one (with another glibc installed). Would you check it?

-- 
Thanks,
Vitaly Fertman
