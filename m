From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 09:51:39 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <412D968B.9030107@hist.no>
References: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rik van Riel <riel@redhat.com>
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Rik van Riel wrote:

>On Thu, 26 Aug 2004, Mikulas Patocka wrote:
>  
>
>>On Wed, 25 Aug 2004, Linus Torvalds wrote:
>>    
>>
>
>  
>
>>>One way to solve it is to just realize that a final slash at the end
>>>implies pretty strongly that you want to treat it as a directory. So what
>>>you do is:
>>>      
>>>
>>Stupid question: who will use it? And why?
>>    
>>
>
>I've got a stupid question too.  How do you back up these
>things ?
>
>If your backup program reads them as a file and restores
>them as a file, you might lose your directory-inside-the-file
>magic.
>
>If your backup program dives into the file despite stat()
>saying it's a file and you restore your backup, how are the
>"file is a file" semantics preserved ?
>
>  
>
>Obviously this is something that needs to be sorted out at
>the VFS layer.  A filesystem specific backup and restore
>program isn't desirable, if only because then there'd be
>no way for Hans's users to switch to reiser5 in 2010 ;)
>
>  
>
Sure, this sort of thing must be sorted out at the VFS layer.
And a backup program working on such a filesystem
will need to know that something can be a file, a directory - or both.

So an old "tar" won't get this right as it will assume that an object
is either file or directory.  The change to get it right won't be
that big - just notice that an object is both, then backup the
ordinary file contents as usual, before recursing into the
directory it also provides and backup stuff there as usual.

The resulting .tar can of course only be unpacked properly
on a fs supporting file-as-directory, similiar to how a .tar of
a fs with links only will unpack properly on a fs supporting links.

I don't see much problems for userland.  Old apps will keep working,
as the new features is a superset.  Those who care about
file-as-directory extras will provide patches for "tar" and friends,
after that the extras become useable.

Helge Hafting
