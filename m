From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Mon, 11 Jan 2016 03:42:22 -0800
Message-ID: <CAM12Q5S9ugte1NLTKY68qa=rXD13Kktric+Osfw-rOeXF2uw0Q@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c2a5f626bede05290d6e0a
Return-path: <bounce-debian-boot=debian-boot=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=7HFfXXr69OY4r7y4KaUe7ZipmuUHnC3kEONnELcwsb0=;
        b=QPTWq4yWMEajCxFu84NlC1LNFisdI1AZgcZrhwg2kxed/TMDK0jfr1GpblNuB0r75g
         +gjsSLUA2GoHUGXspeNL9HodhOmfCMYXTOKnG6M9ujBn9gclXGxAwH328RGDdknSOZEo
         vcueu1R05Ejbq0xeZaPFkYQyAbSdPQp0YbwqjAoKQFzWTFKhxZfXwCqueB16cm5pTM4j
         rT+H3gp8+GLKL67be+94dMxKFsgZZFTMix+C3L+06ZO/C08tFDKNj/Ntys8sCau2p0f9
         Gn+fDMoQowNZV2PBSSgujIniQDMjCX09a1TkHCOigl1ZIiMI2dSTMfUYoXy993BPBQo3
         2nAg==
Sender: jose.r.r@metztli.com
In-Reply-To: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Resent-Message-ID: <ThPf2d68VhK.A.SOH.-U5kWB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-boot/>
List-Post: <mailto:debian-boot@lists.debian.org>
List-Help: <mailto:debian-boot-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-boot-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-boot-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAM12Q5S9ugte1NLTKY68qa=rXD13Kktric+Osfw-rOeXF2uw0Q@mail.gmail.com
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>

--001a11c2a5f626bede05290d6e0a
Content-Type: multipart/alternative; boundary=001a11c2a5f626bed905290d6e08

--001a11c2a5f626bed905290d6e08
Content-Type: text/plain; charset=UTF-8

(Bonus) Reiser4 version 4.0.1 -enabled patch for Debian Linux kernel
packaging:

On Wed, Jan 6, 2016 at 2:19 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze, all-
>
> I have been building iterations of Debian-Installer (d-i) enhanced
> with Reiser4 4.0.1 kernel, disk and filesystem utilities. Thus far I
> have used a local build on Debian Sid of VirtualBox 5.0.10 environment
> to test multiple Reiser4 installations.
>
> For flexibility, especially if you are testing in a VM, the following
> d-i options may help:
>
> -Network-console: continue installation remotely using SSH
> -Openssh-client-udeb: secure shell client for the Debian installer
>
> Now:
>
> d-i offers three(3) choices:
>
> Jessie (stable)
> Stretch (testing)
> Sid (unstable)
>
> I have verified that *all* can be installed from my custom Reiser4
> d-i; Nevertheless Jessie (stable) needs access to testing and/or
> unstable repositories added at /etc/apt/sources.list in order to
> fulfill dependencies of the unstable kernel in my d-i. Jessie (stable)
> also needs to have newer Reiser4 4.0.1 packages because d-i downloads
> the older (stable) version. I have covered *all* of Jessie conditions
> by building newer unstable versions of its requirements. The downside
> of it is that a user needs to manually intervene at the shell,
> possibly at the expert level.
>
> As for Stretch and Sid, manual intervention is required only to modify
> /etc/initramfs-tools/modules file by adding at the end:
>
> crc32c_intel
> reiser4
>
> *before* installing the custom Reiser4 kernel, thus:
> dpkg -i linux-image-4.3.0-1-amd64_4.3.3-5_amd64.deb
>
> so that initramfs can be appropriately updated *before* rebooting the
> new Reiser4 installation.
>
> Note that GRUBX does not support booting from /boot Reiser4
> filesystem; accordingly, a small partition must be provisioned for
> booting into a Reiser4 -formatted root (/) partition. The d-i
> partman-reiser4 will format Reiser4 partitions thus:
>
> mkfs.reiser4 -yo "create=reg40" <your selected partition>
>
> Additionally, user may want to provision a /tmp in a non-Reiser4
> partition if the intention is to run MariaDB (MySQL) because -- at the
> very least -- the DB will complain about /tmp issues if it is
> formatted in Reiser4 --personal experience ;-)
>
> With the above said and warning that this is an alpha effort *without*
> any explicit and/or implied guarantee that will be risk-free, here is
> the current yield of of Reiser4 effort:
>
> Reiser4 -enabled Debian-Installer (d-i) netboot mini.iso renamed as:
> http://metztli.it/readOnlyEphemeral//metztli_it-reiser4_d-i.iso
>
> Reiser4 -enabled kernel & modules.README_1st:
>
http://metztli.it/readOnlyEphemeral/linux-image-4.3.0-1-amd64_4.3.3-5_amd64.tar
>
> Reiser4 -enabled Debian GNU Parted packages (install at the end of
> installation procedure); please note that those packages under
> reiser4-parted_3.2-12/misc are optional):
> http://metztli.it/readOnlyEphemeral/reiser4-parted_3.2-12.tar
> (after untarring above referenced, install as)
> cd reiser4-parted_3.2-12
> dpkg -i parted_3.2-12_amd64.deb libparted2_3.2-12_amd64.deb
>
> Next resource is only needed if Jessie was installed. Package below
> will replace the older Reiser4 file utilities:
> http://metztli.it/readOnlyEphemeral/reiser4progs-4.0.1.tar
>
> Although I have created patches for most (or all ;-) of the above at
> GitHub, I realize Debian Unstable (Sid) is a fast moving development
> effort and within a couple of weeks the kernel referenced above will
> be outdated and d-i will refuse to install.
>
> With the previous statement said, and if anyone is willing, try the
> above Debian-Installer (d-i) resources while the kernel is fresh...
>
> Feedback and/or suggestions welcome.
>
>
> Best Professional Regards
>
>
> P.S I am already preparing some images for Google Compute Engine (GCE)
> < https://cloud.google.com/compute/ > to add to currently testing
> Reiser4 images created last year.
> --

