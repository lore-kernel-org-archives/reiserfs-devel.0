From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Fwd: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Mon, 11 Jan 2016 03:46:58 -0800
Message-ID: <CAM12Q5SP+t1cF0gb_ROLvufhnUgO5_FSR1SNKjG--bikRTPSQg@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
	<CAM12Q5S9ugte1NLTKY68qa=rXD13Kktric+Osfw-rOeXF2uw0Q@mail.gmail.com>
	<CAM12Q5Tj3xgN5izBa0jA8Mn1Mu7-RqRKTmStoNUfmJNtb=EtNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a113ad4c29d0b9e05290d7efe
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=Kv/OAEtyGGVFNVQULl2flMrT4vVkQNaMETLIitvbp8Y=;
        b=kKfGIXNDxD/EHUaB3KxKmL5slu264jYNGLxK87iQjQL5qnAWwZnWRXCfNFqaZHg+Xp
         fyLQX8afwG1ZiZxWh2xhcqZnBzqW4RY/27v7Jx+vMIry99an2KNsbCwhmcBE7oO3Ydas
         vms1BVCu6lawAkZt04WIoWbkVUVBau5KEHVsJeJESGWqbykF6NaglygnzDmF+hKeUdIb
         ddG/IGkVrySlCDKSSq/tsNQ+9avbAAkpTFypVK+LrcN2pDSGOtb0udXPeDLl5YWXGlQx
         aVKMGtBwfl2uO1gJ00R4B+RZhzkMgimOPwgwsE3PSMxSo1f4tDPuHdXFcJW6u3kABwym
         rz4g==
In-Reply-To: <CAM12Q5Tj3xgN5izBa0jA8Mn1Mu7-RqRKTmStoNUfmJNtb=EtNA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

--001a113ad4c29d0b9e05290d7efe
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ----------
From: Jose R R <Jose.r.r@metztli-it.com>
Date: Mon, Jan 11, 2016 at 3:43 AM
Subject: Fwd: Reiser4-enabled Debian Unstable (Sid) netboot iso
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>



---------- Forwarded message ----------
From: Jose R R <Jose.r.r@metztli-it.com>
Date: Mon, Jan 11, 2016 at 3:42 AM
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>,
debian-boot@lists.debian.org, debian-cloud
<debian-cloud@lists.debian.org>


(Bonus) Reiser4 version 4.0.1 -enabled patch for Debian Linux kernel packaging:

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
> http://metztli.it/readOnlyEphemeral/linux-image-4.3.0-1-amd64_4.3.3-5_amd64.tar
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

Based on building a Reiser4 4.0.1 -patched Linux kernel the 'debian
way' (hack, literally -- but it works ;-) prior post:
https://metztli.it/blog/index.php/aH0?blog=4

Creates Reiser4 4.0.1 kernel module UDEB suitable for inclusion into
Debian-Installer (d-i); please, note that, as explained in the
referenced blog above, /usr/share/kernel-wedge/package-list
must also be modified in addition to this patch below attached:


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

--001a113ad4c29d0b9e05290d7efe
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
--001a113ad4c29d0b9e05290d7efe--
