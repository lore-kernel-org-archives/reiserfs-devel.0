From: Tupshin Harper <tupshin@tupshin.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Thu, 28 Aug 2003 09:33:30 -0700
Message-ID: <3F4E2EDA.3060508@tupshin.com>
References: <20030826102233.GA14647@namesys.com> <1061922037.1670.3.camel@spc9.esa.lanl.gov> <3F4BA9E9.4090108@namesys.com> <20030826184114.GP5448@backtop.namesys.com> <1061925286.1666.31.camel@spc9.esa.lanl.gov> <20030828114654.GA1361@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15470-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030828114654.GA1361@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Steven Cole <elenstev@mesatop.com>, Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, demidov <demidov@namesys.com>, god@namesys.com

Alex Zarochentsev wrote:

>On Tue, Aug 26, 2003 at 01:14:46PM -0600, Steven Cole wrote:
>  
>
>>df: `/share_r4': Value too large for defined data type
>>    
>>
>
>I can't reproduce that.  Do you see df errors each time you mount just created
>reiser4 fs?  Can you provide additional information about your system:
>distro, libc which you used?  
>
>My hypothesysis is that libc statfs or df itself want to convert "free inodes"
>result parameter which is __u64 to shorter data type.  reiser4_statfs() sets
>kstatfs->f_ffree to a large value which is close to 2^64.
>  
>
This problem is 100% reproducible for me.

mkfs.reiser4
mount
df

immediately shows the problem.

Running Debian Sid, stock kernel 2.6.0-test4 + Aug 26 reiser4 snapshot, 
Athlon XP CPU, glibc-2.3.1.

-Tupshin

