From: Ryan Nordman <spacerobots@gmail.com>
Subject: Re: reiser4: writing plugins
Date: Sun, 18 Dec 2005 21:32:04 -0800
Message-ID: <27c2ef000512182132y4a82637cv64805fcb1a21ceda@mail.gmail.com>
References: <1134763128.18089.10.camel@localhost.localdomain>
	 <200512171032.34752.pvh@uvic.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11334_18923250.1134970324549"
Return-path: <reiserfs-list-return-27431-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200512171032.34752.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: danny.milo@gmx.net

------=_Part_11334_18923250.1134970324549
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Danny,

It's true that you'll need to recompile the kernel, and you could be at ris=
k
for messing up your system.  Peter and I were lucky enough to get our hands
on an extra PC for our project here, but the system survived for the
duration without any damage.  We're about to release some documentation
about developing plugins that you may find useful.

Initially we looked into using virtual machines, but we found that to be
more trouble than it was worth.  If you can get your kernel recompiled with
Reiser4 enabled, you're well on your way.  All you need to do is create a
file on your disk and then you can format it with reiser4progs and mount it
as a virtual disk.

To do what you're proposing, you're going to have a few problems.  First of
all, pseudo files are only in memory, without any on disk storage.  So to
store your "du" value you're going to need to create some space someplace.
I'm guessing you'd put your storage in the inode.  Once you have that
storage somewhere, you'd need to do the following.
-Write your own printing function to output the value in
../reiser4/plugins/pseudo/pseudo.c
-Make a copy of one of the items in the pseudo_plugins array that is locate=
d
in ../reiser4/plugins/pseudo/pseudo.c
-Rename it and modify its .single_show member to point to your custom
function.
-Implement your scheme for updating the value... probably start by looking
at inode_ops.c:invoke_create_method() or dir.c:create_child_common()

I don't know how useful it'd be, I think it'd be great for getting you
familiar with the code base.  It'd add a bit of overhead that's not really
that necessary, don't you think?  Unless somebody really needs to know disk
usage *really* often.  What's the case for doing this in kernel space
instead of just using the du utility?

Feel free to ask us further questions, we look forward to seeing how you do=
.

-Ryan Nordman
Victoria, BC, Canada

