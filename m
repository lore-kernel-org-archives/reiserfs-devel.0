From: Anders Widman <andewid@tnonline.net>
Subject: Re: Silly question, defrag
Date: Thu, 4 Apr 2002 11:16:51 +0200
Message-ID: <20972156.20020404111651@tnonline.net>
References: <200204030017.12595@X-Message-Flag:>
 <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:>
 <20020403154906.A21821@ultraviolet.org>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020403154906.A21821@ultraviolet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tracy R Reed <treed@ultraviolet.org>
Cc: reiserfs-list@namesys.com

> On Wed, Apr 03, 2002 at 08:08:21AM -0800, Matthew Johnson wrote:
>> On Wednesday 03 April 2002 00:21, Joe Cooper wrote:
>> > "Don't"
>> >
>> 
>> Well I don't, but when newbies who are used to computing on win32 systems 
>> hear that they may not just accept the word don't. Actually its hard to find 
>> the reasons exactly why one does not defrag.

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

>> Perhaps I should aim this message to the kernel mailing list, so that I can 
>> get response from a wider array of people who like other filesystems. But its 
>> not kernel related. 

> I wouldn't recommend doing that. The answer is pretty much the same
> regardless of the filesystem. If it's a non-FAT fs you probably don't have
> to worry about fragmentation.

I do not agree. I run a fileserver with a 814GB filesystem using
ReiserFS (I have run NTFS and ext2/3 also). Modern filesystems might
be smarter in storing new files by not packing them tightly.

In my case that workes fine up to a certain percentage, after that ALL
new files are beeing fragmented due to the fact that there is only
small blocks of space between all files. I don't see any filesystem
that don't need defragmentation. Not in my case.

//Anders

