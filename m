From: Timothy Miller <miller@techsource.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 20:00:21 -0400
Message-ID: <41424015.1020804@techsource.com>
References: <200409101815.i8AIFc5i005300@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409101815.i8AIFc5i005300@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Hans Reiser <reiser@namesys.com>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, Jamie Lokier <jamie@shareable.org>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



Horst von Brand wrote:
> Hans Reiser <reiser@namesys.com> said:
> 
>>Timothy Miller wrote:
> 
> 
> [...]
> 
> 
>>>You know, if tools all need to be rewritten anyway to deal with the 
>>>file metadata "directory", then why not change the symbol that 
>>>delimits the metadata key?
> 
> 
>>because it is useful that it is only a style convention.  Changing the 
>>symbol makes it mandatory to distinguish metafiles from files.
> 
> 
> If they are really different than directories, it should be clear what is
> what, IMVHO. If they aren't different, they have no place here. Trying to
> break hoary Unix tradition (files and directories are separate) while
> pretending nothing has changed (see, a file can be handled just like a
> directory) just doesn't cut it.


I think that sums up what I was trying to say better than what I said 
did.  :)

