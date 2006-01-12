From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 10:33:39 -0800
Message-ID: <f18a8d980601121033x12e0b148g65ecc78f306b4446@mail.gmail.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu>
	 <43C5D694.9050402@namesys.com> <43C5FAE0.5090602@namesys.com>
	 <1137083591.14934.5.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_67318_26582329.1137090819782"
Return-path: <reiserfs-list-return-27681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1137083591.14934.5.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

------=_Part_67318_26582329.1137090819782
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I think versioning plugin is a great idea and I bet there're many people
like me waiting for such a plugin. However, I have few questions;

what happens when I delete a file? should I loose all history of the file
with such action?

if there's an undelete plugin, what kind of hooks needed so undelete
recovers the full state of the file with history.

another concern is backup; if I backup the file or the entire directory (or
drive), is it transparent to the backup app, or something extra needed to b=
e
done to backup the history of the file?

if you store all the history in  a sub direcotry let's say .rev and make it
generic (and hence visible) to everyone, the above problems will go away.

for example filename.ext deltas could be stored in  .rev/filename-
rev-date-time.delta with base rev in .rev/filename-rev-date-time.ext


correct me if I'm missing something, because I don't know the plugin
mechanism of reiser4.

-B

On 1/12/06, Jonathan Briggs <jbriggs@esoft.com> wrote:
>
> On Wed, 2006-01-11 at 22:44 -0800, Hans Reiser wrote:
> > Hans Reiser wrote:
> > >  I am skeptical that having it occur with every
> > >write is desirable actually.
> > >
> > >
> > Consider the case where you type cat file1 >> file2.  This will produce
> > a version of file2 for every 4k that is in file1, because (well I didn'=
t
> > look at the bash source, but I would guess) it appends in 4k incrementa=
l
> > writes rather than one big write.  Versioning on file close makes more
> > sense
> [snip]
>
> Not that my opinion means anything. :-) But I agree with Hans that file
> close is the place to create the new version.  The plugin should track
> the writes (and mmap flushes) between file open and close, then on file
> close it can process everything into a reverse binary diff to save
> permanently.
> --
> Jonathan Briggs <jbriggs@esoft.com>
> eSoft, Inc.
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2 (GNU/Linux)
>
> iD8DBQBDxoTGG8fHaOLTWwgRAkE0AJ9qn75iDGZTgO+KpOEcVVqOuT8mgwCcDYyy
> BHWE+E4oBHkabjZZHNIoAqM=3D
> =3DVtbo
> -----END PGP SIGNATURE-----
>
>
>

------=_Part_67318_26582329.1137090819782
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I think versioning plugin is a great idea and I bet there're many people li=
ke me waiting for such a plugin. However, I have few questions;<br><br>what=
 happens when I delete a file? should I loose all history of the file with =
such action?=20
<br><br>if there's an undelete plugin, what kind of hooks needed so undelet=
e recovers the full state of the file with history.<br><br>another concern =
is backup; if I backup the file or the entire directory (or drive), is it t=
ransparent to the backup app, or something extra needed to be done to backu=
p the history of the file?
<br><br>if you store all the history in&nbsp; a sub direcotry let's say .re=
v and make it generic (and hence visible) to everyone, the above problems w=
ill go away. <br><br>for example filename.ext deltas could be stored in&nbs=
p; .rev/filename-
rev-date-time.delta with base rev in .rev/filename-rev-date-time.ext<br><br=
><br>correct me if I'm missing something, because I don't know the plugin m=
echanism of reiser4.<br><br>-B<br><br><div><span class=3D"gmail_quote">On 1=
/12/06,=20
<b class=3D"gmail_sendername">Jonathan Briggs</b> &lt;<a href=3D"mailto:jbr=
iggs@esoft.com">jbriggs@esoft.com</a>&gt; wrote:</span><blockquote class=3D=
"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0=
pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Wed, 2006-01-11 at 22:44 -0800, Hans Reiser wrote:<br>&gt; Hans Reiser w=
rote:<br>&gt; &gt;&nbsp;&nbsp;I am skeptical that having it occur with ever=
y<br>&gt; &gt;write is desirable actually.<br>&gt; &gt;<br>&gt; &gt;<br>&gt=
; Consider the case where you type cat file1 &gt;&gt; file2.&nbsp;&nbsp;Thi=
s will produce
<br>&gt; a version of file2 for every 4k that is in file1, because (well I =
didn't<br>&gt; look at the bash source, but I would guess) it appends in 4k=
 incremental<br>&gt; writes rather than one big write.&nbsp;&nbsp;Versionin=
g on file close makes more
<br>&gt; sense<br>[snip]<br><br>Not that my opinion means anything. :-) But=
 I agree with Hans that file<br>close is the place to create the new versio=
n.&nbsp;&nbsp;The plugin should track<br>the writes (and mmap flushes) betw=
een file open and close, then on file
<br>close it can process everything into a reverse binary diff to save<br>p=
ermanently.<br>--<br>Jonathan Briggs &lt;<a href=3D"mailto:jbriggs@esoft.co=
m">jbriggs@esoft.com</a>&gt;<br>eSoft, Inc.<br><br><br>-----BEGIN PGP SIGNA=
TURE-----
<br>Version: GnuPG v1.4.2 (GNU/Linux)<br><br>iD8DBQBDxoTGG8fHaOLTWwgRAkE0AJ=
9qn75iDGZTgO+KpOEcVVqOuT8mgwCcDYyy<br>BHWE+E4oBHkabjZZHNIoAqM=3D<br>=3DVtbo=
<br>-----END PGP SIGNATURE-----<br><br><br></blockquote></div><br>

------=_Part_67318_26582329.1137090819782--
