From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 14:33:13 +0200
Message-ID: <412F2A09.7050104@hist.no>
References: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>	<412D968B.9030107@hist.no> <20040826022137.1504ffb7.pj@sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826022137.1504ffb7.pj@sgi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Jackson <pj@sgi.com>
Cc: riel@redhat.com, mikulas@artax.karlin.mff.cuni.cz, torvalds@osdl.org, hch@lst.de, reiser@namesys.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Paul Jackson wrote:

>Helge wrote:
>  
>
>>So an old "tar" won't get this right as it will assume that an object
>>is either file or directory.
>>    
>>
>
>There are many backup apps, not just one.  I've written a few myself,
>none of which will ever be worthy of notice.  The sourceforge
>Topic.System.Archiving.Backup lists 335 projects at present.
>
>I find the idea that most backup tools and scripts will silently
>stop working correctly to be pretty scary.  
>  
>
They won't stop working, they will merely not support
the new features.  That is only a problem if
you actually use those features.  If all you have
is plain files and plain directories - no problem.  Not
if files-as-directories are implemented right.

Helge Hafting
