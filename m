From: David Masover <ninja@slaphack.com>
Subject: Re: somewhat OT query on journalling
Date: Fri, 21 Jul 2006 13:54:41 -0500
Message-ID: <44C122F1.7000109@slaphack.com>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com> <44BE95F6.50004@namesys.com> <20060721124518.GA1977@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060721124518.GA1977@tranquility.scriptkitchen.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payal Rathod <payal-fs@scriptkitchen.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Payal Rathod wrote:
> On Wed, Jul 19, 2006 at 01:28:38PM -0700, Hans Reiser wrote:
>> V3 defaults to metadata only, V4 does data also because we can do it
>> without performance loss.
> 
> wwwwwwowwwww!!! 

Don't get too excited -- the transactions probably aren't done yet. 
Without those, no filesystem that claims to journal data is really any 
better than a filesystem which only journals metadata.  Even once they 
are implemented (or even if they are already), applications have to 
support them directly.

Regarding transactions in general, you should probably look for some 
papers or tutorials for how they are implemented in databases.  You 
might also read the Reiser4 whitepaper for an idea of how they could be 
implemented in a filesystem.

But no transactional system will work unless applications at least know 
about it.  This is why apps currently rely on features that are known to 
be atomic in a filesystem.  For instance, look at maildirs -- they are 
effectively 100% data journaled on any filesystem that journals metadata 
properly.

>> reiserfs does not use inodes at all.  see our website for more.
> 
> Any particular page you are referring to? I didn't see a page for that 
> there.

Front page of Namesys.com has the Reiser4 whitepaper.  It's a bit out of 
date, as some features still listed for 4.0 have been pushed to 4.1 or 
later, but I don't think the overall plan has changed.
