From: David Masover <jedi@ninja.dynup.net>
Subject: Garbage collection for files (was Re: More on Hard Links (was A bold
 idea (Re: Carrying Attributes too Far)))
Date: Fri, 05 Dec 2003 19:50:45 -0600
Message-ID: <3FD135F5.804@ninja.dynup.net>
References: <2342084747-BeMail@cr593174-a>	<3FD0912C.1090700@ninja.dynup.net>	<16336.37772.88198.217245@laputa.namesys.com>	<3FD0AB30.6060305@namesys.com> <16336.45022.572929.274859@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16336.45022.572929.274859@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


I will step aside and let the smart people figure this out.  Only one 
real suggestion -- most directories will not have loops.  I'm not sure 
how, but I'd imagine it's possible to use refcounts there and other 
forms of garbage collection elsewhere.  I felt my refcount-based idea 
was clean and cool-looking, but I have had approximately 10-15 mins of 
experience in this subject.

Only one question -- does it work for rm -rf?

Thread below:

Nikita Danilov wrote:

>Hans Reiser writes:
> > Nikita Danilov wrote:
> > 
> > > But if multiple hard-links to the directories
> > >are allowed, file system is an arbitrary graph. It makes little sense to
> > >try to stretch reference counting to work in this situation. There are
> > >much more efficient forms of garbage collection for this.
> > >
> > >Nikita.
> > >
> > >
> > >  
> > >
> > Educate us, I am curious.
>
>http://citeseer.nj.nec.com/jones03garbage.html is a recent bibliography
>in this subject, containing more than 20000 references. I am afraid this
>is little too much for a brief description. But basically, instead of
>reclaiming garbage when "last reference" goes out, collectors typically
>run periodically trying to find unreachable objects. Common way to do so
>is to find -reachable- ones, and then to declare the rest
>unreachable. Also, do avoid scanning the whole heap^Wfile system,
>objects are segregated into "generations", and allocation is tuned so
>that there are no references from object older generation to younger
>one. Some smart techniques (like colored pointers) are used to avoid
>garbage collection to proceed concurrently with mutators. And so
>on. Large field for an experimentation.
>
> > 
> > -- 
> > Hans
> > 
>
>Nikita.
>
> > 
>  
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9E1+QisZLIF6uqOAQJ4VQ/+MZizcUlDJ2Zbb7zteUP8upK3f9a2Z/qY
hEtWrTAqP2/zpLf68GR0OkfPnwe7g3h9NYvCWSJ5j3tt3lr7TS/PcPoMWn8cv+7j
wQoJRwI6rVb7FkCuOu/s8qSMG47dww/3Ao1jc2eFngT16ghIgDPEBBL0DwwqSbsG
NrNevs1yDqO+qRlsoHbe6oqz+55BEtwc/APnBKHzXj8dDNevv5PEx7WwH12A+tRe
etMxXygc7OTqk7miH00OTH5+afnJEgF0JiWwMDUsDiYTT54Cl4a9E+nUzm0kp5SI
R0VYHgNkxTQ692SPE2Zdl+xSVaPq9N9byfDZdTO4jfSp9zx3PA6HfG+Lc30o0IAZ
VGKfV3+wV0jnIE/Ek3pFDv1Xn1gAtM3htfIvFZSvysEC4Km0UkvIOgsQyZByh3fq
Dzop9pjmM/CMLfu/Z+4APQ4j8Mt3nCSvEPnTgrp8D7ptpkq/1nhCzS1Ej42+XQZ+
h/7pyE15wrC8EyVUgVQMDZa1n6R1k+w/VvsNhMqfuTaTfXJBWaiq0Chj6QMfX6nx
kBRjzudFkh5Sg2Kf7vwwv+aH/wd0F953BnFq6Ceg2FAV6Mt308aHI9JnBSP08uIz
my/p1fLxhwyEZ1MzBJC97rQivRa2WUXrDwnC6duHbTg8A913tiW5lXIvEIooarOR
IFSQ2vdEzio=
=X4Fs
-----END PGP SIGNATURE-----

