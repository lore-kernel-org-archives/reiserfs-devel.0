From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 20:24:45 -0400
Message-ID: <200408280024.i7S0OjmB024038@localhost.localdomain>
References: <akpm@osdl.org>
Return-path: <reiserfs-list-return-21057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Andrew Morton <akpm@osdl.org> 
   of "Thu, 26 Aug 2004 04:20:43 MST." <20040826042043.15978b0a.akpm@osdl.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Spam <spam@tnonline.net>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Andrew Morton <akpm@osdl.org> said:
> Spam <spam@tnonline.net> wrote:
> >
> >    Secondly, do you expect file managers like Nautilus and Konqueror to
> >    support  every piece of file format on the planet so they could read
> >    information directly from the documents?
> 
> Sure.  You're proposing that we implement a single, golden multi-stream file
> format in the kernel.

Which won't be able to cater for all needs, I'm afraid. Just look at /etc,
and contemplate why there are so many different configuration file formats.
Sure, some are just random coder preferences set in stone, but others do
make sense being different. The same will happen with file formats. Heck,
it is already that way, with file formats for C source code, ELF shared
libraries, various graphics and audio and video formats, ...

> We could just as well do that in libmultistreamfileformat.so.

Right.

> But I'll grant that one cannot go adding new metadata to, say, C files this
> way.  I don't know how useful such a thing is though.

You can never know. Perhaps annotations in swahili? Alternative versions
for different architectures? In object format(s)? Copyright info? 
Changelog?

> Remember that my main point is that there's a lack of coordination in
> userspace.  Hell, there's none.  Putting it in-kernel forces that
> coordination, and may be the way to go, but it's pretty sad.

I think that forcing coordination is wrong.  For example, I do value having
ar/tar/cpio/zip doing essentially the same thing (and being able to define
and use my own way of doing it if it pleases me), and I'd strongly oppose
the kernel forcing one way of doing it down my throat.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
