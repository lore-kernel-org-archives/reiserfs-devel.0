From: Anders Widman <andewid@tnonline.net>
Subject: Re: Silly question, defrag
Date: Wed, 3 Apr 2002 20:31:35 +0200
Message-ID: <1351472281.20020403203135@tnonline.net>
References: <200204030017.12595@X-Message-Flag:>
 <3CAABBA6.3030101@swelltech.com>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CAABBA6.3030101@swelltech.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Cooper <joe@swelltech.com>
Cc: reiserfs-list@namesys.com

> "Don't"

> ;-)

> ReiserFS (and ext2|3) do fragment somewhat, but the impact is not worth 
> fighting over on most systems (certain environments are impacted more 
> than others--mail servers and web caches being two examples that are hit 
> pretty hard by fragmentation performance degradation).

> Besides, there is no method to defrag ReiserFS that I know of.  Hans 
> plans repacking in some future version.  It will be nice, but the whole 
> 'defrag once a month to keep your computer running smoothly' is kind of 
> a Windows thing.  Us Unix users don't really need to think so much on 
> those sorts of things.

Fragmentation is a problem with all filesystems. There is generally no
way around fragmentation other than "defragment".

If you want to add/store a large file on a 30% full filesystem it
would probably be stored on the first contingous area of free space.
This works fine until you have used most of the space and changed the
sizes of lots of files.

Fragmentation is enevitable when you only have small contingous blocks
of free/unallocated space and want to add a larger file. After some
time you end up with heavily fragmentation on any filesystem. Of
course, this doesn't happen when you don't add or change files.

//Anders


> Matthew Johnson wrote:
>> This is kind of a general silly question, but one that crops now and again. 
>> Especially from newbies...
>> 
>> Whats the best, most accurate answer to give to a newbie when they ask how to 
>> defrag their hard drive, and does ReiserFS vary in itself with regards to 
>> this, with say ext2? Its just a question I sometimes get and wondered the 
>> best answer to this.
>> 
>> Kind regards,
>> 
>> Matt

