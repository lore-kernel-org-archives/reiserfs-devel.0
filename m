From: Hans Reiser <reiser@namesys.com>
Subject: Re: Silly question, defrag
Date: Fri, 05 Apr 2002 19:13:39 +0400
Message-ID: <3CADBF23.4060707@namesys.com>
References: <Pine.LNX.4.44.0204050850170.6398-100000@dragon.inside.ntisys.com> <200204051404.g35E4L6H007366@foo-bar-baz.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Benjamin Scott <bscott@ntisys.com>, ReiserFS List <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:

>On Fri, 05 Apr 2002 08:50:35 EST, Benjamin Scott <bscott@ntisys.com>  said:
>
>>  What about using "idle time" to defragment the filesystem on a continuous
>>basis?  If the system is not doing anything else, a background daemon in the
>>kernel could move blocks around to optimize things.  While I expect this
>>
>
>A good idea, worth researching, but probably a royal pain to implement.
>The biggest problem is identifying "idle", and being careful to do things
>in a way that doesn't cause problems if the system suddenly goes un-idle.
>
>It's not as bad as doing an fsck on a live filesystem - but you do want to
>be sure that if a program suddenly decides to read the file you're currently
>moving around, that you do the right thing (writing gets a bit trickier -
>you have to worry about stuff like somebody doing an fsync() of a block
>that you're in the middle of moving around on the disk.  Race Condition City ;)
>
Actually, we will be able to do repacking online without a lot of extra 
code, due to our designing the right functionality into our flushing and 
journaling algorithms.

Some things become a lot easier when they are architected in at the 
beginning....

Hans

