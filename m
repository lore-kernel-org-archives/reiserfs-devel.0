From: Avinesh Kumar <avinesh_kumar@persistent.co.in>
Subject: Re: problem in mounting reiserfs
Date: Fri, 06 Aug 2004 15:37:36 +0530
Message-ID: <41135868.90608@persistent.co.in>
References: <41120713.7040706@persistent.co.in> <200408051306.29248.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20037-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408051306.29248.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

but that's not true ... i tried with block sizes 512 bytes, 1024 bytes 
and is working just fine.
is anyone who can shed some bright light on this topic ?


Christian Mayrhuber wrote:

>On Thursday 05 August 2004 12:08, Avinesh Kumar wrote:
>
>  
>
>>ReiserFS is successfully created on /dev/hda6.
>>~ $ mount -t reiserfs /dev/hda6 /rfs
>>mount: wrong fs type, bad option, bad superblock on /dev/hda6,
>>       or too many mounted file systems
>>~ $
>>
>>           but the same steps worked when i chose block size of 4096
>>bytes. please, help me out.
>>    
>>
>
>If I remember right Reiserfs cannot use blocksize != page size and page size 
>is 4096 @ x86.
>The only way to use reiserfs is with its default blocksize of 4096.
>
>  
>


-- 
regards
avinesh

====================================
EVEN IMPOSSIBLE SAYS -- I M POSSIBLE
====================================

