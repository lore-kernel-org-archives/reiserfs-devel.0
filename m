From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: reiserfs using too much space on my HD
Date: Fri, 28 Oct 2005 10:19:27 -0700
Message-ID: <f18a8d980510281019s4156fd08nac134d1e445152c3@mail.gmail.com>
References: <f18a8d980510261002w303b4180le69b63667cee31ce@mail.gmail.com>
	 <4360A5A4.6030809@namesys.com>
	 <f18a8d980510270949r2b74fa62jd7dccd2cc5e83fba@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_4268_25162967.1130519967642"
Return-path: <reiserfs-list-return-26694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d980510270949r2b74fa62jd7dccd2cc5e83fba@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

------=_Part_4268_25162967.1130519967642
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Vlad,

fsck.reiserfs version is 3.6.19; when I run it, it reports no corruption
errors found at the end; or something like that.

I'll tar the whole partition to an external drive, then format it and untar
it again.

Anyone knows if "tar cvjpf file /" is suffecient to keep all permisions etc=
.
(including for system directories such as /proc /dev) and restoring exactly
as it was before format?

Thanks,

-B



On 10/27/05, Bedros Hanounik <2bedros@gmail.com> wrote:
>
>
> "du -shx" reports 9.5GB
>
> I'm running latest from gentoo, so I assume it's 3.6.19.
>
> I ran fsck.reiserfs from gentoo liveCD 2005.1 and at the end I got zero
> errors.
>
> The problem could be fixed, I could tar the whole root directory to an
> external drive, format the partition and then tar it back. but I'm not su=
re
> what's going on?
>
> I'll post all logs on this list tomorrow.
>
> -Bedros
>
>
> On 10/27/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> >
> > Hello
> >
> > Bedros Hanounik wrote:
> > > Hi,
> > >
> > > I've been using reiserfs for several years now and it's been choice
> > > number one for me; I'll probably switch to reiser4 once it's in the
> > main
> > > kernel.
> > >
> > > on my home file server machine, one hard drive (120GB) reports 80 GB
> > > used, but I have no idea how and where it's used.
> > >
> > > df -h reports 80GB used
> > >
> >
> > what does du -s / report?
> >
> > > but when I run kdirstat, I get about 10GB used for directory /.
> > >
> > > I ran fsck.reiserfs from liveCD and it reported no errors.
> > >
> >
> > is it reiserfsck 3.6.19?
> > Please send output of reiserfsck 3.6.19.
> >
> > > is there any better way to tell what's eating up my hard drive?
> > >
> > > Regards,
> > >
> > > -Bedros
> > >
> > >
> >
> >
>

------=_Part_4268_25162967.1130519967642
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Vlad,<br>
<br>
fsck.reiserfs version is&nbsp; 3.6.19; when I run it, it reports no corrupt=
ion errors found at the end; or something like that.<br>
<br>
I'll tar the whole partition to an external drive, then format it and untar=
 it again.<br>
<br>
Anyone knows if &quot;tar cvjpf file /&quot; is suffecient to keep all perm=
isions
etc. (including for system directories such as /proc /dev) and
restoring exactly as it was before format?<br>
<br>
Thanks,<br>
<br>
-B<br>
<br>
<br><br><div><span class=3D"gmail_quote">On 10/27/05, <b class=3D"gmail_sen=
dername">Bedros Hanounik</b> &lt;<a href=3D"mailto:2bedros@gmail.com">2bedr=
os@gmail.com</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=
=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; p=
adding-left: 1ex;">
<br>&quot;du -shx&quot; reports 9.5GB<br>
<br>
I'm running latest from gentoo, so I assume it's 3.6.19. <br>
<br>
I ran fsck.reiserfs from gentoo liveCD 2005.1 and at the end I got zero err=
ors.<br>
<br>
The problem could be fixed, I could tar the whole root directory to an
external drive, format the partition and then tar it back. but I'm not
sure what's going on?<br>
<br>
I'll post all logs on this list tomorrow.<br><span class=3D"sg">
<br>
-Bedros</span><div><span class=3D"e" id=3D"q_10732fc01dd25bf0_2"><br>
<br>
<br><div><span class=3D"gmail_quote">On 10/27/05, <b class=3D"gmail_sendern=
ame">Vladimir V. Saveliev</b> &lt;<a href=3D"mailto:vs@namesys.com" target=
=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,this)">vs@nam=
esys.com
</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1=
ex;">
Hello<br><br>Bedros Hanounik wrote:<br>&gt; Hi,<br>&gt;<br>&gt; I've been u=
sing reiserfs for several years now and it's been choice<br>&gt; number one=
 for me; I'll probably switch to reiser4 once it's in the main<br>&gt; kern=
el.
<br>&gt;<br>&gt; on my home file server machine, one hard drive (120GB) rep=
orts 80 GB<br>&gt; used, but I have no idea how and where it's used.<br>&gt=
;<br>&gt; df -h reports 80GB used<br>&gt;<br><br>what does du -s / report?
<br><br>&gt; but when I run kdirstat, I get about 10GB used for directory /=
.<br>&gt;<br>&gt; I ran fsck.reiserfs from liveCD and it reported no errors=
.<br>&gt;<br><br>is it reiserfsck 3.6.19?<br>Please send output of reiserfs=
ck=20
3.6.19.<br><br>&gt; is there any better way to tell what's eating up my har=
d drive?<br>&gt;<br>&gt; Regards,<br>&gt;<br>&gt; -Bedros<br>&gt;<br>&gt;<b=
r><br></blockquote></div><br>

</span></div></blockquote></div><br>

------=_Part_4268_25162967.1130519967642--
