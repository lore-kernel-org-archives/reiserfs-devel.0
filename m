From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 12:44:25 -0700
Message-ID: <43136599.8020107@namesys.com>
References: <1125074717.5549.44.camel@localhost.localdomain> <1125080213.5549.100.camel@localhost.localdomain> <4310BF35.3060603@suse.com> <200508272345.09417.chrivers@iversen-net.dk> <4310E144.2070203@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4310E144.2070203@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Christian Iversen <chrivers@iversen-net.dk>, reiserfs-list@namesys.com

David Masover wrote:

> Christian Iversen wrote:
>
>> On Saturday 27 August 2005 21:29, Jeff Mahoney wrote:
>>
>>> Ming Zhang wrote:
>>
>
>> Another thing is that it can easily take several seconds to do "ls
>> -l" on a directory with a 0-10 GB data in it. Is that normal? There's
>> usually less than 50 files of test data, ranging in size from 200MB
>> to 900MB. I've disabled atime updates, but that didn't help much. The
>> controller and disks are plenty fast, so I feel something is amiss. 
>
>
> Interesting, I'd always assumed this was an issue with the lazy
> allocation.  On my box, this meant that occasionally, I'd run into a
> situation where some random FS operation would take 5-10 seconds,
> because (I assumed) it would have been the random operation that used
> up enough RAM that the FS decided to flush.
>
>
This performance issue should be fixed in reiser4, please give it a
try.  It has to do with where stat data get stored.
