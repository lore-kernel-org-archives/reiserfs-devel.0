From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 14:43:28 -0800
Message-ID: <f18a8d980601121443j30d3ada7r987c0babb5db3c3a@mail.gmail.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu>
	 <43C5D694.9050402@namesys.com> <43C5FAE0.5090602@namesys.com>
	 <1137083591.14934.5.camel@localhost>
	 <f18a8d980601121033x12e0b148g65ecc78f306b4446@mail.gmail.com>
	 <43C6CEB4.8000209@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_70382_25850190.1137105808461"
Return-path: <reiserfs-list-return-27689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C6CEB4.8000209@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Hans Reiser <reiser@namesys.com>, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

------=_Part_70382_25850190.1137105808461
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

David,

I appreciate your criticism, but we're not in a flame war. I never claimed
to be an FS expert. Take it easy; you don't have to beat my suggestion to
death. There's no perfect solution, and all feedbacks, no matter how idioti=
c
or simple may seem, help making a better final solution.

my suggestions were burst of the moment, I didn't give 'em much thoughts;
however, all the problems you found could be fixed. Again, I'm not the FS
expert here.

-B

On 1/12/06, David Masover <ninja@slaphack.com> wrote:
>
> Bedros Hanounik wrote:
> > I think versioning plugin is a great idea and I bet there're many peopl=
e
> > like me waiting for such a plugin. However, I have few questions;
> >
> > what happens when I delete a file? should I loose all history of the
> > file with such action?
>
> Depends.  Delete has always been a modification of the directory, not
> the file.  So, if you were versioning an entire directory tree
> (recursively, of course), then deleting a single file within that tree
> would be a modification to its parent directory.  Until the
> changelog/history/old versions of the parent directory all disappear,
> there will be a link to the file, meaning the file still behaves exactly
> as it always did, it's just that instead of only being linked to in
>
> foo/bar
>
> it's now in
>
> foo/.../version/1234/bar
>
> [...]
>
> > if you store all the history in  a sub direcotry let's say .rev and mak=
e
> > it generic (and hence visible) to everyone, the above problems will go
> > away.
>
> Only now you have some new problems:
>
> What if someone wants to make a .rev for something else?  '...' was
> carefully selected, and is still debated.  Now you're suggesting each
> plugin be able to have its own file/directory in every normal directory?
>
> NO.  Will not work.
>
> What might work is creating a '.metadata-archive' directory, which has
> hardlinks to everything tar is allowed to backup from '...' -- that way,
> we only need to come up with one more unique name than we already have.
>
> Technically, not even that -- we could hide a directory with any name we
> like inside '...', and let tar archive '...', but not, say, '.../notar',
> but that's a hassle for users.  Anyone have a better name for
> '.metadata-archive', though?
>
> You also have another problem:  You've just broken 'rm -r' and 'mv'
> across partitions/devices.  Consider:  Am I allowed to remove
> '.metadata-archive'?  If yes, then what happens when I look for it
> again?  Is it magically still there?  And if no, how am I supposed to
> ever be able to rmdir a directory that's technically not empty?  Should
> that just magically work?
>
> I suspect that we'd be fine if we just say that removing it should
> pretend to work (return an OK status), and rmdir should actually work,
> but it should always show up in the directory listing, because I can't
> think of why a program would step through the directory listing,
> unlinking each file, and then get another directory listing, to make
> sure they're all gone, before it tried 'rmdir'-ing the directory.  It
> makes no sense -- you try to 'rmdir', and you complain to the user if
> "directory not empty" because someone stuck a new file in the dir while
> you were trying to delete it.
>
> > for example filename.ext deltas could be stored in  .rev/filename-
> > rev-date-time.delta with base rev in .rev/filename-rev-date-time.ext
>
> I don't like your semantics.  I just don't.
>
> It makes sense to use file extensions for fibration, because you can
> guess that '.o' files are similar to each other.  Same with '.c' files.
>   But fibration is completely transparent, and just affects performance,
> so it's ok to guess there.
>
> When it comes to actually affecting semantics, file extensions have
> always been irrelevant except to programs that care, and those programs
> only care about their own extensions.
>
> For instance, say I have
>
> foo.tar.bz2
>
> Obviously, this way looks bad:
>
> foo.tar-rev-date-time.delta
> foo.tar-rev-date-time.bz2
>
> So do we do it this way?
>
> foo-rev-date-time.delta
> foo-rev-date-time.tar.bz2
>
> No, because then what if you have this?
>
> foo.01.12.2006.tar.bz2
>
> Obviously, this is wrong:
>
> foo-rev-date-time.delta
> foo-rev-date-time.01.12.2006.tar.bz2
>
> And this is just as wrong as it was before:
>
> foo.01.12.2006.tar-rev-date-time.delta
> foo.01.12.2006.tar-rev-date-time.bz2
>
> And for that matter, what if I have these?
>
> foo.tbz2
> foo.zip
>
> Both become foo.delta.
>
> And just a minor thing, but you're also making the limit on filenames
> just that much more restrictive.
>
> Instead, I suggest we do it this way:
> foo/.../version/<rev>
>
> with symlinks to some handy versions of
> foo/.../version/<date>
> foo/.../version/<time>
>
> This should also work if foo is a directory.  So to actually publish a
> given revision, you do
>
> tar -cjSf foo-1234.tar.bz2 foo/.../1234
>
> Now, what about forking?  If we had good copy-on-write support, we could
> just do something like
>
> cp --cow foo/.../1234 foo-fork
>
> Obviously, this would use the same underlying mechanism of copy-on-write
> that is used for the versioning system, so there's no need for the
> system itself to know about forks.
>
> What about merges?  I don't know, but my knowledge of existing
> versioning systems is pretty limited...
>

