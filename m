From: V13 <v13@priest.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 2 Sep 2004 13:27:20 +0300
Message-ID: <200409021327.22998.v13@priest.com>
References: <20040826150202.GE5733@mail.shareable.org> <4136E0B6.4000705@namesys.com> <1117111836.20040902115249@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117111836.20040902115249@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thursday 02 September 2004 12:52, Spam wrote:
> > Linus Torvalds wrote:
> > Besides, there are enhancements which are simply compelling.  You can
> > write a dramatically better performance version control system with a
> > much simpler design if the FS is atomic.    Our transaction manager
> > first draft was written by a version control guy, and he would probably
> > be happy to tell you how  lack of atomicity other than rename makes
> > version control software design hideous.
>
>   Btw, version control for ordinary files would be a great feature. I
>   think something like it is available through Windows 2000/3 server.
>   Isn't it called "Shadow Copies". It works over network shares. :)
>
>   It allows you to restore previous versions of the file even if you
>   delete or overwrite it.
>
>   Features like this do make a good point and helps protecting data -
>   something that is important IMHO.

I believe you mean something simillar to: 

file1.txt;1
file1.txt;2
file1.txt;3 (yeap, it's VMS) 

where you'll have to cleanup old versions when you don't need them any more... 
AFAIK that this is older than HDDs

<<V13>>
