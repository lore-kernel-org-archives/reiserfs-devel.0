From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 documentation & specifically current status of repacker,
 compression, and semantics
Date: Mon, 24 Oct 2005 14:11:17 -0700
Message-ID: <435D4DF5.4090602@namesys.com>
References: <200510231850.45209.jgilmore@glycou.com> <200510241225.45686.jgilmore@glycou.com> <435D3110.8060204@namesys.com> <200510241345.17620.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510241345.17620.jgilmore@glycou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Gilmore <jgilmore@glycou.com>
Cc: reiserfs-list@namesys.com, Edward Shishkin <edward@namesys.com>

John Gilmore wrote:

>On Monday 24 October 2005 19:08, Edward Shishkin wrote:
>  
>
>>John Gilmore wrote:
>>    
>>
>>>How are plugin/file
>>>relationships handled without it?
>>>      
>>>
>>For the first time there will be an option in mkfs to assign a file
>>plugin for regular files per superblock.
>>Then (if everything will be okay) we will granulate the relationship.
>>
>>Edward.
>>    
>>
>
>So the first beta of compression will only have the option to control it at 
>mkfs time?
>
It should be explained that on the first flush to disk of a new file the
default compress plugin will test to see if the first 64k is
compressable, and if it is not then it converts the file to a regular
file plugin.

Edward, confirm that you coded it that way, as I think I expressed
things more precisely this time.;-)

I believe most users will find most of their files get the right
treatment using this heuristic.

> And then later on, compression control and status information will 
>be available on a per-file (or per-directory) basis via a user-space tool 
>operating on mounted filesystems? Which tool will also be extendable to 
>control and give status information (where applicable) on other types of 
>plugins?
>
>Is there a page that I could go to - some sort of "Major feature changes" page 
>- to see what the current status of the filesystem is?
>
If you pay for the tech writer.:-/  We have less funding than most users
imagine we have.

> To answer such 
>questions as "Is compression ready for beta?" and "what the heck happened to 
>file-as-directory?" and "I saw mention of a test of the reiser4 repacker, and 
>also mention of compile problems with repacker.c, which definitely doesn't 
>exist in MY version of resier4 - what gives?" (though I've concluded that 
>that last one must be somebodies copy of alpha software...)
>
>
>  
>

