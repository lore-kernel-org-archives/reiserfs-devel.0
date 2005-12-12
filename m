From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 error?
Date: Mon, 12 Dec 2005 08:04:10 -0800
Message-ID: <439D9F7A.3070804@namesys.com>
References: <20051210091633.4B4CCE2C08C@durgerlan.nl> <439D42C7.2000806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <439D42C7.2000806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: iwan@durgerlan.nl, reiserfs-list@namesys.com

Fix the warning.  No warnings that don't mean anything unless
REISERFS_DEBUG is turned on.

Hans

Vladimir V. Saveliev wrote:

>Hello
>
>iwan@durgerlan.nl wrote:
>  
>
>>Hello,
>>
>>I was on #reiser4 on irc.oftc.net yesterday to ask about an error I got and
>>someone sugested that I send an email to this list... here is the
>>information:
>>
>>I'm using reiser4 as off today and I've got this error in dmegs:
>>
>><4>reiser4[cp(5184)]: update_stale_dk (fs/reiser4/search.c:1363)[nikita-38210]:
>>WARNING: stale dk
>>
>>does anyone know what that could mean?
>>
>>    
>>
>
>This is just a warning. If that does not happen very often and if you see
>nothing wrong - you should ignore this.
>
>  
>
>>I'm using Linux backup.unetix.nl 2.6.14.1-ARC12 #2 SMP Fri Dec 9 16:47:25 CET 2005 i686 unknown unknown GNU/Linux
>>with the corresponding reiser4 packages from ftp.namesys.com
>>the reiser4 partition is on an Areca ARC1260 RAID card:
>>/dev/sdb  6.1T  174G  5.9T   3% /backup
>>
>>any help is appriciated.
>>    
>>
>
>
>
>  
>

