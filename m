From: Hans Reiser <reiser@namesys.com>
Subject: Re: Silly question, defrag
Date: Wed, 03 Apr 2002 22:28:25 +0400
Message-ID: <3CAB49C9.9000504@namesys.com>
References: <200204030017.12595@X-Message-Flag:> <3CAABBA6.3030101@swelltech.com> <3CAABC73.3030004@namesys.com> <200204030808.26186@X-Message-Flag:>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: matthew@psychohorse.com
Cc: reiserfs-list <reiserfs-list@namesys.com>

Matthew Johnson wrote:

>>Defragging is a missing feature.  It will be the most important feature
>>of V4.1
>>
>
>4.1 seems pretty exciting, but why the need to defrag on these filesystems vs 
>others. Or do we not yet have the data? Guess I am intrigued on how these 
>work. Will defrag be included for peace of mind, or for real gain? How much 
>fragmentation can one expect? Will you need to unmount drives to defrag?
>
>Sorry for all the questions...
>
>Matt
>
>
>
The reiser4.1 repacker will not just defrag, it will repack, and maybe 
even someday compress unaccessed data.

There are a whole host of optimizations that are too expensive to do 
with every write, but very reasonable to do once a day.  Repack will be 
great!

As for why is it not in V3, the reason is simple.  Code freeze hit, and 
it was not yet started....

Hans



