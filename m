From: Anders Widman <andewid@tnonline.net>
Subject: Re: Silly question, defrag
Date: Wed, 3 Apr 2002 23:41:19 +0200
Message-ID: <17912855843.20020403234119@tnonline.net>
References: <200204030017.12595@X-Message-Flag:>
 <3CAABBA6.3030101@swelltech.com> <1351472281.20020403203135@tnonline.net>
 <3CAB4E3C.6010101@priocom.com>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CAB4E3C.6010101@priocom.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yura Umanets <umanets@priocom.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


> Anders Widman wrote:

>>>"Don't"
>>>
>>
>>>;-)
>>>
>>
>>>ReiserFS (and ext2|3) do fragment somewhat, but the impact is not worth 
>>>fighting over on most systems (certain environments are impacted more 
>>>than others--mail servers and web caches being two examples that are hit 
>>>pretty hard by fragmentation performance degradation).
>>>
>>
>>>Besides, there is no method to defrag ReiserFS that I know of.  Hans 
>>>plans repacking in some future version.  It will be nice, but the whole 
>>>'defrag once a month to keep your computer running smoothly' is kind of 
>>>a Windows thing.  Us Unix users don't really need to think so much on 
>>>those sorts of things.
>>>
>>
>>Fragmentation is a problem with all filesystems. There is generally no
>>way around fragmentation other than "defragment".
>>
>>If you want to add/store a large file on a 30% full filesystem it
>>would probably be stored on the first contingous area of free space.
>>This works fine until you have used most of the space and changed the
>>sizes of lots of files.
>>
>>Fragmentation is enevitable when you only have small contingous blocks
>>of free/unallocated space and want to add a larger file. After some
>>time you end up with heavily fragmentation on any filesystem. Of
>>course, this doesn't happen when you don't add or change files.
>>
>>//Anders
>>
> This is one of things (fragmentation) about which people say "well known 
> problem". Can you offer some solution?

Yes, this is a well known problem, but I don't like some peoples ignorance
when they state that "this filesystem doesnt need defragmentation, it
is 'smarter' than other filesystems". I have heard this for both
Windows NT and for Linux systems.

I can't offer a sollution for this problem, but the probably easiest
way would be a application for doing offline defragmentation. But the
nicest way would be an online defragmentation.

//Anders

