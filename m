From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:53:51 -0700
Message-ID: <412E780F.7000009@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>	 <20040825200859.GA16345@lst.de> <20040825201929.GA16855@lst.de>	 <412DA25E.9090405@namesys.com> <1093527487.21878.270.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093527487.21878.270.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Chris Mason wrote:

>
>
>If the early linux filesystems had taken the same attitude you have
>(don't write new filesystems, only write plugins), there would be no
>framework allowing the wealth of filesystems we do have, including
>reiser4.
>
>  
>
Au contraire, with my approach, there would be 10x as many filesystems, 
because people would be easily able to mix-and-match different methods 
and plugins from different filesystems together, and if you wanted the 
MySQL semantics, you would mount mysql, and if you wanted the zope 
semantics you would mount zope.
