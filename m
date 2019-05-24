From: jose.r.r@metztli.com (Metztli Information Technology)
Subject: bug#22113: PATCH: Updated Reiser4 probe enabled against GNU Parted
	git://git.sv.gnu.org/parted.git
Date: Fri, 24 May 2019 15:01:27 -0700 (PDT)
Message-ID: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
References: <CAM12Q5QDp__EAjLUEUbmyFFm1ap=uQrF2Od_S5ZBg6NnOL2ZAg@mail.gmail.com>
Return-path: <bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org>
In-Reply-To: <CAM12Q5QDp__EAjLUEUbmyFFm1ap=uQrF2Od_S5ZBg6NnOL2ZAg@mail.gmail.com>
Sender: "Debbugs-submit" <debbugs-submit-bounces@debbugs.gnu.org>
Resent-Message-ID: <handler.22113.B22113.155873530122926@debbugs.gnu.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it;
	q=dns/txt; 
	s=mx; t=1558735294; h=From: Date: Message-Id: To: Subject: Sender;
	bh=XG+4PTxCXrXFYd5HCm0mwZr9N0Np8jiHB/B+451g/Ic=;
	b=XgR/O9hZzmlRgFkteQAU32WMucH4snXxbQ/p0RLqcwUqugRBuCbgYAAQxBSqVpb9iMa6KICF
	Aq08iBB0pyyGcYEttWBDgsZ8QfMCH1qT+O3XiMeR2Inpb8Beo/ogRPjOiwZ1OWgcQa0DNac/
	9cCp6CYZhjceHDyAC6LqkwtJWmg=
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org, 22113@debbugs.gnu.org, bcl@redhat.com



On Fri, May 24, 2019 at 7:46 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
> > Niltze [Hello]-
> >
> > Just updated Reiser for patch against GNU Parted
> > git clone git://git.sv.gnu.org/parted.git
>
> Uh, it is in upstream already?
LOL, no.

I just followed Debian maintainer's original advice on updating patch against git branch of GNU Parted.
< https://marc.info/?l=reiserfs-devel&m=155865303620491&w=2 >

> Someone must have died ...

Well, that's the reasoning behind GNU Parted gatekeeper
< https://www.brianlane.com/about-brian-c-lane/ >

for not merging reiser4 patch.

I just wonder if now that 'Big Blue' acquired Red Hat, the GNU Parted gatekeeper will act in a consistent
manner and quit his employer on 'ethical and moral' grounds in light of Watson's complicity tainting the company.
< https://russia-insider.com/en/head-ibm-sympathized-hitler-conducted-census-jews-preparation-camps-russian-tv-news/ri26587 >
< https://youtu.be/tCBT8H47sZ0 >
(and/or "Democracy For The Few" by Michael Parenti).

i.e., "...I have absolutely
no desire to see [IBM]'s work or name do anything but disappear into
obscurity."
< http://lists.gnu.org/archive/html/bug-parted/2015-12/msg00008.html >

Well, maybe I quoted him too soon. Unlike Reiser, who is down and dirt-poor and thus all the West 'morally and ethically righteous' developers kick and pile 
scorn onto, 'Big Blue's wealth quells USA technology ecosystem and their employees' ethical and moral sophistry, as is evidenced by, say no issues with JFS,
for instance.

>
> Thanks,
> Edward.
>
> >
> > apply patch
> >
> > ./bootstrap
> >
> > ./configure
> >
> > make
> >
> > make install
> >
> >
> > Huelmati [Enjoy]!
> >
> >
>

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 5.0.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/