Based on building a Reiser4 4.0.1 -patched Linux kernel the 'debian way'
(hack, literally -- but it works ;-) prior post:
https://metztli.it/blog/index.php/aH0?blog=4

Creates Reiser4 4.0.1 kernel module UDEB suitable for inclusion into
Debian-Installer (d-i); please, note that, as explained in the referenced
blog above, /usr/share/kernel-wedge/package-list
must also be modified in addition to this patch below attached:


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

--001a11c2a5f626bed905290d6e08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(Bonus) Reiser4 version 4.0.1 -enabled patch for Debian Li=
nux kernel packaging:<br><br>On Wed, Jan 6, 2016 at 2:19 AM, Jose R R &lt;<=
a href=3D"mailto:Jose.r.r@metztli-it.com">Jose.r.r@metztli-it.com</a>&gt; w=
rote:<br>&gt; Niltze, all-<br>&gt;<br>&gt; I have been building iterations =
of Debian-Installer (d-i) enhanced<br>&gt; with Reiser4 4.0.1 kernel, disk =
and filesystem utilities. Thus far I<br>&gt; have used a local build on Deb=
ian Sid of VirtualBox 5.0.10 environment<br>&gt; to test multiple Reiser4 i=
nstallations.<br>&gt;<br>&gt; For flexibility, especially if you are testin=
g in a VM, the following<br>&gt; d-i options may help:<br>&gt;<br>&gt; -Net=
work-console: continue installation remotely using SSH<br>&gt; -Openssh-cli=
ent-udeb: secure shell client for the Debian installer<br>&gt;<br>&gt; Now:=
<br>&gt;<br>&gt; d-i offers three(3) choices:<br>&gt;<br>&gt; Jessie (stabl=
e)<br>&gt; Stretch (testing)<br>&gt; Sid (unstable)<br>&gt;<br>&gt; I have =
verified that *all* can be installed from my custom Reiser4<br>&gt; d-i; Ne=
vertheless Jessie (stable) needs access to testing and/or<br>&gt; unstable =
repositories added at /etc/apt/sources.list in order to<br>&gt; fulfill dep=
endencies of the unstable kernel in my d-i. Jessie (stable)<br>&gt; also ne=
eds to have newer Reiser4 4.0.1 packages because d-i downloads<br>&gt; the =
older (stable) version. I have covered *all* of Jessie conditions<br>&gt; b=
y building newer unstable versions of its requirements. The downside<br>&gt=
; of it is that a user needs to manually intervene at the shell,<br>&gt; po=
ssibly at the expert level.<br>&gt;<br>&gt; As for Stretch and Sid, manual =
intervention is required only to modify<br>&gt; /etc/initramfs-tools/module=
s file by adding at the end:<br>&gt;<br>&gt; crc32c_intel<br>&gt; reiser4<b=
r>&gt;<br>&gt; *before* installing the custom Reiser4 kernel, thus:<br>&gt;=
 dpkg -i linux-image-4.3.0-1-amd64_4.3.3-5_amd64.deb<br>&gt;<br>&gt; so tha=
