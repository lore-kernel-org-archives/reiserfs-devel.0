From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Re: reiser4 patch for 5.5.1 and fs/fs-writeback.c
Date: Sat, 22 Feb 2020 11:34:46 -0800 (PST)
Message-ID: <20200222193446.C495950BFAD7@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1582400106; h=From: Date: Message-Id: To: Subject: Sender;
 bh=q0NA/K1KCpCHsdjPrBAe4WOOQYHxHzuLAH0Kv9cfn6c=; b=Ie48GBzCsDKb0nWT2b3qTbS8qD4bibm+K+dF15W5VeDvmNj6RoJuS8XWYiIQ2uPmsY0zRJUk
 YAxxNBf/eF5Tiy1TNqsKq08ujzonbZZT4tCyd1IP9aBq+cZPhOYrBwSh8XomdXu3sJkDWe3k
 4V9QjZWvajiR1FjnpltIitazkMA=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org

On Sat, Feb 22, 2020 at 3:56 AM Edward Shishkin <edward.shishkin@gmail.com>=
 wrote:
>
> On 02/22/2020 05:51 AM, Metztli Information Technology wrote:
> > Niltze, Ed-
> >
> > Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, ch=
anges
> > from
> > set_worker_desc("flush-%s", dev_name(wb->bdi->dev));
> >
> > to
> > set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
> >
> > I realized that when I was hacking 5.4.19 and, subsequently, my current=
ly running kernel --as there was no RC3:
> >
> > uname -a
> > Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+=
reiser4.0.2 (2020-02-14) x86_64 GNU/Linux
> >
> > < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4=
.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >
> >
> >
> > I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1=
.patch.gz, that your patch should be modified
> > =C2=A0 accordingly; else, the patch will fail and will necessitate manu=
al intervention, i.e., similar to 5.4.18 vs 5.4.19:
> >
> > < https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >
>
> so, everything works fine after that "manual intervention"?

Indeed, Ed. No issues thus far. I upgraded my local dev environment to 5.4.=
20-1+reiser4 on February 15, 2020; in such environment I have built several=
 PHP-7.3 iterations and I also built kernel 5.5.5-1+reiser4 yesterday. Addi=
tionally, replaced 5.4.20-1+reiser4 cloud flavour in a Google Compute Engin=
e (GCE) customized Zstd transparent compression instance -- which hosts mul=
tiple PHP and Ruby applications and functions as a media / web server, as w=
ell -- without issues thus far.

Best Professional Regards.

--=20
Jose R R
http://metztli.it
---------------------------------------------------------------------------=
------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.4.18 AMD64
---------------------------------------------------------------------------=
------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------=
----------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
