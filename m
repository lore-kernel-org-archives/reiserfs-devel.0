From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:54:09 -0700
Message-ID: <412E7821.7020100@namesys.com>
References: <Pine.LNX.4.44.0408260935130.26316-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408260935130.26316-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Rik van Riel wrote:

>On Thu, 26 Aug 2004, Andrew Morton wrote:
>
>  
>
>>All of which can be handled in userspace library code.
>>
>>What compelling reason is there for doing this in the kernel?
>>    
>>
>
>There's a compelling reason to do it in userspace.  If an
>unaware program copies or moves such a file with streams
>inside, it doesn't break the streams and aware programs will
>continue to see them.
>
>OTOH, if we had the streams in the kernel, unaware applications
>would continuously break the metadata and streams that the
>streams aware programs expect !
>
>  
>
Well, first off, you don't want streams in the kernel, you want all the 
little pieces that can be composed together into a stream if you so 
choose.  Streams are ugly, the pieces are all cool.