------=_Part_70382_25850190.1137105808461
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

David,<br><br>I appreciate your criticism, but we're not in a flame war. I =
never claimed to be an FS expert. Take it easy; you don't have to beat my s=
uggestion to death. There's no perfect solution, and all feedbacks, no matt=
er how idiotic or simple may seem, help making a better final solution.
<br><br>my suggestions were burst of the moment, I didn't give 'em much tho=
ughts; however, all the problems you found could be fixed. Again, I'm not t=
he FS expert here.<br><br>-B<br><br><div><span class=3D"gmail_quote">On 1/1=
2/06,=20
<b class=3D"gmail_sendername">David Masover</b> &lt;<a href=3D"mailto:ninja=
@slaphack.com">ninja@slaphack.com</a>&gt; wrote:</span><blockquote class=3D=
"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0=
pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Bedros Hanounik wrote:<br>&gt; I think versioning plugin is a great idea an=
d I bet there're many people<br>&gt; like me waiting for such a plugin. How=
ever, I have few questions;<br>&gt;<br>&gt; what happens when I delete a fi=
le? should I loose all history of the
<br>&gt; file with such action?<br><br>Depends.&nbsp;&nbsp;Delete has alway=
s been a modification of the directory, not<br>the file.&nbsp;&nbsp;So, if =
you were versioning an entire directory tree<br>(recursively, of course), t=
hen deleting a single file within that tree
<br>would be a modification to its parent directory.&nbsp;&nbsp;Until the<b=
r>changelog/history/old versions of the parent directory all disappear,<br>=
there will be a link to the file, meaning the file still behaves exactly<br=
>as it always did, it's just that instead of only being linked to in
<br><br>foo/bar<br><br>it's now in<br><br>foo/.../version/1234/bar<br><br>[=
...]<br><br>&gt; if you store all the history in&nbsp;&nbsp;a sub direcotry=
 let's say .rev and make<br>&gt; it generic (and hence visible) to everyone=
