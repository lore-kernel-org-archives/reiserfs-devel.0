From: David Lang <david.lang@digitalinsight.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 7 Sep 2004 15:56:08 -0700 (PDT)
Message-ID: <Pine.LNX.4.60.0409071552070.10789@dlang.diginsite.com>
References: <200409070206.i8726vrG006493@localhost.localdomain><413D4C18.6090501@slaphack.com>
 <m3d60yjnt7.fsf@zoo.weinigel.se><413DFF33.9090607@namesys.com>
 <m3vfepiv7r.fsf@zoo.weinigel.se><Pine.LNX.4.60.0409071528200.10789@dlang.diginsite.com>
 <m3isapitmr.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3isapitmr.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Christer Weinigel <christer@weinigel.se>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 8 Sep 2004, Christer Weinigel wrote:

> Subject: Re: silent semantic changes with reiser4
> 
> David Lang <david.lang@digitalinsight.com> writes:
>
>> so far the best answer that I've seen is a slight varient of what Hans
>> is proposing for the 'file-as-a-directory'
>>
>> make the base file itself be a serialized version of all the streams
>> and if you want the 'main' stream open file/. (or some similar
>> varient)
>
>> in fact it may make sense to just open file/file to get at the 'main'
>> stream of the file (there may be cases where the concept of a single
>> main stream may not make sense)
>
> So what happens if I have a text file foo.txt and add an author
> attribute to it?  When I read foo.txt the next time it's supposed to
> give me a serialized version with both the contents of foo.txt _and_
> the author attribute?
>
> That would definitely confuse me.
>
> Or did I misunderstand something?
>

good point. under my scheme you would need to access foo.txt/foo.txt or 
foo.txt/. instead of just foo.txt

I guess my way would work if there is a way to know that a file has been 
extended (or if you just make it a habit of opening the file/file instead 
of just file) but not for random additions of streams to otherwise normal 
files.

Oh well, it seemed like a easy fix (and turned out to be to easy to be 
practical)

David Lang

>  /Christer
>
> --
> "Just how much can I get away with and still go to heaven?"
>
> Freelance consultant specializing in device driver programming for Linux
> Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
>

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan
