From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:53:23 -0700
Message-ID: <412E77F3.1090206@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <1093467601.9749.14.camel@leto.cs.pocnet.net> <20040825225933.GD5618@nocona.random> <412DA0B5.3030301@namesys.com> <20040826112818.GL5618@nocona.random>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826112818.GL5618@nocona.random>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrea Arcangeli <andrea@suse.de>
Cc: Christophe Saout <christophe@saout.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Andrea Arcangeli wrote:

>On Thu, Aug 26, 2004 at 01:35:01AM -0700, Hans Reiser wrote:
>  
>
>>Reiser4 plugins are not for end users to download from amazon.com, they 
>>are for weekend hackers to send me a cool plugin for me to review, 
>>assign a plugin id to, and send to Linus in the next release.  Sometimes 
>>    
>>
>
>then what's the difference in having the plugin fixed in stone into
>reiserfs? That's my whole point. Get the patch from the weekend hacker,
>check it, send the patch to Linus to add the new feature to reiser4,
>just call it "feature" not plugin. 
>
Think of it as being like VFS, where you can plugin new filesystems.  
Only in this case, you can plugin new kinds of files, and everything you 
need to implement those new kinds of files (items, nodes, keys, 
processing before flushing to disk, etc.) also gets implemented as a 
plugin.  It is an Uber-VFS.

> The only single reason we
>use modules is to avoid wasting tons of ram by loading every possible
>device driver on earth,
>
I am not concerned about ram in this design, I want nifty new kinds of 
files easy crafted over a weekend by sysadmins working in Canada and 
Guatemala.  Software engineering cost is what matters to me ( I turned 
40, so I think different now....;-) )


