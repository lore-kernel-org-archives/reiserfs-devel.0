From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: The argument for fs assistance in handling archives
Date: Wed, 08 Sep 2004 11:24:40 +0200
Message-ID: <413ECFD8.1040808@hist.no>
References: <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org> <4136A14E.9010303@slaphack.com> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org> <4136E0B6.4000705@namesys.com> <4699bb7b04090202121119a57b@mail.gmail.com> <4136E756.8020105@hist.no> <4699bb7b0409020245250922f9@mail.gmail.com> <413829DF.8010305@hist.no> <20040905134428.GN26560@thundrix.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040905134428.GN26560@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Oliver Hunt <oliverhunt@gmail.com>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Tonnerre wrote:

>Salut,
>
>On Fri, Sep 03, 2004 at 10:22:55AM +0200, Helge Hafting wrote:
>  
>
>>Requiring another syscall to open forks other than the primary
>>breaks _all_ existing software because it obviously don't use that
>>syscall yet.  And then it doesn't provide any advantages over the
>>file-as-plain-directory way. . .
>>    
>>
>
>Actually...
>
>We might tune the sys_open()  call to take an additional argument (the
>stream ID),  and introduce a compatibility interface  into *libc which
>chooses strid=0 by default if the plain old open call is being used.
>  
>
But this isn't necessary, as I pointed out above.
There is no _need_ for a new kind of open(), so
why make one in libc?

If you can open a fork/substream/whatever by issuing
open("filename/forkname", ...
then the old-fashioned open() works with multi-fork files too.
An tools based on "open() something, then work with
the resulting file descriptor" will work _unchanged_
with such a multi-fork fs.

Tools that rely on "stat" or directory traversals might need
some updating to work perfectly with such a fs, but not something
that just opens by name.

Helge Hafting


