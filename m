From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 documentation & specifically current status of repacker,
 compression, and semantics
Date: Mon, 24 Oct 2005 23:08:00 +0400
Message-ID: <435D3110.8060204@namesys.com>
References: <200510231850.45209.jgilmore@glycou.com> <435CF334.9040805@namesys.com> <200510241225.45686.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510241225.45686.jgilmore@glycou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Gilmore <jgilmore@glycou.com>
Cc: reiserfs-list@namesys.com

John Gilmore wrote:

>On Monday 24 October 2005 14:44, Edward Shishkin wrote:
>  
>
>>John Gilmore wrote:
>>    
>>
>>>There is a 'compress' directory in in my reiser4 source tree. So is the
>>>compression plugin done? Is my disk/files compressed?
>>>      
>>>
>>not yet,
>>this is under construction..
>>
>>    
>>
>>>And if it was/wasn't
>>>how would I know the difference, and change it?
>>>      
>>>
>>I guess reiser4progs will be able to dump the attributes then
>>
>>Edward.
>>    
>>
>I thought the ability to muck around with the plugins assigned to  a 
>particular file was implemented as file-as-directory? I've tried to re-enable 
>that ability, but haven't been able to get it to work.
>

This code (pseudo plugin) has been removed as mainline folks required.
It will be supported as an optional patch a bit later

> How are plugin/file 
>relationships handled without it?
>
>  
>

For the first time there will be an option in mkfs to assign a file 
plugin for regular files per superblock.
Then (if everything will be okay) we will granulate the relationship.

Edward.
