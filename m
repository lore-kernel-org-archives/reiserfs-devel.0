From: Helge Hafting <helge.hafting@hist.no>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 09 Sep 2004 13:22:34 +0200
Message-ID: <41403CFA.7000206@hist.no>
References: <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org> <4136E0B6.4000705@namesys.com> <4699bb7b04090202121119a57b@mail.gmail.com> <4136E756.8020105@hist.no> <4699bb7b0409020245250922f9@mail.gmail.com> <413829DF.8010305@hist.no> <20040905134428.GN26560@thundrix.ch> <413ECFD8.1040808@hist.no> <20040908160228.GC2726@thundrix.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040908160228.GC2726@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Oliver Hunt <oliverhunt@gmail.com>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Tonnerre wrote:

>Salut,
>
>On Wed, Sep 08, 2004 at 11:24:40AM +0200, Helge Hafting wrote:
>  
>
>>If you can open a fork/substream/whatever by issuing
>>open("filename/forkname", ...
>>then the old-fashioned open() works with multi-fork files too.
>>An tools based on "open() something, then work with
>>the resulting file descriptor" will work _unchanged_
>>with such a multi-fork fs.
>>    
>>
>
>In my version they'd run unchanged as well.
>
>And  BTW,  I wasn't  talking  about introducing  a  new  open at  libc
>level.  I was  talking about  modifying the  open system  call  in the
>kernel and having libc provide compatibility for the old call.
>
>Since  I'm not  sure  how much  breakage it  takes  to make  a file  a
>directory.
>
I believe most of the changes necessary for supporting file-as-dir
will be in the internal workings of filesystems, not so much in
the interfaces.  I don't think it is necessary to change the
open system call, because opening a file in a subdirectory
or a named substream is the same thing.

The _uses_ people have suggested for file-as-dir (complex file attributes
and different views of the data) tends to be different from what
a directory usually does, but the implementation doesn't have to be.
There's no need to add extra interfaces or restrictions.  File-as-dir that
really is a directory, so that it may contain a whole tree is more flexible.
And the underlying fs can use existing directory code instead of
something extra.

So the only change needed for the open system call is that it will
suddenly succeed in the open("filename/forkname") case that
used to complain about an invalid path because "filename"  isn't a 
directory.
"stat" may have to change though, so it can identify a file-as-dir.

Helge Hafting




