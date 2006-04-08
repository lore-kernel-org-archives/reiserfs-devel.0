From: "Dongxu Ma" <dongxu.ma@gmail.com>
Subject: Re: script binding for reiserfs?
Date: Sat, 8 Apr 2006 12:16:41 +0800
Message-ID: <9bc0d5d20604072116j250b3d84m9f77c750d1f1d460@mail.gmail.com>
References: <9bc0d5d20604060123v18c5518cmb072472ec56d8fe0@mail.gmail.com>
	 <3395df770604071759y26ca8903s3c77efee45ba33ec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_25117_19870597.1144469801023"
Return-path: <reiserfs-list-return-28459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3395df770604071759y26ca8903s3c77efee45ba33ec@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter van Hardenberg <pvh@pvh.ca>
Cc: reiserfs-list@namesys.com

------=_Part_25117_19870597.1144469801023
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 4/8/06, Peter van Hardenberg <pvh@pvh.ca> wrote:
>
> Dongxu,
>
> Reaching into the filesystem itself for a project like this is not a very
> good idea. A wiki is a set of files -- let the filesystem do the hard wor=
k
> for you and use the standard API that is already in existence -- the VFS.
> You'll get all the benefits of the Reiser filesystem without having to br=
eak
> compatibility with other systems.
>

my own thought is that one can operate the filesystem, or at least query it
via programming interface, you know, introduce shell is really a bad idea.
There are already some examples on CPAN such as Filesys::Ext2.


I think a DBI/DBD interface to a Reiser-friendly file format is a really
> neat idea. You could create table rows as individual files within a
> directory and do foreign keys with links! I wonder what on-disk form woul=
d
> leverage Reiser4's dancing trees and intelligent allocation the most
> efficiently?
>

Yeah, I can store  each  field  into a file, and creat view and table
structure from directory and links. With the help of reiserfs, I assume thi=
s
could be possible to try.

I must say though, there is no binding to the Reiser4 API, and the Namesys
> team is very busy right now working towards getting R4 included in the
> mainline kernel. Hopefully once they have achieved this, the more excitin=
g
> development can continue.
>

2.6.16 is a big step;-P

As for your second question, my experience is strictly with R4, so someone
> else will have to comment on that issue.
>

Anyway, great help for me, thanks.

All the best,
> Peter van Hardenberg
>
>
> On 4/6/06, Dongxu Ma <dongxu.ma@gmail.com> wrote:
> >
> > Hi all,
> >
> > As reiserfs more and more popular, is there any binding package for use
> > in script languages? I did a search on Google and nothing found.
> > Curently I am thinking about writing a binding for Perl, which can
> > offer:
> > 1) script-level operation against reiserfs
> > 2) DBI && DBD for reiserfs binding to treat the fs as a database. My ai=
m
> > is constructing a mid-and-small wiki directly on reiserfs without emplo=
ying
> > any real database
> >
> > However, after some seeking on source. I got several issues:
> > 1) is there any so-called official userspace api exported?
> > On gentoo there is a package named progsreiserfs introducing an api set
> > under /usr/include/reiserfs, but I am not very sure if it is stable and=
 the
> > project is still alive.
> >
> > 2) regarding reiser3, where could I start to port? since exporting
> > something in kernelspace is quite risky.
> >
> > Any advice and hint?
> >
> > --
> > Cheers, Dongxu
> > __END__
> > dongxu.wordpress.com
> > search.cpan.org/~dongxu <http://search.cpan.org/%7Edongxu>
> >
>
>
>
> --
> Peter van Hardenberg
> Victoria, BC, Canada
> "The wise man proportions his belief to the evidence." -- David Hume
>



--
Cheers, Dongxu
__END__
dongxu.wordpress.com
search.cpan.org/~dongxu

------=_Part_25117_19870597.1144469801023
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div><span class=3D"gmail_quote">On 4/8/06, <b class=3D"gmail_sende=
rname">Peter van Hardenberg</b> &lt;<a href=3D"mailto:pvh@pvh.ca">pvh@pvh.c=
a</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-le=
ft: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: =
1ex;">
<div style=3D"direction: ltr;">Dongxu,<br><br>Reaching into the filesystem =
itself for a project like this is not a very good idea. A wiki is a set of =
files -- let the filesystem do the hard work for you and use the standard A=
PI that is already in existence -- the VFS. You'll get all the benefits of =
the Reiser filesystem without having to break compatibility with other syst=
ems.
</div></blockquote><div><br>my own thought is that one can operate the file=
system, or at least query it via programming interface, you know, introduce=
 shell is really a bad idea. There are already some examples on CPAN such a=