t initramfs can be appropriately updated *before* rebooting the<br>&gt; new=
 Reiser4 installation.<br>&gt;<br>&gt; Note that GRUBX does not support boo=
ting from /boot Reiser4<br>&gt; filesystem; accordingly, a small partition =
must be provisioned for<br>&gt; booting into a Reiser4 -formatted root (/) =
partition. The d-i<br>&gt; partman-reiser4 will format Reiser4 partitions t=
hus:<br>&gt;<br>&gt; mkfs.reiser4 -yo &quot;create=3Dreg40&quot; &lt;your s=
elected partition&gt;<br>&gt;<br>&gt; Additionally, user may want to provis=
ion a /tmp in a non-Reiser4<br>&gt; partition if the intention is to run Ma=
riaDB (MySQL) because -- at the<br>&gt; very least -- the DB will complain =
about /tmp issues if it is<br>&gt; formatted in Reiser4 --personal experien=
ce ;-)<br>&gt;<br>&gt; With the above said and warning that this is an alph=
a effort *without*<br>&gt; any explicit and/or implied guarantee that will =
be risk-free, here is<br>&gt; the current yield of of Reiser4 effort:<br>&g=
t;<br>&gt; Reiser4 -enabled Debian-Installer (d-i) netboot mini.iso renamed=
 as:<br>&gt; <a href=3D"http://metztli.it/readOnlyEphemeral//metztli_it-rei=
ser4_d-i.iso">http://metztli.it/readOnlyEphemeral//metztli_it-reiser4_d-i.i=
so</a><br>&gt;<br>&gt; Reiser4 -enabled kernel &amp; modules.README_1st:<br=
>&gt; <a href=3D"http://metztli.it/readOnlyEphemeral/linux-image-4.3.0-1-am=
d64_4.3.3-5_amd64.tar">http://metztli.it/readOnlyEphemeral/linux-image-4.3.=
0-1-amd64_4.3.3-5_amd64.tar</a><br>&gt;<br>&gt; Reiser4 -enabled Debian GNU=
 Parted packages (install at the end of<br>&gt; installation procedure); pl=
ease note that those packages under<br>&gt; reiser4-parted_3.2-12/misc are =
optional):<br>&gt; <a href=3D"http://metztli.it/readOnlyEphemeral/reiser4-p=
arted_3.2-12.tar">http://metztli.it/readOnlyEphemeral/reiser4-parted_3.2-12=
.tar</a><br>&gt; (after untarring above referenced, install as)<br>&gt; cd =
reiser4-parted_3.2-12<br>&gt; dpkg -i parted_3.2-12_amd64.deb libparted2_3.=
2-12_amd64.deb<br>&gt;<br>&gt; Next resource is only needed if Jessie was i=
nstalled. Package below<br>&gt; will replace the older Reiser4 file utiliti=
es:<br>&gt; <a href=3D"http://metztli.it/readOnlyEphemeral/reiser4progs-4.0=
.1.tar">http://metztli.it/readOnlyEphemeral/reiser4progs-4.0.1.tar</a><br>&=
gt;<br>&gt; Although I have created patches for most (or all ;-) of the abo=
ve at<br>&gt; GitHub, I realize Debian Unstable (Sid) is a fast moving deve=
lopment<br>&gt; effort and within a couple of weeks the kernel referenced a=
bove will<br>&gt; be outdated and d-i will refuse to install.<br>&gt;<br>&g=
t; With the previous statement said, and if anyone is willing, try the<br>&=
gt; above Debian-Installer (d-i) resources while the kernel is fresh...<br>=
&gt;<br>&gt; Feedback and/or suggestions welcome.<br>&gt;<br>&gt;<br>&gt; B=
est Professional Regards<br>&gt;<br>&gt;<br>&gt; P.S I am already preparing=
 some images for Google Compute Engine (GCE)<br>&gt; &lt; <a href=3D"https:=
//cloud.google.com/compute/">https://cloud.google.com/compute/</a> &gt; to =
add to currently testing<br>&gt; Reiser4 images created last year.<br>&gt; =
--<br><br>Based on building a Reiser4 4.0.1 -patched Linux kernel the &#39;=
debian way&#39; (hack, literally -- but it works ;-) prior post: <a href=3D=
"https://metztli.it/blog/index.php/aH0?blog=3D4">https://metztli.it/blog/in=
dex.php/aH0?blog=3D4</a><br><br>Creates Reiser4 4.0.1 kernel module UDEB su=
itable for inclusion into Debian-Installer (d-i); please, note that, as exp=
lained in the referenced blog above,=C2=A0<span style=3D"color:rgb(51,51,51=
);font-family:&#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif;font-size=
:14px;line-height:20px">/usr/share/kernel-wedge/package-list</span><div><sp=
an style=3D"color:rgb(51,51,51);font-family:&#39;Helvetica Neue&#39;,Helvet=
ica,Arial,sans-serif;font-size:14px;line-height:20px">must also be modified=
 in addition to this patch below attached:</span><br><br><br>-- <br>Jose R =
