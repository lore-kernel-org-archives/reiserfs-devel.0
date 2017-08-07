From: jose@mictlantecuhtli.metztli-it.com (Jose R Rodriguez)
Subject: Debian Linux Reiser4 -patched Kernel 4.11.12 EOL source
Date: Mon,  7 Aug 2017 02:11:36 -0700 (PDT)
Message-ID: <20170807091136.942E8C7B91F@mictlantecuhtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1502097097; h=From: Date: Message-Id: To: Subject: Sender;
 bh=sIYoVTn/LFwzSGWxCZrJ2k7YeOuwTdPuIdv3f9a4sZI=; b=W56ZOCM+JvZyKV5ZZaRDidmCA1J85OzrGkaGJfI+YFWm1sT4b+GEGwMaWpQxr5TIWFkVsT3/
 udCR5M0tOTnFT5+ir45TPAn4w5oDBvAtY4lup0NHOhKPu3DX0O0cq/Qy45zWkb5yWDAUmdKE
 WiZU/7uawZIc/dNrxzJ0l6u5jmM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-devel@vger.kernel.org


Niltze, all-

Here is a link for reiser4 -patched kernel 4.11.12 end of life (EOL) source=
 that I used to generate UDEB reiser4 modules, etc. for latest Metztli Reis=
er4 debian 9.1 Stretch netboot:
< https://sourceforge.net/p/metztli-reiser4/code/ >

Please note that upstream 4.11.12-for-4.11.11 patch was applied to debian k=
ernel 4.11.11-1 and wrapped in its complementing version packaging =E2=80=
=93 all hacked for smooth installation of pertinent patches.

I have local and Google cloud Metztli Reiser4 instances running with above =
kernel.

For the cloud this time I decided to try creating an image with (default) t=
ransparent compression reiser4 root fs. What surprised me is how fast and e=
fficient the reiser4 transparent compression image performs in the Google c=
loud instance. I was expecting a noticeable performance penalty but so far =
it's extremely fast. I am still testing:
< https://metztli.it/readOnlyEphemeral/gce-reiser4_transparent-compression.=
png >

After local creation in VirtualBox and subsequent preparation and optimizat=
ion for the Google Compute Engine (GCE), the image is tarred and uploaded t=
o a Google storage repository - from there the image is added (via local SD=
K or web console) to an image debian family in one's project.

If anyone is interested in the reiser4 transparent compression tarred image=
 ~500MB for their Google Compute Engine project, please let me know.


Best Professional Regards.


--=20
Jose R R
http://metztli.it
---------------------------------------------------------------------------=
------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.11
---------------------------------------------------------------------------=
------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------=
------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------=
------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
