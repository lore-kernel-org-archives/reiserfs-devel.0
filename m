From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sun, 8 Aug 2004 20:55:08 -0500
Message-ID: <20040809015911.9D6B815D42@mail03.powweb.com>
References: <4116BEED.8050804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4116BEED.8050804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>, 'Nikita Danilov' <Nikita@namesys.com>, 'Alexander Zarochentcev' <zam@namesys.com>, "'E. Gryaznova'" <grev@namesys.com>



> >
> >>Hans:
> >>yes, it [hashing] is only a good idea for filenames larger than 15
> >>characters.
> >>
> >>
> >>
> >
> >Actually, larger than 7 + 8 + 8 characters, if LARGE_KEY is used.
> >
> Oh.  Ok.  LARGE_KEY is the only thing that should be used.
> 
> >
> >>it is extremely unrealistic to create the files in one phase and write
> >>to them in the next phase.  the filesystem will behave completely
> >>differently.
> >>
> >
> >Of course. The extra files I added are created once, and should never be
> >touched again since mongo only operates on the objects it creates. I am
> >simply loading the test filesystem with a reasonable facsimile of a
> 'normal' Linux file set (with the exception that the files are all zero
> length).
> >
> a huge exception.  I don't grok what you are trying to do here.
> 

Mongo starts with a clean slate filesystem. I was attempting to run the
tests on top of something other than a clean filesystem, because that is an
exceptional situation. Based on your reaction, it is obviously not
detrimental to measuring relative performance measures. I didn't really care
about the performance of the MKFILES & MKDIRS phases themselves - that was
irrelevant. I simply wanted to run the tests on a filesystem that looked as
much as possible as what one might start with under 'normal' conditions. The
only reason the files were zero length - and not a copy of real files - was
that at the time I had limited disk space with which to test. 

But enough of extensions and experiments. I am in no way trying to press a
case for my MKDIRS/FILES experiments. I do, however, believe mongo should be
run with file names longer than six characters and that have extensions.
This is not representative of Linux file system usage, nor does it exercise
reiser features designed to improve performance, e.g. fibration. In
addition, as you point out, it should probably not benchmark mounting and
unmounting the filesystem -- unless there was good reason to have done so.

The real issue, for me at least, is finding a method of determining whether
the errors I saw were due to hardware or software; if it is the latter,
whether it can be traced to mongo, the filesystem or Linux.

David


