From: "Humberto Massa" <humberto.massa@almg.gov.br>
Subject: Re: reiser4 non-free?
Date: Sat, 08 May 2004 11:13:53 -0300
Message-ID: <1084025633.28080.196082736@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rms@gnu.org
Cc: debian-legal@lists.debian.org, Valdis.Kletnieks@vt.edu, humberto.massa@almg.gov.br, reiser@namesys.com, reiserfs-list@namesys.com

Mr. Stallman:

First of all, I would like to state that I have nothing but deep respect
and admiration for your ideals, and all your work. Thank you for
everything.

That said, I humbly disagree with your e-mail:

RMS wrote:
>> It's the same case as Windows NDIS drivers loading on linux. They
>> were created in a different environment, and would exist as they are
>> even if linux did not exist. Provided GPL'd glue code, you can load
>> them in the linux kernel, and they are _not_ derivative works.
>
>The idea that "glue code" makes it ok to combine GPL-covered code with
>non-free code has no basis in the GPL. The GPL applies to the entire
>combination of code that is combined into a larger program. If a.o is
>under the GPL and talks to b.o which talks to c.o, the GPL covers all
>three files, if all three are combined as one program.
>
>Linus has implicitly and sometimes explicitly given permission for some
>kinds of non-free dynamically loaded modules; perhaps the concept of
>"glue code" is relevant in terms of the permission he has given.  I'm
>not the one to ask about that kind of issue.

No, this idea has basis in copyright law. I specifically mentioned
Brazilian copyright laws in my e-mails, because that's what I have some
knowledge of, but the Berne convention is also reasonably clear, if you
think about it.

Brazilian copyright (author's rights, in truth) law says: a derived work
is the result of the transformation of an original work, that is an
intellectual creation on its own standing (best translation I can do).
So, a good rule of thumb a Brazilian copyright lawyer would use to
eliminate the possibility of a work be derived for another is to ask
himself: would work D exist (in the same form it currently exists) if
work O did not exist? Ellaborating a little bit more than I did in my
previous e-mails, if the answer is _yes_, it would exist, in the same
form it exists currently, even if work O did not exist, then D _IS_
_NOT_ a derived work from O. If the answer is _no_, it would not exist
in the same current form, then you'll have to dig deeper.

In the case of a NDIS driver, the driver itself is without doubt NOT a
derived work on the linux kernel. It would exist as-is even if linux did
not exist; the glue code IS (also without doubt) a derived work on the
linux kernel. The question is: "is there any license/copyright
infringement?". The answer is: no, under no circumstances. When the glue
code writer wrote the glue code, he was making a permitted modification
on the linux kernel (of which he had a GPL license), and of course I
suppose he is abiding the other terms of the GPL for distribution of the
glue code (p.ex., distributing it under the terms of the GPL also). When
the user linked the glue code with the NDIS driver code, he was doing
something inherent to the *use* of the kernel, the glue code, and the
NDIS driver code, which we know is quite out of reach of copyright law.
In the worst case, he would be in violation of some EULA for the NDIS
driver code.

This is not a Linus/Linux exemption, is just the application of the law.
What Linus did was to dig into copyright law (USofAn copyright law - USC
17) and find out the following (excerpt from Linus' lkml post):

>There's a clarification that user-space programs that use the standard
>system call interfaces aren't considered derived works, but even that
>isn't an "exception" - it's just a statement of a border of what is
>clearly considered a "derived work". User programs are _clearly_ not
>derived works of the kernel, and as such whatever the kernel license is
>just doesn't matter.
>
>And in fact, when it comes to modules, the GPL issue is exactly the
>same.  The kernel _is_ GPL. No ifs, buts and maybe's about it. As a
>result, anything that is a derived work has to be GPL'd. It's that
>simple.
>
>Now, the "derived work" issue in copyright law is the only thing that
>leads to any gray areas. There are areas that are not gray at all: user
>space is clearly not a derived work, while kernel patches clearly _are_
>derived works.
>
>But one gray area in particular is something like a driver that was
>originally written for another operating system (ie clearly not a
>derived work of Linux in origin). At exactly what point does it become
>a derived work of the kernel (and thus fall under the GPL)?
>
>THAT is a gray area, and _that_ is the area where I personally believe
>that some modules may be considered to not be derived works simply
>because they weren't designed for Linux and don't depend on any special
>Linux behaviour.
>
>Basically:
> - anything that was written with Linux in mind (whether it then _also_
>   works on other operating systems or not) is clearly partially a
>   derived work.
> - anything that has knowledge of and plays with fundamental internal
>   Linux behaviour is clearly a derived work. If you need to muck
>   around with core code, you're derived, no question about it.
>
>Historically, there's been things like the original Andrew filesystem
>module: a standard filesystem that really wasn't written for Linux in
>the first place, and just implements a UNIX filesystem. Is that derived
>just because it got ported to Linux that had a reasonably similar VFS
>interface to what other UNIXes did? Personally, I didn't feel that I
>could make that judgment call. Maybe it was, maybe it wasn't, but it
>clearly is a gray area.
>
>Personally, I think that case wasn't a derived work, and I was willing
>to tell the AFS guys so.
>
>Does that mean that any kernel module is automatically not a derived
>work?  HELL NO! It has nothing to do with modules per se, except that
>non-modules clearly are derived works (if they are so central to the
>kenrel that you can't load them as a module, they are clearly derived
>works just by virtue of being very intimate - and because the GPL
>expressly mentions linking).
>
>So being a module is not a sign of not being a derived work. It's just
>one sign that _maybe_ it might have other arguments for why it isn't
>derived.
>
Now, Linus is NAL, nor am I, and absolutely TINLA, but, I think it's not
up to the GPL (or any other license) to decide what is a derived work; a
license can clarify, for instance, like the kernel clarification, what
the copyright holder _exempts_ from being a derived work. That is, a
license can _relax_ what copyright law would consider a derived work,
not _tighten_ it. The process of "relaxing" the definition goes more or
less like "yeah, I know X _could_ be considered a derived work on my
work, but I am promising I do not consider it to be, meaning basically I
will not sue over this". IIRC, this is where *estoppel* applies.

I hope I have contributed to this discussion,

Humberto Massa

-- 
http://www.fastmail.fm - Does exactly what it says on the tin