s Filesys::Ext2.
<br>&nbsp;</div><br><blockquote class=3D"gmail_quote" style=3D"border-left:=
 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex=
;"><div style=3D"direction: ltr;">I think a DBI/DBD interface to a Reiser-f=
riendly file format is a really neat idea. You could create table rows as i=
ndividual files within a directory and do foreign keys with links! I wonder=
 what on-disk form would leverage Reiser4's dancing trees and intelligent a=
llocation the most efficiently?
</div></blockquote><div><br>Yeah, I can store&nbsp; each&nbsp; field&nbsp; =
into a file, and creat view and table structure from directory and links. W=
ith the help of reiserfs, I assume this could be possible to try.<br></div>=
<br><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(2=
04, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div style=3D"direction: ltr;">I must say though, there is no binding to th=
e Reiser4 API, and the Namesys team is very busy right now working towards =
getting R4 included in the mainline kernel. Hopefully once they have achiev=
ed this, the more exciting development can continue.=20
</div></blockquote><div><br>2.6.16 is a big step;-P<br></div><br><blockquot=
e class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204);=
 margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div style=3D"direction: lt=
r;">
As for your second question, my experience is strictly with R4, so someone =
else will have to comment on that issue.</div></blockquote><div><br>Anyway,=
 great help for me, thanks.<br></div><br><blockquote class=3D"gmail_quote" =
style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8=
ex; padding-left: 1ex;">
<div style=3D"direction: ltr;">All the best,<br>Peter van Hardenberg</div><=
div style=3D"direction: ltr;"><span class=3D"e" id=3D"q_10a77029e585315d_1"=
><br><br><div><span class=3D"gmail_quote">On 4/6/06, <b class=3D"gmail_send=
ername">

Dongxu Ma</b> &lt;<a href=3D"mailto:dongxu.ma@gmail.com" target=3D"_blank" =
onclick=3D"return top.js.OpenExtLink(window,event,this)">dongxu.ma@gmail.co=
m</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-le=
ft: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: =
1ex;">

<div style=3D"direction: ltr;">Hi all,<br><br>As reiserfs more and more pop=
ular, is there any binding package for use in script languages? I did a sea=
rch on Google and nothing found.<br>Curently I am thinking about writing a =
binding for Perl, which can offer:
<br>1) script-level operation against reiserfs<br>2) DBI &amp;&amp; DBD for=
 reiserfs binding to treat the fs as a database. My aim is constructing a m=
id-and-small wiki directly on reiserfs without employing any real database
<br><br>However, after some seeking on source. I got several issues:<br>1) =
is there any so-called official userspace api exported? <br>On gentoo there=
 is a package named progsreiserfs introducing an api set under /usr/include=
/reiserfs, but I am not very sure if it is stable and the project is still =
alive.
<br><br>2) regarding reiser3, where could I start to port? since exporting =
something in kernelspace is quite risky. <br><br>Any advice and hint?<br cl=
ear=3D"all"></div><div style=3D"direction: ltr;"><span><br>-- <br>
Cheers, Dongxu<br>__END__<br><a href=3D"http://dongxu.wordpress.com" target=
=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,this)">
dongxu.wordpress.com</a><br><a href=3D"http://search.cpan.org/%7Edongxu" ta=
rget=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,this)">se=
arch.cpan.org/~dongxu</a>

</span></div></blockquote></div><br><br clear=3D"all"><br></span></div><div=
 style=3D"direction: ltr;"><span class=3D"sg">-- <br>Peter van Hardenberg<b=
r>Victoria, BC, Canada<br>&quot;The wise man proportions his belief to the =
evidence.&quot; -- David Hume

</span></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Cheers, Do=
ngxu<br>__END__<br><a href=3D"http://dongxu.wordpress.com">dongxu.wordpress=
.com</a><br><a href=3D"http://search.cpan.org/~dongxu">search.cpan.org/~don=
gxu
</a>

------=_Part_25117_19870597.1144469801023--
