From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: [Fwd: Re: [OT] block allocation algorithm [Was] Re: heavily	fragmented
 file system.. How to defrag it on-line??]
Date: Thu, 25 Mar 2004 16:06:33 -0800
Message-ID: <40637409.5040007@matchmail.com>
References: <40636893.3050605@matchmail.com> <1080258953.2828.3.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17486-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080258953.2828.3.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:
> On Thu, 2004-03-25 at 18:17, Mike Fedyk wrote:
> 
>>Hi guys,
>>
>>Reiser3 has worse fragmentation than ext3 in this test case.  Reiser4 
>>was better, but it had a bad worst case and still wasn't as good as xfs.
>>
>>I'm especially interested in getting reiser3 to produce fewer fragments 
>>in this test.
>>
>>Comments?
> 
> 
> There's a great deal of room for improvement in the reiser3 block
> allocator.  I've got patches against 2.4.x that make it much smarter by
> trying to spread large files apart from each other but keep small files
> (and small directories) close together.
> 
> Those are on hold until the logging and acls are done and in, but if
> people want to play around with porting them I can send you a copy.

If I knew more than Shell and Perl, I'd take you up on that offer. 
Maybe in ~6 months.  Lurking on the kernel lists really teaches you a 
lot. :-D

Mike
