From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Fri, 14 Dec 2012 22:20:49 +0400
Message-ID: <8441852.S0Hz7rjb2F@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <1389717.RAQAZZVsPt@intelfx-laptop> <50CB088C.3090801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=mIjrkodGVUpUXOmyXuabsMIqCNoJdGcdmnU3GLFluig=;
        b=Svg5AMoeNz6dg/Aa4z/hGTMcYEzDnN+j6336L4qW+Jy2644XAgl3dPj2x/VLUoEfvq
         1NVnyjax54d0U3uHN+KNdGO3NudaiJMvh3XGR140NvEyXxVo3pjKsBAgRZno7Jlxodgt
         T8VM1ifxZlZ12stkH89GJfRyV+ReLtXmshiIztgUezKwTcpcomJggVDi19Uccswbtbwe
         KAJgBg8mIGv96GDDpuKCYmYXhCZCV0efK6kl+bvTIeUDIHNTwOpntSJTwtrbE1Kkf/Wy
         uFdr0Foi5iKjp4GXhExJHXXQAMJQm69WHVTODwtZghcsvU9I6cFH7tW3HGQKu9IPovlU
         /RHQ==
In-Reply-To: <50CB088C.3090801@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 14 December 2012 12:07:56 Edward Shishkin wrote:
> On 12/14/2012 04:14 AM, Ivan Shapovalov wrote:
> > On 13 December 2012 23:47:10 Edward Shishkin wrote:
> >> On 12/11/2012 09:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> >>> On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
> >>>=20
> >>> <edward.shishkin@gmail.com>   wrote:
> >>>> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
> >>>>> Hello!
> >>>>=20
> >>>> Hello.
> >>>>=20
> >>>>> With help of Du=C5=A1an =C4=8Coli=C4=87<dusanc@gmail.com>   who=
 provided his kernel
> >>>>> config
> >>>>> diff I've found a kernel option which, when disabled, greatly r=
educes
> >>>>> (hopefully to zero, but need time to verify it) corruption rate=
 in
> >>>>> reiser4.
> >>>>>=20
> >>>>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by=
 it
> >>>>> like
> >>>>> CONFIG_COMPACTION or CONFIG_MIGRATION).
> >>>>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disable=
d
> >>>>=20
> >>>> How long?
> >>>=20
> >>> For me the difference in uptime is months without vs hours with i=
t :D
> >>> on 2.6.39.4
> >>=20
> >> Hm, indeed: my setup with enabled migration can not survive even o=
ne
> >> kernel compilation, while with disabled migration everything looks=
 ok..
> >=20
> > The overnight testing also showed no errors...
> > So shall we release reiser4-for-3.7 and announce FIXED(?) once agai=
n?
> >=20
> > :)
>=20
> I worry that migration is mandatory option for hugepages.
> Does fail_migrate_page() work with hugepages?

_Apparently_ yes. We have a counter named "compact_pagemigrate_failed" =
in=20
/proc/vmstat (documented in vm/transhuge.txt), which means that failing=
 a page=20
migration is not a critical event. So hugepages and compaction will wor=
k,=20
albeit quite less effectively...

=2E..And I've immediately got a bunch of (presumably silly) questions w=
hile=20
trying to implement ->migratepage().

1) Why it is needed to writeback dirty pages before migrating them?

2) Looking at the default implementation (fallback_migrate_page()), wha=
t is=20
the meaning of migrating a released page? In other words, doesn't "rele=
asing"=20
page anyway mean "completely freeing" it, requiring the fs to read=20
corresponding data again?

3) As far as I could understand, migrating page (from fs's point of vie=
w) is=20
just replacing all internal pointers to the "old" page with pointers to=
 the=20
new one together with calling predefined functions migrate_page_move_ma=
pping()=20
and migrate_page_copy(). So here's a question - which structures of rei=
ser4=20
(beyond jnode->pg) keep pointers to pages and how to access them, given=
 a=20
single page?
I can remember cryptcompress's struct cluster_handle which stores an ar=
ray of=20
pages...

Thanks,
Ivan.

>=20
> Also before the release I'll try to take a look at this:
> http://marc.info/?l=3Dreiserfs-devel&m=3D135402207623711&w=3D2
>=20
> This failed path might indicate that we adjusted to fs-writeback
> incorrectly.
>=20
> Edward.
>=20
> > Regards,
> > Ivan.
> >=20
> >>>>>     on kernel
> >>>>>=20
> >>>>> 3.6.10, and everything seems to be OK so far (so the workaround=
 is
> >>>>> version-
> >>>>> agnostic).
> >>>>>=20
> >>>>> Edward, are there any guesses on what can make reiser4 choke on
> >>>>> hugepages/compaction/migration?
> >>>>=20
> >>>> TBH, no ideas. They (hugepages) are _transparent_.
> >>>> It means we shouldn't suffer in theory ;)
> >>>>=20
> >>>>>     I'm not even barely familiar with the kernel
> >>>>>=20
> >>>>> internals.
> >>>>>=20
> >>>>> Thanks,
> >>>>> Ivan.
--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=A8=D0=B0=D0=BF=D0=BE=D0=B2=D0=B0=D0=BB=D0=BE=D0=B2 =D0=98=D0=B2=D0=B0=
=D0=BD.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