R<br><a href=3D"http://metztli.it">http://metztli.it</a><br>---------------=
---------------------------------------------------------------------------=
---<br>Try at no charge <a href=3D"http://b2evolution.net">http://b2evoluti=
on.net</a> for <a href=3D"http://OpenShift.com">http://OpenShift.com</a> Pa=
aS<br>---------------------------------------------------------------------=
------------------------<br>from our GitHub <a href=3D"http://Nepohualtzint=
zin.com">http://Nepohualtzintzin.com</a> repository. Cloud the easy way!<br=
>--------------------------------------------------------------------------=
-------------------</div></div>

--001a11c2a5f626bed905290d6e08--

--001a11c2a5f626bede05290d6e0a
Content-Type: application/octet-stream; 
	name="0001-Reiser4-support-for-Debian-AMD64-packaging-to-genera.patch"
Content-Disposition: attachment; 
	filename="0001-Reiser4-support-for-Debian-AMD64-packaging-to-genera.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ij9wectb0

RnJvbSBjZWFlOTc4ZjM1NzBhNGMzZmRlMzBjYjQzMTdlMmFkNjdmNjdjMWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIDxqb3NlLnJvZHJpZ3VlekBtZXR6dGxpLWl0LmNv
bT4KRGF0ZTogU3VuLCAyMCBEZWMgMjAxNSAyMjoxNjozNiAtMDgwMApTdWJqZWN0OiBbUEFUQ0hd
IFJlaXNlcjQgc3VwcG9ydCBmb3IgRGViaWFuIEFNRDY0IHBhY2thZ2luZyB0byBnZW5lcmF0ZSBr
ZXJuZWwKIHJlaXNlcjQtbW9kdWxlCgotLS0KIGRlYmlhbi9jb25maWcvYW1kNjQvZGVmaW5lcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkZWJpYW4vaW5zdGFsbGVyL2FtZDY0L21v
ZHVsZXMvYW1kNjQvcmVpc2VyNC1tb2R1bGVzIHwgMSArCiBkZWJpYW4vaW5zdGFsbGVyL2FtZDY0
L3BhY2thZ2UtbGlzdCAgICAgICAgICAgICAgICAgIHwgMyArKysKIGRlYmlhbi9pbnN0YWxsZXIv
bW9kdWxlcy9yZWlzZXI0LW1vZHVsZXMgICAgICAgICAgICAgfCAxICsKIGRlYmlhbi9pbnN0YWxs
ZXIvcGFja2FnZS1saXN0ICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKysrKwogNSBmaWxl
cyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZGViaWFuL2luc3RhbGxlci9hbWQ2NC9tb2R1bGVzL2FtZDY0L3JlaXNlcjQtbW9kdWxl
cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRlYmlhbi9pbnN0YWxsZXIvbW9kdWxlcy9yZWlzZXI0LW1v
ZHVsZXMKCmRpZmYgLS1naXQgYS9kZWJpYW4vY29uZmlnL2FtZDY0L2RlZmluZXMgYi9kZWJpYW4v
Y29uZmlnL2FtZDY0L2RlZmluZXMKaW5kZXggMjI0ZGVmYy4uNTVkYzdkMCAxMDA2NDQKLS0tIGEv
ZGViaWFuL2NvbmZpZy9hbWQ2NC9kZWZpbmVzCisrKyBiL2RlYmlhbi9jb25maWcvYW1kNjQvZGVm
aW5lcwpAQCAtNiw3ICs2LDcgQEAgZmVhdHVyZXNldHM6CiBrZXJuZWwtYXJjaDogeDg2CiAKIFti
dWlsZF0KLWRlYnVnLWluZm86IHRydWUKK2RlYnVnLWluZm86IGZhbHNlIAogaW1hZ2UtZmlsZTog
YXJjaC94ODYvYm9vdC9iekltYWdlCiAKIFtpbWFnZV0KZGlmZiAtLWdpdCBhL2RlYmlhbi9pbnN0
YWxsZXIvYW1kNjQvbW9kdWxlcy9hbWQ2NC9yZWlzZXI0LW1vZHVsZXMgYi9kZWJpYW4vaW5zdGFs
bGVyL2FtZDY0L21vZHVsZXMvYW1kNjQvcmVpc2VyNC1tb2R1bGVzCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAuLjkzNzNlZjEKLS0tIC9kZXYvbnVsbAorKysgYi9kZWJpYW4vaW5z
dGFsbGVyL2FtZDY0L21vZHVsZXMvYW1kNjQvcmVpc2VyNC1tb2R1bGVzCkBAIC0wLDAgKzEgQEAK
KyNpbmNsdWRlIDxyZWlzZXI0LW1vZHVsZXM+CmRpZmYgLS1naXQgYS9kZWJpYW4vaW5zdGFsbGVy
L2FtZDY0L3BhY2thZ2UtbGlzdCBiL2RlYmlhbi9pbnN0YWxsZXIvYW1kNjQvcGFja2FnZS1saXN0
CmluZGV4IDMyMmY4MTYuLjNiZjc3N2QgMTAwNjQ0Ci0tLSBhL2RlYmlhbi9pbnN0YWxsZXIvYW1k
NjQvcGFja2FnZS1saXN0CisrKyBiL2RlYmlhbi9pbnN0YWxsZXIvYW1kNjQvcGFja2FnZS1saXN0
CkBAIC00LDYgKzQsOSBAQAogIyBJdCBvdmVyd3JpdGVzIHNwZWNpZmljYXRpb25zIGZyb20gL3Vz
ci9zaGFyZS9rZXJuZWwtd2VkZ2UvcGFja2FnZS1saXN0LgogIwogCitQYWNrYWdlOiByZWlzZXI0
LW1vZHVsZXMKK1ByaW9yaXR5OiBzdGFuZGFyZAorCiBQYWNrYWdlOiBmYXQtbW9kdWxlcwogUHJp
b3JpdHk6IHN0YW5kYXJkCiAKZGlmZiAtLWdpdCBhL2RlYmlhbi9pbnN0YWxsZXIvbW9kdWxlcy9y
ZWlzZXI0LW1vZHVsZXMgYi9kZWJpYW4vaW5zdGFsbGVyL21vZHVsZXMvcmVpc2VyNC1tb2R1bGVz
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjcwZGRhZTQKLS0tIC9kZXYvbnVs
bAorKysgYi9kZWJpYW4vaW5zdGFsbGVyL21vZHVsZXMvcmVpc2VyNC1tb2R1bGVzCkBAIC0wLDAg
KzEgQEAKK3JlaXNlcjQKZGlmZiAtLWdpdCBhL2RlYmlhbi9pbnN0YWxsZXIvcGFja2FnZS1saXN0
IGIvZGViaWFuL2luc3RhbGxlci9wYWNrYWdlLWxpc3QKaW5kZXggZTc5ODkwYi4uOTcyMTA0MCAx
MDA2NDQKLS0tIGEvZGViaWFuL2luc3RhbGxlci9wYWNrYWdlLWxpc3QKKysrIGIvZGViaWFuL2lu
c3RhbGxlci9wYWNrYWdlLWxpc3QKQEAgLTEzNyw2ICsxMzcsMTIgQEAgUHJpb3JpdHk6IHN0YW5k
YXJkCiBEZXNjcmlwdGlvbjogSkZTIGZpbGVzeXN0ZW0gc3VwcG9ydAogIFRoaXMgcGFja2FnZSBj
b250YWlucyB0aGUgSkZTIGZpbGVzeXN0ZW0gbW9kdWxlIGZvciB0aGUga2VybmVsLgogCitQYWNr
YWdlOiByZWlzZXI0LW1vZHVsZXMKK0RlcGVuZHM6IGtlcm5lbC1pbWFnZSwgY3JjLW1vZHVsZXMK
K1ByaW9yaXR5OiBleHRyYQorRGVzY3JpcHRpb246IFJlaXNlcjQgZmlsZXN5c3RlbSBzdXBwb3J0
CisgVGhpcyBwYWNrYWdlIGNvbnRhaW5zIHRoZSBSZWlzZXI0IGZpbGVzeXN0ZW0gbW9kdWxlIGZv
ciB0aGUga2VybmVsLgorCiBQYWNrYWdlOiBudGZzLW1vZHVsZXMKIERlcGVuZHM6IGtlcm5lbC1p
bWFnZSwgbmxzLWNvcmUtbW9kdWxlcwogUHJpb3JpdHk6IGV4dHJhCi0tIAoyLjYuNAoK
--001a11c2a5f626bede05290d6e0a--

