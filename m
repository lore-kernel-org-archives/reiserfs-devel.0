From: Alftheo Potgieter <alftheo@telkomsa.net>
Subject: Re: rebuild-tree does not complete: filesystem full
Date: Sat, 25 Mar 2006 12:47:35 +0200
Message-ID: <44251FC7.3020409@telkomsa.net>
References: <441F305A.20809@telkomsa.net> <200603211104.34995.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603211104.34995.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com

How do I resize the filesystem while it is corrupted?

Vitaly Fertman wrote:

>Hello
>
>On Tuesday 21 March 2006 01:44, alftheo potgieter wrote:
>  
>
>>Hi
>>I'm using the latest reiserfsck (3.6.19),,
>>My filesystem got corrupted by an unexpected power loss. Initially, I 
>>could mount the filesystem read-only with minor problems. As I had 
>>nowhere to back it up, I ran reiserfsck --rebuild-tree, which could not 
>>complete, as the filesystem was full.
>>    
>>
>
>it is possible to get such a corruption that fsck will need to 
>insert some extra metadata to successfully repair the fs. this 
>process may run out of disk space. I have an improved version 
>of reiserfsck, which detects these corruptions and avoid these 
>metadata insertion. however your fs already has these metadata 
>inserted and there is probably no space to proceed.
>
>I will send you that improved reiserfsck, if it runs out of disk
>space too, you need to enlarge you partition, enlarge fs, and run
>reiserfsck again.
>
>If you will need to enlarge the partition, before doing it, 
>please zero the space that will be added into the partition 
>to avoid mixing your reiserfs metadata with another reiserfs 
>metadata.
>
>  
>
>>Now it is flagged as unmountable "to prevent further corruption". Is 
>>there any way to restore the filesytem to the previous mountable but 
>>corrupted state (which would be infinitely more useful)? I imagine 
>>either finding the root node again or somehow growing the filesystem (as 
>>I have since found enough space to grow it)
>>
>>Any help would be useful.
>>
>>alf
>>
>>
>>    
>>
>
>  
>

