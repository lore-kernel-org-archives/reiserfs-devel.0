From: Hans Reiser <reiser@namesys.com>
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link:	insert_item	returned
 -28
Date: Fri, 16 Jan 2004 16:29:40 +0300
Message-ID: <4007E744.4060102@namesys.com>
References: <200401091622.41352.lkml@kcore.org>	 <4007A54A.3030005@namesys.com>	 <1074244260.2250.45.camel@tribesman.namesys.com>	 <200401161229.30831.lkml@kcore.org>  <4007DBC6.4040606@namesys.com>	 <1074257413.2250.53.camel@tribesman.namesys.com>	 <4007DF3E.6010307@namesys.com> <1074259779.29546.79.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074259779.29546.79.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Jan De Luyck <lkml@kcore.org>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2004-01-16 at 07:55, Hans Reiser wrote:
>
>  
>
>>>At this case we do not return ENOSPC. Operation which failed due to
>>>ENOSPC was "save link" insertion. The major operation (unlink or
>>>truncate) just continues without "save links". (save link are used to be
>>>able to complete removal of unlinked/truncated files on reboot if they
>>>did not manage to get properly removed/truncated due to unclean
>>>shutdown).
>>>      
>>>
>
>  
>
>>so it is a real bug which can result in space leaks?
>>    
>>
>
>It's a limitation.  The only way around it would be to somehow reserve
>the space for the savelink when you create the file.  It's a rare case
>and the FS carries on as best it can.
>
>-chris
>
>
>
>
>  
>
does it leak space?

-- 
Hans


