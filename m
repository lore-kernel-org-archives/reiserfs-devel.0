From: Will Dyson <will_dyson@pobox.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 12:32:34 -0400
Message-ID: <412E10A2.1020801@pobox.com>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412D9FE6.9050307@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hans Reiser wrote:

> Andrew, we need to compete with WinFS and Dominic Giampaolo's filesystem 
> for Apple, and that means we need to put search engine and database 
> functionality into the filesystem.  It takes 11 years of serious 

Hans,

I'm very curious about your ideas on how to put search engine and 
database functionality into the filesystem. Although I've let the Befs 
filesystem driver largely stagnate over the past two years, from time to 
time I think about the problem of exporting to userspace the attribute 
indexes that BeFS keeps on disk.

In the original BeOS, they solved the problem by having the filesystem 
driver itself take a text query string and parse it, returning a list of 
inodes that match. The whole business of parsing a query string in the 
kernel (let alone in the filesystem driver) has always seemed ugly to 
me. However, the best alternative I've come up with is to simply export 
the index data as a special file (perhaps in sysfs?) and have userspace 
responsible for searching the index. That would probably work, but it 
wouldn't help other filesystems that implement even a different index 
format, much less a different form of extra searchability.

-- 
Will Dyson
"Back off man, I'm a scientist!" -Dr. Peter Venkman
