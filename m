From: John Dong <john.dong@gmail.com>
Subject: Re: Unexpected reset corrupted Reiser4 filesystem
Date: Wed, 25 May 2005 06:46:10 -0400
Message-ID: <cfec5fb8050525034649449ac8@mail.gmail.com>
References: <200505242338.32420.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
	 <429403EF.4030803@slaphack.com>
Reply-To: John Dong <john.dong@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_17753_5724551.1117017970133"
Return-path: <reiserfs-list-return-24138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429403EF.4030803@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_17753_5724551.1117017970133
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

If thse were IDE drives, the IDE writeback cache is probably the bad boy --=
=20
on FreeBSD 5.x, Soft Updates is virtually broken on IDE drives because they=
=20
simply haven't written all the data they promised the kernel that they had.

On 5/25/05, David Masover <ninja@slaphack.com> wrote:
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Andrew James Wade wrote:
> > Hello,
> >
> > One of my Reiser4 filesystems was corrupted by a power glitch.
>=20
> No filesystem can prepare for a power glitch, AFAIK.
>=20
> > fsck fixed the corruption, but my understanding is that an
> > unexpected reset should not have corrupted the filesystem. I
>=20
> It's my understanding that an unexpected _should_ not have corrupted the
> filesystem. Generally, this means that if we have everything working
> the way it's supposed to right up until someone hits the Reset switch,
> there _should_ be zero corruption.
>=20
> Caveats:
> 1.) _should_ is not _is_. Just because the developers can't crash it
> doesn't mean it's invulnerable.
> 2.) power flicker is different than the power/reset button. It really
> all depends on what your hardware actually does when power is cut, but
> most hard drives do some sort of write caching, and some of them make it
> impossible to turn that off.
>=20
> To say more, I'd have to know about the physical mechanics involved, but
> even if you could make the system absolutely invulnerable to power loss,
> you're still going to lose data (not corrupt -- LOSE) in such an event,
> unless you have a battery backup. Even then, your drive is eventually
> going to fail -- so use RAID. And someone is eventually going to rm -rf
> your RAID, or spill coffee on it, or hit it with a
> tornado/earthquake/nuke, so have multiple sites and make backups.
>=20
> That's what it all comes down to -- make backups. The fact that you
> have journalling/transactions/fsck/batteries/RAID is all just to make it
> a little less catostrophic when stuff does fail.
>=20
> > have an image of the corrupted filesystem, is it of any use to
> > anyone?
>=20
> Probably someone, not me. I don't work here, but I'll bet money that
> they are going to ask for something from debugfs.
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.1 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>=20
> iQIVAwUBQpQD7ngHNmZLgCUhAQLvSA//bPqBcYMs/NRS7mT//zlGF0WK2YlnNUCd
> 2hvzXxQhKcLMIvaTo9DJ9wzkaDIHot1DZUcuFIU3f4qmb7QIlMbkVoYE1AW34Wg/
> /G06KTkHUi0iU+GJ9Dq65Oj4nK1SM4AtBHMpLqhpcW0FExsj9ScmewcSehFNSzDS
> Frptzvk/iWtkip2rJxReF8rKr170Y2aR+1DNaCUiLLoESTgbF5WMmcJFyyuaa0/y
> JbP8/kTz4mbLuZuIt6qKswHqUACUA98sK32zeylUOeccKih35FkiaZtegIwti6Op
> QwfuCQNyhlODVxAUCghMxz6RtF59Zk4hfoWv5f1GHB7/MHgHGQmMeBy3G/Y/y8D/
> P29LVyjhyStVmRyfYtDewMIBQz+nx1+StTqZ3jimfwlpMZxOxeGc0IbV9qiM4o6U
> uYgtf9nrdeywn2HruijYO5xiTUcIbaBUGsvCCxNYrdzMYKEDsk3iTR/Jrxl/8GJl
> d88NwSAdiU+uUcPkfdlcl+bHk3SB1yX7sjbItOtrUgZxFYsjtuFOusaOo5CkT84l
> 2lduqioG2u4zWirRk3d3QJEWETykhX4JnjnCjw/qAQ9+JOLc5xjUbgO2fB8d1toy
> QKGGVTH1P3i8Ux5ISrtP3noNtA/zzGRlhYShzc50bq8c8+/CAiqnx9FZGv854Ttp
> hpTuQ1Ht0FA=3D
> =3D1k9p
> -----END PGP SIGNATURE-----
>

------=_Part_17753_5724551.1117017970133
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

