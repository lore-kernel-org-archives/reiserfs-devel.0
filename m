From: "Rob Mueller" <robm@fastmail.fm>
Subject: Re: reiser3 memory usage
Date: Thu, 8 Nov 2007 17:42:08 +1100
Message-ID: <127401c821d2$7e474d70$8900a8c0@robmhp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Chris Mason <chris.mason@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: "Vladimir V. Saveliev" <saveliev.v.v@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>

This is a repeat email that I'm sending to the correct mailing list address.

>>> Rob, this is only lightly tested, please don't run it outside of
>>> experimental systems for now.  This should do it though, I was able to
>>> reproduce the problem by running fsx-linux on data=journal.  Without
>>> the patch, the active list quickly grew to about 1/2 my total ram.
>>> With the patch it stayed at 200M.
>>
>> Well it's looking good!
>
> Just another update.
>
> It's been a week now, and this kernel is still running well. No memory
> growth, nothing appearing in the dmesg log.

Another update.

It seems this kernel has been great on 64-bit systems (x86_64), but on
32-bit systems (PAE), it hasn't actually helped at all. Unfortunately
2/3's of our systems are still 32bit PAE systems, so it would be nice to
work out exactly what's going on on these systems and try and fix it as
well.

The symptoms on PAE systems are exactly the same as before, namely used
memory pretty much approachs total memory, but we never actually get OOM
conditions. This is with data=journal.

Doing some more testing shows that the problem appears to be data=journal
related. On one server we remounted everything data=ordered, and that does
fix the problem, memory usage drops significantly as shown here:

http://robm.fastmail.fm/kernel/2007-10-31/imap2.messagingengine.com-memory-week.png

At that point, we become inode table limited, because based on previous
discussion, they have to be in lowmem:

http://robm.fastmail.fm/kernel/2007-10-31/imap2.messagingengine.com-open_inodes-week.png

Should we try running the patched kernel with the CONFIG_PAGE_OWNER option
set again to see if we can work out what's still going on here with the
data=journal mode. It would be nice to squash this bug fully. If so, Andrew
what -mm kernel would you recommend running at the moment?

One other question. We still obviously will have the problem where we have
too many inodes when running on a 32-bit kernel. Is there anything we can do
to help that? Changing vfs_cache_pressure helps a bit, but not enough to
allow all of memory to be used. Would using a 2G/2G or 1G/3G split kernel
help? On these servers, none of our individual processes tend to grow very
large (eg nothing more than 100M), so would using a 1G/3G split kernel give
us 3G of lowmem, which would allow us to cache more inodes?

Rob