On 12/17/05, Peter van Hardenberg <pvh@uvic.ca > wrote:
>
> Danny,
>
> It's good to hear from you. The Reiser4 plugin system is somewhat subtle.
> Over
> the past four months our group has attempted to become the first group
> outside Namesys to create a Reiser4 plugin. We have had some various
> successes and failures and are hoping to document much of the experience
> for
> general consumption.
>
> -pvh
>
> On December 16, 2005 11:58 am, dannym wrote:
> > Hi,
> >
> > So I want to start writing a small plugin to get a feel for the
> > architecture...
> >
> > I wonder how to do that?
> >
> > I read that in order to write plugins, one has to recompile the
> > kernel... which is ok, but that also means that it will affect
> > everything and when I make a mistake, everything goes bad :)
> >
> > So I wondered if all you reiser4 developers have some kind of sandbox
> > thing that just does the same with a library (without the kernel) and o=
n
> > an image file?
> >
> > Or do you use a virtual machine for that kind of stuff?
> >
> > As for what I thought would be a nice intro thing for me to write is:
> >
> > Adds a pseudo file "tree-contents-size" for directories.
> > Pseudo file contains the "du" starting from this directory.
> >
> > What it should do is cache some kind of "du"-like value per directory.
> > When you change a file size (or delete a file, add a file, ...) in the
> > dir or one of it's subdirs, it shall set a dirty flag on the value.
> > When the pseudo file is accessed, it shall calculate it anew, also
> > updating the subdirs' pseudo files if so needed, and store it actually
> > on disk...
> > (could also be updated periodically without anyone requesting it, but
> > that's just a detail)
> >
> > What do you think? Useful? Bad Thing? Already done? Too hard for a firs=
t
> > try?
> >
> > cheers,
> >   Danny
>
> --
> Peter van Hardenberg ( pvh@pvh.ca)
> Victoria, BC, Canada
>

------=_Part_11334_18923250.1134970324549
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Danny,<br>
<br>
It's true that you'll need to recompile the kernel, and you could be at
risk for messing up your system.&nbsp; Peter and I were lucky enough to get=
 our
hands on an extra PC for our project here, but the system survived for
the duration without any damage.&nbsp; We're about to release some document=
ation about developing plugins that you may find useful.<br>
<br>
Initially we looked into using virtual machines, but we found that to
be more trouble than it was worth.&nbsp; If you can get your kernel
recompiled with Reiser4 enabled, you're well on your way.&nbsp; All you
need to do is create a file on your disk and then you can format it
with reiser4progs and mount it as a virtual disk.<br>
<br>To do what you're proposing, you're going to have a few problems.&nbsp;
First of all, pseudo files are only in memory, without any on disk
storage.&nbsp; So to store your &quot;du&quot; value you're going to need t=
o create
some space someplace.&nbsp; I'm guessing you'd put your storage in the inod=
e.&nbsp; Once you have that storage somewhere, you'd need to do the followi=
ng.<br>-Write your own printing function to output the value in ../reiser4/=
plugins/pseudo/pseudo.c
<br>-Make a copy of one of the items in the pseudo_plugins array that is lo=
cated in ../reiser4/plugins/pseudo/pseudo.c<br>-Rename it and modify its .s=
ingle_show member to point to your custom function.<br>-Implement your sche=
me for updating the value... probably start by looking at inode_ops.c:invok=
e_create_method() or=20
dir.c:create_child_common()<br><br>I don't know how useful it'd be, I think=
 it'd be great for getting you familiar with the code base.&nbsp; It'd add =
a bit of overhead that's not really that necessary, don't you think?&nbsp; =
Unless somebody really needs to know disk usage *really* often.&nbsp; What'=
s the case for doing this in kernel space instead of just using the du util=
ity?
<br><br>Feel free to ask us further questions, we look forward to seeing ho=
w you do.<br><br>-Ryan Nordman<br>Victoria, BC, Canada<br><br><div><span cl=
ass=3D"gmail_quote">On 12/17/05, <b class=3D"gmail_sendername">Peter van Ha=
rdenberg
</b> &lt;<a href=3D"mailto:pvh@uvic.ca" target=3D"_blank" onclick=3D"return=
 top.js.OpenExtLink(window,event,this)">pvh@uvic.ca</a>
&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-left: 1=
px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"=
>
Danny,<br><br>It's good to hear from you. The Reiser4 plugin system is some=
what subtle. Over<br>the past four months our group has attempted to become=
 the first group<br>outside Namesys to create a Reiser4 plugin. We have had=
 some various
<br>successes and failures and are hoping to document much of the experienc=
e for<br>general consumption.<br><br>-pvh<br><br>On December 16, 2005 11:58=
 am, dannym wrote:<br>&gt; Hi,<br>&gt;<br>&gt; So I want to start writing a=
 small plugin to get a feel for the
<br>&gt; architecture...<br>&gt;<br>&gt; I wonder how to do that?<br>&gt;<b=
r>&gt; I read that in order to write plugins, one has to recompile the<br>&=
gt; kernel... which is ok, but that also means that it will affect<br>

&gt; everything and when I make a mistake, everything goes bad :)
<br>&gt;<br>&gt; So I wondered if all you reiser4 developers have some kind=
 of sandbox<br>&gt; thing that just does the same with a library (without t=
he kernel) and on<br>&gt; an image file?<br>&gt;<br>&gt; Or do you use a vi=
rtual machine for that kind of stuff?
<br>&gt;<br>&gt; As for what I thought would be a nice intro thing for me t=
o write is:<br>&gt;<br>&gt; Adds a pseudo file &quot;tree-contents-size&quo=
t; for directories.<br>&gt; Pseudo file contains the &quot;du&quot; startin=
g from this directory.
<br>&gt;<br>&gt; What it should do is cache some kind of &quot;du&quot;-lik=
e value per directory.<br>&gt; When you change a file size (or delete a fil=
e, add a file, ...) in the<br>&gt; dir or one of it's subdirs, it shall set=
 a dirty flag on the value.
<br>&gt; When the pseudo file is accessed, it shall calculate it anew, also=
<br>&gt; updating the subdirs' pseudo files if so needed, and store it actu=
ally<br>&gt; on disk...<br>&gt; (could also be updated periodically without=
 anyone requesting it, but
<br>&gt; that's just a detail)<br>&gt;<br>&gt; What do you think? Useful? B=
ad Thing? Already done? Too hard for a first<br>&gt; try?<br>&gt;<br>&gt; c=
heers,<br>&gt;&nbsp;&nbsp; Danny<br><br>--<br>Peter van Hardenberg (<a href=
=3D"mailto:pvh@pvh.ca" target=3D"_blank" onclick=3D"return top.js.OpenExtLi=
nk(window,event,this)">


pvh@pvh.ca</a>)<br>Victoria, BC, Canada<br></blockquote></div><br>



------=_Part_11334_18923250.1134970324549--