If thse were IDE drives, the IDE writeback cache is probably the bad
boy -- on FreeBSD 5.x, Soft Updates is virtually broken on IDE drives
because they simply haven't written all the data they promised the
kernel that they had.<br><br><div><span class=3D"gmail_quote">On 5/25/05, <=
b class=3D"gmail_sendername">David Masover</b> &lt;<a href=3D"mailto:ninja@=
slaphack.com">ninja@slaphack.com</a>&gt; wrote:</span><blockquote class=3D"=
gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0p=
t 0pt 0pt 0.8ex; padding-left: 1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>Hash: SHA1<br><br>Andrew James Wade w=
rote:<br>&gt; Hello,<br>&gt;<br>&gt; One of my Reiser4 filesystems was corr=
upted by a power glitch.<br><br>No filesystem can prepare for a power glitc=
h, AFAIK.
<br><br>&gt; fsck fixed the corruption, but my understanding is that an<br>=
&gt; unexpected reset should not have corrupted the filesystem. I<br><br>It=
's my understanding that an unexpected _should_ not have corrupted the<br>
filesystem.&nbsp;&nbsp;Generally, this means that if we have everything wor=
king<br>the way it's supposed to right up until someone hits the Reset swit=
ch,<br>there _should_ be zero corruption.<br><br>Caveats:<br>1.)&nbsp;&nbsp=
;_should_ is not _is_.&nbsp;&nbsp;Just because the developers can't crash i=
t
<br>doesn't mean it's invulnerable.<br>2.)&nbsp;&nbsp;power flicker is diff=
erent than the power/reset button.&nbsp;&nbsp;It really<br>all depends on w=
hat your hardware actually does when power is cut, but<br>most hard drives =
do some sort of write caching, and some of them make it
<br>impossible to turn that off.<br><br>To say more, I'd have to know about=
 the physical mechanics involved, but<br>even if you could make the system =
absolutely invulnerable to power loss,<br>you're still going to lose data (=
not corrupt -- LOSE) in such an event,
<br>unless you have a battery backup.&nbsp;&nbsp;Even then, your drive is e=
ventually<br>going to fail -- so use RAID.&nbsp;&nbsp;And someone is eventu=
ally going to rm -rf<br>your RAID, or spill coffee on it, or hit it with a<=
br>tornado/earthquake/nuke, so have multiple sites and make backups.
<br><br>That's what it all comes down to -- make backups.&nbsp;&nbsp;The fa=
ct that you<br>have journalling/transactions/fsck/batteries/RAID is all jus=
t to make it<br>a little less catostrophic when stuff does fail.<br><br>&gt=
; have an image of the corrupted filesystem, is it of any use to
<br>&gt; anyone?<br><br>Probably someone, not me.&nbsp;&nbsp;I don't work h=
ere, but I'll bet money that<br>they are going to ask for something from de=
bugfs.<br><br>-----BEGIN PGP SIGNATURE-----<br>Version: GnuPG v1.4.1 (GNU/L=
inux)<br>
Comment: Using GnuPG with Thunderbird - <a href=3D"http://enigmail.mozdev.o=
rg">http://enigmail.mozdev.org</a><br><br>iQIVAwUBQpQD7ngHNmZLgCUhAQLvSA//b=
PqBcYMs/NRS7mT//zlGF0WK2YlnNUCd<br>2hvzXxQhKcLMIvaTo9DJ9wzkaDIHot1DZUcuFIU3=
f4qmb7QIlMbkVoYE1AW34Wg/
<br>/G06KTkHUi0iU+GJ9Dq65Oj4nK1SM4AtBHMpLqhpcW0FExsj9ScmewcSehFNSzDS<br>Frp=
tzvk/iWtkip2rJxReF8rKr170Y2aR+1DNaCUiLLoESTgbF5WMmcJFyyuaa0/y<br>JbP8/kTz4m=
bLuZuIt6qKswHqUACUA98sK32zeylUOeccKih35FkiaZtegIwti6Op<br>QwfuCQNyhlODVxAUC=
ghMxz6RtF59Zk4hfoWv5f1GHB7/MHgHGQmMeBy3G/Y/y8D/
<br>P29LVyjhyStVmRyfYtDewMIBQz+nx1+StTqZ3jimfwlpMZxOxeGc0IbV9qiM4o6U<br>uYg=
tf9nrdeywn2HruijYO5xiTUcIbaBUGsvCCxNYrdzMYKEDsk3iTR/Jrxl/8GJl<br>d88NwSAdiU=
+uUcPkfdlcl+bHk3SB1yX7sjbItOtrUgZxFYsjtuFOusaOo5CkT84l<br>2lduqioG2u4zWirRk=
3d3QJEWETykhX4JnjnCjw/qAQ9+JOLc5xjUbgO2fB8d1toy
<br>QKGGVTH1P3i8Ux5ISrtP3noNtA/zzGRlhYShzc50bq8c8+/CAiqnx9FZGv854Ttp<br>hpT=
uQ1Ht0FA=3D<br>=3D1k9p<br>-----END PGP SIGNATURE-----<br></blockquote></div=
><br>

------=_Part_17753_5724551.1117017970133--
