From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Silly question, defrag
Date: Thu, 04 Apr 2002 03:58:29 +0200
Message-ID: <3CABB345.8010204@netscape.net>
References: <200204030017.12595@X-Message-Flag:> <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:> <20020403154906.A21821@ultraviolet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tracy R Reed <treed@ultraviolet.org>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 04/04/2002 01:49 AM, Tracy R Reed wrote:

> On Wed, Apr 03, 2002 at 08:08:21AM -0800, Matthew Johnson wrote:
> 
>>On Wednesday 03 April 2002 00:21, Joe Cooper wrote:
>>
>>>"Don't"
>>>
>>>
>>Well I don't, but when newbies who are used to computing on win32 systems 
>>hear that they may not just accept the word don't. Actually its hard to find 
>>the reasons exactly why one does not defrag.
>>
> 
> It is more useful to look at why one DID defrag back in the bad ol' days
> of DOS and Windows. IIRC, the FAT filesystem would scan through it's
> equivalient of the free block list and start writing at the first free
> block. If it wrote for a while and then there was other data in the way it
> stop and go to the next free space. This way fragmentation was practically
> guarenteed and it happened rapidly. Modern filesystems use much smarter
> ways of laying out data on the disk so that fragmentation happens much
> less often. Now you will almost certainly waste more time by defragmenting
> than you would suffering whatever performance hit the little fragmentation
> there is causes. I've been using Linux/Unix for 10 years and I have never
> (not once!) defragged a filesystem.
> 
> 
>>Perhaps I should aim this message to the kernel mailing list, so that I can 
>>get response from a wider array of people who like other filesystems. But its 
>>not kernel related. 
>>
> 
> I wouldn't recommend doing that. The answer is pretty much the same
> regardless of the filesystem. If it's a non-FAT fs you probably don't have
> to worry about fragmentation.
> 
> 

Yesss. I like defragmenters on my Win98 disks, as I really see a speedup 
after using them (e.g after new software installations OR a longer 
status quo, but the effect depends on the defragmenters configuration).

You describe how/why this makes sense on FAT FS.

When I backupped my ReiserFS partitions monthly I used to recreate the 
original FS if everything was o.k. and copy back the whole content. 
That's no server here, it's a standalone notebook. After that procedure 
I found some applications that worked faster and some that were slower 
than before. O.k. I may have only subjectively compared the load times 
of NS6 +32MB disk cache and SO5.2. They were different than before 
copying, but the sum didn't show any advantage.

So?: I don't really need a Defragmenter on v3.6 ReiserFS in FAT scales 
for my usage and I really don't need to recreate and copy-back.

Mmh, just wanted to add my experience,

best wishes,

Manuel





