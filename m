From: Hans Reiser <reiser@namesys.com>
Subject: Re: CONFIG_REISERFS_RAW (http://www.namesys.com/config.html)
Date: Tue, 18 Feb 2003 21:33:54 +0300
Message-ID: <3E527C92.6070409@namesys.com>
References: <200302161452.21451.m.c.p@gmx.net> <3E5278C3.7030608@swelltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5278C3.7030608@swelltech.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joe Cooper <joe@swelltech.com>
Cc: Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com

Joe Cooper wrote:

> You don't want to use it...
>
> But if you do:
>
> http://swelltech.com/pengies/joe/squidng.html
>
> This page has the last versions of both the Squid and ReiserFS that 
> have this feature.  It hasn't been supported in over two years, and it 
> wasn't a trivial set of patches even then...I doubt you'd have much 
> hope of getting either working in recent versions of Squid or kernel 
> without significant help from both projects (probably paid help--this 
> is deep code, and a lot of work to integrate).  It was a pretty darned 
> fast Squid, though.
>
> Marc-Christian Petersen wrote:
>
>> Hi all,
>>
>> can anyone tell me where I can find this code:
>>
>>
>> CONFIG_REISERFS_RAW
>>     Setting this to yes will enable a set of ioctls that provide raw
>>     interface to the ReiserFS tree, bypass the directories, and
>>     automatically remove aged files. This is an experimental feature
>>     designed for squid cache directories. See 
>> Documentation/filesystems/reiserfs_raw.txt
>>     This was designed specifically to use ReiserFS as a back-end for
>>     the Squid. The general idea is that it is possible to bypass all
>>     filesystem overhead and to directly address the ReiserFS internal
>>     tree. This is not in the stock kernels.
>> ?
>>
>> Thanks.
>>
>> ciao, Marc
>
>
>
The sponsor for the work did the usual dotcom number....

We would be happy to do more work if there was a sponsor....

-- 
Hans