, the above problems will go
<br>&gt; away.<br><br>Only now you have some new problems:<br><br>What if s=
omeone wants to make a .rev for something else?&nbsp;&nbsp;'...' was<br>car=
efully selected, and is still debated.&nbsp;&nbsp;Now you're suggesting eac=
h<br>plugin be able to have its own file/directory in every normal director=
y?
<br><br>NO.&nbsp;&nbsp;Will not work.<br><br>What might work is creating a =
'.metadata-archive' directory, which has<br>hardlinks to everything tar is =
allowed to backup from '...' -- that way,<br>we only need to come up with o=
ne more unique name than we already have.
<br><br>Technically, not even that -- we could hide a directory with any na=
me we<br>like inside '...', and let tar archive '...', but not, say, '.../n=
otar',<br>but that's a hassle for users.&nbsp;&nbsp;Anyone have a better na=
me for
<br>'.metadata-archive', though?<br><br>You also have another problem:&nbsp=
;&nbsp;You've just broken 'rm -r' and 'mv'<br>across partitions/devices.&nb=
sp;&nbsp;Consider:&nbsp;&nbsp;Am I allowed to remove<br>'.metadata-archive'=
?&nbsp;&nbsp;If yes, then what happens when I look for it
<br>again?&nbsp;&nbsp;Is it magically still there?&nbsp;&nbsp;And if no, ho=
w am I supposed to<br>ever be able to rmdir a directory that's technically =
not empty?&nbsp;&nbsp;Should<br>that just magically work?<br><br>I suspect =
that we'd be fine if we just say that removing it should
<br>pretend to work (return an OK status), and rmdir should actually work,<=
br>but it should always show up in the directory listing, because I can't<b=
r>think of why a program would step through the directory listing,<br>unlin=
king each file, and then get another directory listing, to make
<br>sure they're all gone, before it tried 'rmdir'-ing the directory.&nbsp;=
&nbsp;It<br>makes no sense -- you try to 'rmdir', and you complain to the u=
ser if<br>&quot;directory not empty&quot; because someone stuck a new file =
in the dir while
<br>you were trying to delete it.<br><br>&gt; for example filename.ext delt=
as could be stored in&nbsp;&nbsp;.rev/filename-<br>&gt; rev-date-time.delta=
 with base rev in .rev/filename-rev-date-time.ext<br><br>I don't like your =
semantics.&nbsp;&nbsp;I just don't.
<br><br>It makes sense to use file extensions for fibration, because you ca=
n<br>guess that '.o' files are similar to each other.&nbsp;&nbsp;Same with =
'.c' files.<br>&nbsp;&nbsp;But fibration is completely transparent, and jus=
t affects performance,
<br>so it's ok to guess there.<br><br>When it comes to actually affecting s=
emantics, file extensions have<br>always been irrelevant except to programs=
 that care, and those programs<br>only care about their own extensions.
<br><br>For instance, say I have<br><br>foo.tar.bz2<br><br>Obviously, this =
way looks bad:<br><br>foo.tar-rev-date-time.delta<br>foo.tar-rev-date-time.=
bz2<br><br>So do we do it this way?<br><br>foo-rev-date-time.delta<br>foo-r=
ev-date-time.tar.bz2
<br><br>No, because then what if you have this?<br><br>foo.01.12.2006.tar.b=
z2<br><br>Obviously, this is wrong:<br><br>foo-rev-date-time.delta<br>foo-r=
ev-date-time.01.12.2006.tar.bz2<br><br>And this is just as wrong as it was =
before:
<br><br>foo.01.12.2006.tar-rev-date-time.delta<br>foo.01.12.2006.tar-rev-da=
te-time.bz2<br><br>And for that matter, what if I have these?<br><br>foo.tb=
z2<br>foo.zip<br><br>Both become foo.delta.<br><br>And just a minor thing, =
but you're also making the limit on filenames
<br>just that much more restrictive.<br><br>Instead, I suggest we do it thi=
s way:<br>foo/.../version/&lt;rev&gt;<br><br>with symlinks to some handy ve=
rsions of<br>foo/.../version/&lt;date&gt;<br>foo/.../version/&lt;time&gt;
<br><br>This should also work if foo is a directory.&nbsp;&nbsp;So to actua=
lly publish a<br>given revision, you do<br><br>tar -cjSf foo-1234.tar.bz2 f=
oo/.../1234<br><br>Now, what about forking?&nbsp;&nbsp;If we had good copy-=
on-write support, we could
<br>just do something like<br><br>cp --cow foo/.../1234 foo-fork<br><br>Obv=
iously, this would use the same underlying mechanism of copy-on-write<br>th=
at is used for the versioning system, so there's no need for the<br>system =
itself to know about forks.
<br><br>What about merges?&nbsp;&nbsp;I don't know, but my knowledge of exi=
sting<br>versioning systems is pretty limited...<br></blockquote></div><br>

------=_Part_70382_25850190.1137105808461--
