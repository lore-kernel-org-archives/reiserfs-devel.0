From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:43:32 -0700
Message-ID: <412DA2B4.6030709@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825201929.GA16855@lst.de> <Pine.LNX.4.58.0408251323170.17766@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20592-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408251323170.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Linus Torvalds wrote:

>On Wed, 25 Aug 2004, Christoph Hellwig wrote:
>  
>
>>Over the last at least five years we've taken as much as possible
>>semantics out of the filesystems and into the VFS layer, thus having
>>a separation between the semantical layer (VFS) and the low level
>>filesystem.  Your attributes are absoultely a VFS thing and as such
>>should not happen at the filesystem layer, and no, that doesn't mean
>>they're bad per se, I just think they are a rather bad fit for Linux.
>>    
>>
>
>Now this I agree with, in the sense that I think that if we want to 
>support this, it should be supported at a VFS layer. 
>
>On the other hand, I think doing it inside the filesystem with ugly hacks 
>  
>
what is ugly? ;-/

>is an acceptable way to prototype the idea before it's been proven to 
>really be workable. Maybe it has more problems with legacy apps than we'd 
>expect..
>
>		Linus
>
>
>  
>

