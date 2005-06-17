From: mross@rs-net.org
Subject: Re: reiser4 corruption
Date: Fri, 17 Jun 2005 13:50:52 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506171348350.6542@localhost>
References: <Pine.LNX.4.60.0506171108440.6542@localhost> <42B30380.90606@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B30380.90606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

> What patch set did you apply? If this is the last one (reiser4-for-2.6.11-5) 
> there is some inconsistency due to format changes
> that will be fixed in the next release.

Yes, it was reiser4-for-2.6.11-5. Would this inconsistency cause fsck to 
find problems that just didn't exist? Would fsck's attempt to "fix" this 
problem be harmful?

Thanks,

-Ross
