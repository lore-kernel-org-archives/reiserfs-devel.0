From: Harry Duncan <usr.src.linux@gmail.com>
Subject: bug#22113: PATCH: Updated Reiser4 probe enabled against GNU Parted
	git://git.sv.gnu.org/parted.git
Date: Sat, 25 May 2019 00:03:17 +0100
Message-ID: <CAHAPYVBzJ4ob4oNY8AE+m-cbWkjYg0u+dEhLbi8xaaeuDBX1nQ@mail.gmail.com>
References: <CAM12Q5QDp__EAjLUEUbmyFFm1ap=uQrF2Od_S5ZBg6NnOL2ZAg@mail.gmail.com>
	<20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000ee27880589aa34ef"
Return-path: <bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org>
Sender: "Debbugs-submit" <debbugs-submit-bounces@debbugs.gnu.org>
Resent-Message-ID: <handler.22113.B22113.155873901729051@debbugs.gnu.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025; 
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bOnnGGhERbE3a/eeH6AT9usjuV+1xHIG6oYz7g/R8oI=;
	b=L1elXnTND/xft5OFaoxLhkLSopqOCzj3PuDNhtz23khfyrUtI5YsWuHvTnP9UzlBJ7
	MT+jtZsU/gcGI3dGidUice2DpdjwbFenYDXVdSrShaIGdH8hZwar+eKAy0GHsj4XMjB9
	J1tyqy4F7FClkJAzqmmpwN4XRY8QdGcBmJx6Q4LLCPkIVSFDW0Q+xV2uV3GsT7kUqV+1
	lSG53CHCSvtT5rjC/wtFWcf9bgSWSQpOtnYoSUq6c2w8sGeyA+2lRNvHoFLg+okvKlGj
	gfkm+BS91VakK9a7YHjos4AYXMppsvDyUnqBpAT0psEZ/gdtkLAy3OTZ5L10dT8Ybm3m
	C1Ng==
In-Reply-To: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/bug-parted>,
	<mailto:bug-parted-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/bug-parted/>
List-Post: <mailto:bug-parted@gnu.org>
List-Help: <mailto:bug-parted-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/bug-parted>,
	<mailto:bug-parted-request@gnu.org?subject=subscribe>
Errors-To: bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org
Sender: "bug-parted" <bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org>
To: Metztli Information Technology <jose.r.r@metztli.com>
Cc: edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org, 22113@debbugs.gnu.org

--000000000000ee27880589aa34ef
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 11:02 PM Metztli Information Technology <
jose.r.r@metztli.com> wrote:

>
>
> On Fri, May 24, 2019 at 7:46 AM Edward Shishkin <edward.shishkin@gmail.com>
> wrote:
> >
> > On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
> > > Niltze [Hello]-
> > >
> > > Just updated Reiser for patch against GNU Parted
> > > git clone git://git.sv.gnu.org/parted.git
> >
> > Uh, it is in upstream already?
> LOL, no.
>
> I just followed Debian maintainer's original advice on updating patch
> against git branch of GNU Parted.
> < https://marc.info/?l=reiserfs-devel&m=155865303620491&w=2 >
>
> > Someone must have died ...
>

Or someone was perhaps convicted of second degree murder after a plea deal
for revealing the location of his wife's corpse. ReiserFS wasn't production
quality when it was mainstream, ie. its own filessystem check tools were
incapable of repairing a filesystem that was improperly closed under the
majority of scenarios. I'd strongly suggest whatever your need is for this
filesystem, re-evaluate your position.

--000000000000ee27880589aa34ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 24, 2019 at 11:02 PM Metz=
tli Information Technology &lt;<a href=3D"mailto:jose.r.r@metztli.com">jose=
.r.r@metztli.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
<br>
On Fri, May 24, 2019 at 7:46 AM Edward Shishkin &lt;<a href=3D"mailto:edwar=
d.shishkin@gmail.com" target=3D"_blank">edward.shishkin@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; On 05/24/2019 01:05 AM, Metztli Information Technology wrote:<br>
&gt; &gt; Niltze [Hello]-<br>
&gt; &gt;<br>
&gt; &gt; Just updated Reiser for patch against GNU Parted<br>
&gt; &gt; git clone git://<a href=3D"http://git.sv.gnu.org/parted.git" rel=
=3D"noreferrer" target=3D"_blank">git.sv.gnu.org/parted.git</a><br>
&gt;<br>
&gt; Uh, it is in upstream already?<br>
LOL, no.<br>
<br>
I just followed Debian maintainer&#39;s original advice on updating patch a=
gainst git branch of GNU Parted.<br>
&lt; <a href=3D"https://marc.info/?l=3Dreiserfs-devel&amp;m=3D1558653036204=
91&amp;w=3D2" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dr=
eiserfs-devel&amp;m=3D155865303620491&amp;w=3D2</a> &gt;<br>
<br>
&gt; Someone must have died ...<br></blockquote><div><br></div>Or someone w=
as perhaps convicted of second degree murder after a plea deal for revealin=
g the location of his wife&#39;s corpse. ReiserFS wasn&#39;t production qua=
lity when it was mainstream, ie. its own filessystem check tools were incap=
able of repairing a filesystem that was improperly closed under the majorit=
y of scenarios. I&#39;d strongly suggest whatever your need is for this fil=
esystem, re-evaluate your position.<br></div></div>

--000000000000ee27880589aa34ef--



