From: David Masover <ninja@slaphack.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Sat, 27 Aug 2005 16:55:16 -0500
Message-ID: <4310E144.2070203@slaphack.com>
References: <1125074717.5549.44.camel@localhost.localdomain> <1125080213.5549.100.camel@localhost.localdomain> <4310BF35.3060603@suse.com> <200508272345.09417.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508272345.09417.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

Christian Iversen wrote:
> On Saturday 27 August 2005 21:29, Jeff Mahoney wrote:
> 
>>Ming Zhang wrote:

> Another thing is that it can easily take several seconds to do "ls -l" on a 
> directory with a 0-10 GB data in it. Is that normal? There's usually less 
> than 50 files of test data, ranging in size from 200MB to 900MB. I've 
> disabled atime updates, but that didn't help much. The controller and disks 
> are plenty fast, so I feel something is amiss. 

Interesting, I'd always assumed this was an issue with the lazy 
allocation.  On my box, this meant that occasionally, I'd run into a 
situation where some random FS operation would take 5-10 seconds, 
because (I assumed) it would have been the random operation that used up 
enough RAM that the FS decided to flush.
