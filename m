From: jose.r.r@metztli.com (Metztli Information Technology)
Subject: Reiser4 / GCC6 for Debian Kernel 4.18.1x Packaging for Sid
Date: Fri,  5 Oct 2018 06:34:16 -0700 (PDT)
Message-ID: <20181005133416.6A5F7269CF2B@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="1022761936-1538746456=:1499"
Return-path: <bounce-debian-kernel=glddk-debian-kernel=m.gmane.org@lists.debian.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1538746768; h=From: Date: Message-Id: To: Subject:
 MIME-Version: Content-Type: Sender;
 bh=zyVJsSF4NyqtzwsIDloieFAH0yUWVeDLLYrDMYgifgw=; b=dMqE/pTRH9b1ZXPEbm81U/DYbv9DVfSIX3R3deBTFUuLjCEfbrInksm8qtM1Jw9ArjrCobwy
 iNXlBWNIS2sK0kOE38XXKZbLXrPDJmkmHweqC1UmPE3gJ9d9bpyRclXEvEdGhlgCF7mjlK39
 wWG9I8Q6BesUorZacXHVQUBBLL4=
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Resent-Message-ID: <t9vvkYms_wJ.A.xSF.322tbB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-kernel/>
List-Post: <mailto:debian-kernel@lists.debian.org>
List-Help: <mailto:debian-kernel-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-kernel-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-kernel-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181005133416.6A5F7269CF2B@huitzilopochtli.metztli-it.com
To: reiserfs-devel@vger.kernel.org, debian-kernel@lists.debian.org

--1022761936-1538746456=:1499
Content-ID: <20181005063416.1499@huitzilopochtli.metztli-it.com>
Content-Type: text/plain

Niltze, all-

Attached please find a reiser4 patch for Debian kernel packaging for linux-4.18.1x source from Sid (Unstable).

The patch enables kernel and modules build for stretch-backports, specifically AMD64 but i386 might work (untested).

Building Reiser4 'the Debian Way', generates DEBs, such as headers, etc., for development;
 procedure also generates UDEBs suitable for Debian-Installer(d-i).

Applying upstream Linux incremental patches, diligently, we can create a slightly higher kernel version than Debian's, i.e.,
by applying patch-4.18.10-11.xz, I am currently running:

uname -a
Linux huitzilopochtli 4.18.0-2+reiser4.0.2-amd64 #1 SMP Debian 4.18.11-1+reiser4.0.2 (2018-10-03) x86_64 GNU/Linux

Further, by applying another delta patch-4.18.11-12.xz, I have just built:

hyperv-daemons_4.18.12-1+reiser4.0.2_amd64.deb
hyperv-daemons-dbgsym_4.18.12-1+reiser4.0.2_amd64.deb
libcpupower1_4.18.12-1+reiser4.0.2_amd64.deb
libcpupower1-dbgsym_4.18.12-1+reiser4.0.2_amd64.deb
libcpupower-dev_4.18.12-1+reiser4.0.2_amd64.deb
liblockdep4.18_4.18.12-1+reiser4.0.2_amd64.deb
liblockdep4.18-dbgsym_4.18.12-1+reiser4.0.2_amd64.deb
liblockdep-dev_4.18.12-1+reiser4.0.2_amd64.deb
linux-compiler-gcc-6-x86_4.18.12-1+reiser4.0.2_amd64.deb
linux-config-4.18_4.18.12-1+reiser4.0.2_amd64.deb
linux-cpupower_4.18.12-1+reiser4.0.2_amd64.deb
linux-cpupower-dbgsym_4.18.12-1+reiser4.0.2_amd64.deb
linux-doc-4.18_4.18.12-1+reiser4.0.2_all.deb
linux-headers-4.18.0-2+reiser4.0.2-all_4.18.12-1+reiser4.0.2_amd64.deb
linux-headers-4.18.0-2+reiser4.0.2-all-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-headers-4.18.0-2+reiser4.0.2-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-headers-4.18.0-2+reiser4.0.2-cloud-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-headers-4.18.0-2+reiser4.0.2-common_4.18.12-1+reiser4.0.2_all.deb
linux-headers-4.18.0-2+reiser4.0.2-common-rt_4.18.12-1+reiser4.0.2_all.deb
linux-headers-4.18.0-2+reiser4.0.2-rt-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-image-4.18.0-2+reiser4.0.2-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-image-4.18.0-2+reiser4.0.2-cloud-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-image-4.18.0-2+reiser4.0.2-rt-amd64_4.18.12-1+reiser4.0.2_amd64.deb
linux-kbuild-4.18_4.18.12-1+reiser4.0.2_amd64.deb
linux-kbuild-4.18-dbgsym_4.18.12-1+reiser4.0.2_amd64.deb
linux-libc-dev_4.18.12-1+reiser4.0.2_amd64.deb
linux-perf-4.18_4.18.12-1+reiser4.0.2_amd64.deb
linux-perf-4.18-dbgsym_4.18.12-1+reiser4.0.2_amd64.deb
linux-source-4.18_4.18.12-1+reiser4.0.2_all.deb
linux-support-4.18.0-2+reiser4.0.2_4.18.12-1+reiser4.0.2_all.deb
lockdep_4.18.12-1+reiser4.0.2_all.deb
usbip_2.0+4.18.12-1+reiser4.0.2_amd64.deb
usbip-dbgsym_2.0+4.18.12-1+reiser4.0.2_amd64.deb

cpi-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
ata-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
btrfs-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
cdrom-core-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
compress-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
crc-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
crypto-dm-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
crypto-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
efi-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
event-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
ext4-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
fat-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
fb-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
firewire-core-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
fuse-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
hyperv-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
i2c-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
input-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
isofs-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
jfs-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
kernel-image-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
loop-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
md-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
mmc-core-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
mmc-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
mouse-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
multipath-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
nbd-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
nic-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
nic-pcmcia-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
nic-shared-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
nic-usb-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
nic-wireless-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
ntfs-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
pata-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
pcmcia-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
pcmcia-storage-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
ppp-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
reiser4-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
sata-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
scsi-core-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
scsi-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
serial-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
sound-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
speakup-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
squashfs-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
udf-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
uinput-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
usb-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
usb-serial-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
usb-storage-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
virtio-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb
xfs-modules-4.18.0-2+reiser4.0.2-amd64-di_4.18.12-1+reiser4.0.2_amd64.udeb

Of course, if you build your own kernel you will probably not have long descriptive strings as mine.

You may also prefer to disble the RT kernel, modify the ABI, and or source signature, etc., etc.

Here is an alternate < link all in a single line > in case the patch does not make it to the list:

< https://metztli.it/nahuifs/reiser4-gcc6-for-debian-kernel-4.18.1x-packaging.patch >


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.17 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

--1022761936-1538746456=:1499
Content-ID: <20181005063416.1499.1@huitzilopochtli.metztli-it.com>
Content-Type: application/octet-stream; name=reiser4-gcc6-for-debian-kernel-4.18.1x-packaging.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=reiser4-gcc6-for-debian-kernel-4.18.1x-packaging.patch

RnJvbSBmODg3YzhjOGYxOTNhYWViZjVkYzBkOWVkMDhiZjg2ZTI2ZmQ4MDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIEluZm9ybWF0aW9uIFRlY2hub2xvZ3kgPGpvc2VA
bWV0enRsaS1pdC5jb20+CkRhdGU6IEZyaSwgNSBPY3QgMjAxOCAwMTo1MToyNiAtMDcwMApTdWJq
ZWN0OiBbUEFUQ0hdIFJlaXNlcjQgLyBHQ0M2IGZvciBEZWJpYW4ga2VybmVsIHBhY2thZ2luZyBm
b3IKIHN0cmV0Y2gtYmFja3BvcnRzCgotLS0KIGRlYmlhbi9jb25maWcvYW1kNjQvZGVmaW5lcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrLS0tCiBkZWJpYW4vY29uZmlnL2FybWVs
L2RlZmluZXMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRlYmlhbi9jb25maWcv
YXJtaGYvZGVmaW5lcyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZGViaWFuL2Nv
bmZpZy9jb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysK
IGRlYmlhbi9jb25maWcvZGVmaW5lcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArKy0tCiBkZWJpYW4vY29uZmlnL2hwcGEvZGVmaW5lcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIGRlYmlhbi9jb25maWcvaTM4Ni9kZWZpbmVzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNyArKysrLS0tCiBkZWJpYW4vY29uZmlnL3MzOTB4L2RlZmluZXMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRlYmlhbi9pbnN0YWxsZXIvYW1kNjQvaWdub3Jl
LWR1cHMgICAgICAgICAgICAgICAgICAgfCAgMAogZGViaWFuL2luc3RhbGxlci9hbWQ2NC9tb2R1
bGVzL2FtZDY0L3JlaXNlcjQtbW9kdWxlcyB8ICAxICsKIGRlYmlhbi9pbnN0YWxsZXIvYW1kNjQv
cGFja2FnZS1saXN0ICAgICAgICAgICAgICAgICAgfCAgMyArKysKIGRlYmlhbi9pbnN0YWxsZXIv
aTM4Ni9pZ25vcmUtZHVwcyAgICAgICAgICAgICAgICAgICAgfCAgMAogZGViaWFuL2luc3RhbGxl
ci9pMzg2L21vZHVsZXMvaTM4Ni9yZWlzZXI0LW1vZHVsZXMgICB8ICAxICsKIGRlYmlhbi9pbnN0
YWxsZXIvaTM4Ni9wYWNrYWdlLWxpc3QgICAgICAgICAgICAgICAgICAgfCAgMyArKysKIGRlYmlh
bi9pbnN0YWxsZXIvbW9kdWxlcy9yZWlzZXI0LW1vZHVsZXMgICAgICAgICAgICAgfCAgMSArCiBk
ZWJpYW4vaW5zdGFsbGVyL3BhY2thZ2UtbGlzdCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcg
KysrKysrKwogZGViaWFuL3RlbXBsYXRlcy9jb250cm9sLmV4dHJhLmluICAgICAgICAgICAgICAg
ICAgICB8IDEyICsrKysrKy0tLS0tLQogMTcgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygr
KSwgMTggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZGViaWFuL2luc3RhbGxlci9h
bWQ2NC9pZ25vcmUtZHVwcwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRlYmlhbi9pbnN0YWxsZXIvYW1k
NjQvbW9kdWxlcy9hbWQ2NC9yZWlzZXI0LW1vZHVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkZWJp
YW4vaW5zdGFsbGVyL2kzODYvaWdub3JlLWR1cHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkZWJpYW4v
aW5zdGFsbGVyL2kzODYvbW9kdWxlcy9pMzg2L3JlaXNlcjQtbW9kdWxlcwogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRlYmlhbi9pbnN0YWxsZXIvbW9kdWxlcy9yZWlzZXI0LW1vZHVsZXMKCmRpZmYgLS1n
aXQgYS9kZWJpYW4vY29uZmlnL2FtZDY0L2RlZmluZXMgYi9kZWJpYW4vY29uZmlnL2FtZDY0L2Rl
ZmluZXMKaW5kZXggMTg2YWNmMzgzLi44NTlmMmFjODcgMTAwNjQ0Ci0tLSBhL2RlYmlhbi9jb25m
aWcvYW1kNjQvZGVmaW5lcworKysgYi9kZWJpYW4vY29uZmlnL2FtZDY0L2RlZmluZXMKQEAgLTUs
OCArNSwxMCBAQCBmZWF0dXJlc2V0czoKIGtlcm5lbC1hcmNoOiB4ODYKIAogW2J1aWxkXQotZGVi
dWctaW5mbzogdHJ1ZQorZGVidWctaW5mbzogZmFsc2UKIGltYWdlLWZpbGU6IGFyY2gveDg2L2Jv
b3QvYnpJbWFnZQorc2lnbmVkLW1vZHVsZXM6IGZhbHNlCitzaWduZWQtY29kZTogZmFsc2UKIHZk
c286IHRydWUKIAogW2ltYWdlXQpAQCAtMTUsOCArMTcsNyBAQCBpbnN0YWxsLXN0ZW06IHZtbGlu
dXoKIGJyZWFrczogeHNlcnZlci14b3JnLWlucHV0LXZtbW91c2UgKDw8IDE6MTMuMC45OSkKIAog
W3JlbGF0aW9uc10KLWdjYy03OiBnY2MtNyAoPj0gNy4yLjAtMjB+KSA8IXN0YWdlMSAhY3Jvc3M+
LCBnY2MtNy14ODYtNjQtbGludXgtZ251ICg+PSA3LjIuMC0yMH4pIDwhc3RhZ2UxIGNyb3NzPgot
aGVhZGVycyVnY2MtNzogbGludXgtY29tcGlsZXItZ2NjLTcteDg2ICg+PSA0LjE0LjE3LTF+KQor
aGVhZGVycyVnY2MtNjogbGludXgtY29tcGlsZXItZ2NjLTYteDg2CiAKIFthbWQ2NF9kZXNjcmlw
dGlvbl0KIGhhcmR3YXJlOiA2NC1iaXQgUENzCmRpZmYgLS1naXQgYS9kZWJpYW4vY29uZmlnL2Fy
bWVsL2RlZmluZXMgYi9kZWJpYW4vY29uZmlnL2FybWVsL2RlZmluZXMKaW5kZXggZmE2MTdmNDZh
Li4wNjkyYzgwZWMgMTAwNjQ0Ci0tLSBhL2RlYmlhbi9jb25maWcvYXJtZWwvZGVmaW5lcworKysg
Yi9kZWJpYW4vY29uZmlnL2FybWVsL2RlZmluZXMKQEAgLTEyLDcgKzEyLDcgQEAgdW5jb21wcmVz
c2VkLWltYWdlLWZpbGU6IGFyY2gvYXJtL2Jvb3QvSW1hZ2UKIGluc3RhbGwtc3RlbTogdm1saW51
egogCiBbcmVsYXRpb25zXQotaGVhZGVycyVnY2MtNzogbGludXgtY29tcGlsZXItZ2NjLTctYXJt
CitoZWFkZXJzJWdjYy02OiBsaW51eC1jb21waWxlci1nY2MtNi1hcm0KIAogW21hcnZlbGxfZGVz
Y3JpcHRpb25dCiBoYXJkd2FyZTogTWFydmVsbCBLaXJrd29vZC9PcmlvbgpkaWZmIC0tZ2l0IGEv
ZGViaWFuL2NvbmZpZy9hcm1oZi9kZWZpbmVzIGIvZGViaWFuL2NvbmZpZy9hcm1oZi9kZWZpbmVz
CmluZGV4IDMwNjk2ZjQ0ZS4uY2VkNGQ4NjgxIDEwMDY0NAotLS0gYS9kZWJpYW4vY29uZmlnL2Fy
bWhmL2RlZmluZXMKKysrIGIvZGViaWFuL2NvbmZpZy9hcm1oZi9kZWZpbmVzCkBAIC0xMiw3ICsx
Miw3IEBAIHZkc286IHRydWUKIGluc3RhbGwtc3RlbTogdm1saW51egogCiBbcmVsYXRpb25zXQot
aGVhZGVycyVnY2MtNzogbGludXgtY29tcGlsZXItZ2NjLTctYXJtCitoZWFkZXJzJWdjYy02OiBs
aW51eC1jb21waWxlci1nY2MtNi1hcm0KIAogW2FybW1wX2Rlc2NyaXB0aW9uXQogaGFyZHdhcmU6
IEFSTXY3IG11bHRpcGxhdGZvcm0gY29tcGF0aWJsZSBTb0NzCmRpZmYgLS1naXQgYS9kZWJpYW4v
Y29uZmlnL2NvbmZpZyBiL2RlYmlhbi9jb25maWcvY29uZmlnCmluZGV4IGRkMDhhNDU0Yi4uMGZm
ZTM1ZmQ0IDEwMDY0NAotLS0gYS9kZWJpYW4vY29uZmlnL2NvbmZpZworKysgYi9kZWJpYW4vY29u
ZmlnL2NvbmZpZwpAQCAtNTM4Miw2ICs1MzgyLDEzIEBAIENPTkZJR19CSU5GTVRfU0NSSVBUPXkK
IENPTkZJR19CSU5GTVRfTUlTQz1tCiBDT05GSUdfQ09SRURVTVA9eQogCisjIworIyMgSm9zZS9N
ZXR6dGxpIElUIDA5LTI2LTIwMTgKKyMjIGZpbGU6IGZzL3JlaXNlcjQvS2NvbmZpZworIyMKK0NP
TkZJR19SRUlTRVI0X0ZTPW0KKyMgQ09ORklHX1JFSVNFUjRfREVCVUcgaXMgbm90IHNldAorCiAj
IwogIyMgZmlsZTogZnMvYnRyZnMvS2NvbmZpZwogIyMKZGlmZiAtLWdpdCBhL2RlYmlhbi9jb25m
aWcvZGVmaW5lcyBiL2RlYmlhbi9jb25maWcvZGVmaW5lcwppbmRleCAyMTNiMzg3MDUuLjc1NTVi
NWVhNiAxMDA2NDQKLS0tIGEvZGViaWFuL2NvbmZpZy9kZWZpbmVzCisrKyBiL2RlYmlhbi9jb25m
aWcvZGVmaW5lcwpAQCAtMTExLDcgKzExMSw3IEBAIGFyY2hlczoKICBzcGFyYwogIHNwYXJjNjQK
ICB4MzIKLWNvbXBpbGVyOiBnY2MtNworY29tcGlsZXI6IGdjYy02CiBmZWF0dXJlc2V0czoKICBu
b25lCiAgcnQKQEAgLTEzNCw3ICsxMzQsNyBAQCByZWNvbW1lbmRzOiBhcHBhcm1vcgogCiBbcmVs
YXRpb25zXQogIyBjb21waWxlcnMKLWdjYy03OiBnY2MtNyA8IXN0YWdlMSAhY3Jvc3M+LCBnY2Mt
Ny1AZ251LXR5cGUtcGFja2FnZUAgPCFzdGFnZTEgY3Jvc3M+CitnY2MtNjogZ2NjLTYgPCFzdGFn
ZTEgIWNyb3NzPiwgZ2NjLTYtQGdudS10eXBlLXBhY2thZ2VAIDwhc3RhZ2UxIGNyb3NzPgogCiAj
IGluaXRyYW1mcy1nZW5lcmF0b3JzCiBpbml0cmFtZnMtZmFsbGJhY2s6IGxpbnV4LWluaXRyYW1m
cy10b29sCmRpZmYgLS1naXQgYS9kZWJpYW4vY29uZmlnL2hwcGEvZGVmaW5lcyBiL2RlYmlhbi9j
b25maWcvaHBwYS9kZWZpbmVzCmluZGV4IGRjOGQwYTg4Ni4uNTMzZTAwNWVmIDEwMDY0NAotLS0g
YS9kZWJpYW4vY29uZmlnL2hwcGEvZGVmaW5lcworKysgYi9kZWJpYW4vY29uZmlnL2hwcGEvZGVm
aW5lcwpAQCAtMjgsNSArMjgsNSBAQCBoYXJkd2FyZTogbXVsdGlwcm9jZXNzb3IgNjQtYml0IFBB
LVJJU0MKIGhhcmR3YXJlLWxvbmc6IEhQIFBBLVJJU0MgNjQtYml0IFNNUCBzeXN0ZW1zIHdpdGgg
c3VwcG9ydCBmb3IgbW9yZSB0aGFuIDQgR0IgUkFNCiAKIFtyZWxhdGlvbnNdCi1nY2MtNzogZ2Nj
LTcgPCFzdGFnZTEgIWNyb3NzPiwgYmludXRpbHMtaHBwYTY0LWxpbnV4LWdudSA8IXN0YWdlMSAh
Y3Jvc3M+LCBnY2MtNy1ocHBhNjQtbGludXgtZ251IDwhc3RhZ2UxICFjcm9zcz4sIGdjYy03LWhw
cGEtbGludXgtZ251IDwhc3RhZ2UxIGNyb3NzPiwgYmludXRpbHMtaHBwYTY0LWxpbnV4LWdudSA8
IXN0YWdlMSBjcm9zcz4sIGdjYy03LWhwcGE2NC1saW51eC1nbnUgPCFzdGFnZTEgY3Jvc3M+Citn
Y2MtNjogZ2NjLTYgPCFzdGFnZTEgIWNyb3NzPiwgYmludXRpbHMtaHBwYTY0LWxpbnV4LWdudSA8
IXN0YWdlMSAhY3Jvc3M+LCBnY2MtNi1ocHBhNjQtbGludXgtZ251IDwhc3RhZ2UxICFjcm9zcz4s
IGdjYy02LWhwcGEtbGludXgtZ251IDwhc3RhZ2UxIGNyb3NzPiwgYmludXRpbHMtaHBwYTY0LWxp
bnV4LWdudSA8IXN0YWdlMSBjcm9zcz4sIGdjYy02LWhwcGE2NC1saW51eC1nbnUgPCFzdGFnZTEg
Y3Jvc3M+CiAKZGlmZiAtLWdpdCBhL2RlYmlhbi9jb25maWcvaTM4Ni9kZWZpbmVzIGIvZGViaWFu
L2NvbmZpZy9pMzg2L2RlZmluZXMKaW5kZXggZTRiMzhmNmU3Li5iMWU1ODU4YWQgMTAwNjQ0Ci0t
LSBhL2RlYmlhbi9jb25maWcvaTM4Ni9kZWZpbmVzCisrKyBiL2RlYmlhbi9jb25maWcvaTM4Ni9k
ZWZpbmVzCkBAIC02LDYgKzYsOCBAQCBrZXJuZWwtYXJjaDogeDg2CiAKIFtidWlsZF0KIGltYWdl
LWZpbGU6IGFyY2gveDg2L2Jvb3QvYnpJbWFnZQorc2lnbmVkLW1vZHVsZXM6IGZhbHNlCitzaWdu
ZWQtY29kZTogZmFsc2UKIHZkc286IHRydWUKIAogW2Rlc2NyaXB0aW9uXQpAQCAtMjAsMTUgKzIy
LDE0IEBAIGluc3RhbGwtc3RlbTogdm1saW51egogYnJlYWtzOiB4c2VydmVyLXhvcmctaW5wdXQt
dm1tb3VzZSAoPDwgMToxMy4wLjk5KQogCiBbcmVsYXRpb25zXQotZ2NjLTc6IGdjYy03ICg+PSA3
LjIuMC0yMH4pIDwhc3RhZ2UxICFjcm9zcz4sIGdjYy03LWk2ODYtbGludXgtZ251ICg+PSA3LjIu
MC0yMH4pIDwhc3RhZ2UxIGNyb3NzPgotaGVhZGVycyVnY2MtNzogbGludXgtY29tcGlsZXItZ2Nj
LTcteDg2ICg+PSA0LjE0LjE3LTF+KQoraGVhZGVycyVnY2MtNjogbGludXgtY29tcGlsZXItZ2Nj
LTYteDg2CiAKIFs2ODZfZGVzY3JpcHRpb25dCiBoYXJkd2FyZTogb2xkZXIgUENzCiBoYXJkd2Fy
ZS1sb25nOiBQQ3Mgd2l0aCBvbmUgb3IgbW9yZSBwcm9jZXNzb3JzIG5vdCBzdXBwb3J0aW5nIFBB
RQogCiBbNjg2LXBhZV9idWlsZF0KLWRlYnVnLWluZm86IHRydWUKK2RlYnVnLWluZm86IGZhbHNl
CiAKIFs2ODYtcGFlX2Rlc2NyaXB0aW9uXQogaGFyZHdhcmU6IG1vZGVybiBQQ3MKZGlmZiAtLWdp
dCBhL2RlYmlhbi9jb25maWcvczM5MHgvZGVmaW5lcyBiL2RlYmlhbi9jb25maWcvczM5MHgvZGVm
aW5lcwppbmRleCA0N2RlNjI0MDIuLjhkY2Y5ZmRlMSAxMDA2NDQKLS0tIGEvZGViaWFuL2NvbmZp
Zy9zMzkweC9kZWZpbmVzCisrKyBiL2RlYmlhbi9jb25maWcvczM5MHgvZGVmaW5lcwpAQCAtMTIs
NyArMTIsNyBAQCBib290bG9hZGVyczogczM5MC10b29scwogaW5zdGFsbC1zdGVtOiB2bWxpbnV6
CiAKIFtyZWxhdGlvbnNdCi1oZWFkZXJzJWdjYy03OiBsaW51eC1jb21waWxlci1nY2MtNy1zMzkw
CitoZWFkZXJzJWdjYy02OiBsaW51eC1jb21waWxlci1nY2MtNi1zMzkwCiAKIFtzMzkweF9idWls
ZF0KIGRlYnVnLWluZm86IHRydWUKZGlmZiAtLWdpdCBhL2RlYmlhbi9pbnN0YWxsZXIvYW1kNjQv
aWdub3JlLWR1cHMgYi9kZWJpYW4vaW5zdGFsbGVyL2FtZDY0L2lnbm9yZS1kdXBzCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uZTY5ZGUyOWJiCmRpZmYgLS1naXQgYS9kZWJp
YW4vaW5zdGFsbGVyL2FtZDY0L21vZHVsZXMvYW1kNjQvcmVpc2VyNC1tb2R1bGVzIGIvZGViaWFu
L2luc3RhbGxlci9hbWQ2NC9tb2R1bGVzL2FtZDY0L3JlaXNlcjQtbW9kdWxlcwpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjkzNzNlZjEyZgotLS0gL2Rldi9udWxsCisrKyBi
L2RlYmlhbi9pbnN0YWxsZXIvYW1kNjQvbW9kdWxlcy9hbWQ2NC9yZWlzZXI0LW1vZHVsZXMKQEAg
LTAsMCArMSBAQAorI2luY2x1ZGUgPHJlaXNlcjQtbW9kdWxlcz4KZGlmZiAtLWdpdCBhL2RlYmlh
bi9pbnN0YWxsZXIvYW1kNjQvcGFja2FnZS1saXN0IGIvZGViaWFuL2luc3RhbGxlci9hbWQ2NC9w
YWNrYWdlLWxpc3QKaW5kZXggZTU1YTcxMDMxLi5lYzlkYmIzYzMgMTAwNjQ0Ci0tLSBhL2RlYmlh
bi9pbnN0YWxsZXIvYW1kNjQvcGFja2FnZS1saXN0CisrKyBiL2RlYmlhbi9pbnN0YWxsZXIvYW1k
NjQvcGFja2FnZS1saXN0CkBAIC0zLDYgKzMsOSBAQAogIyBhcmNoaXRlY3R1cmUsIHdoaWNoIGlz
IGRlcml2ZWQgZnJvbSB0aGUgZmlsZXMgaW4gdGhlIG1vZHVsZXMgZGlyZWN0b3J5LgogIyBJdCBv
dmVyd3JpdGVzIHNwZWNpZmljYXRpb25zIGZyb20gL3Vzci9zaGFyZS9rZXJuZWwtd2VkZ2UvcGFj
a2FnZS1saXN0LgogIworI0pvc2UvTWV0enRsaSBJVCAxMC0xNi0yMDE3IHJlaXNlcjQgc3VwcG9y
dAorUGFja2FnZTogcmVpc2VyNC1tb2R1bGVzCitQcmlvcml0eTogc3RhbmRhcmQKIAogUGFja2Fn
ZTogZmF0LW1vZHVsZXMKIFByaW9yaXR5OiBzdGFuZGFyZApkaWZmIC0tZ2l0IGEvZGViaWFuL2lu
c3RhbGxlci9pMzg2L2lnbm9yZS1kdXBzIGIvZGViaWFuL2luc3RhbGxlci9pMzg2L2lnbm9yZS1k
dXBzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uZTY5ZGUyOWJiCmRpZmYg
LS1naXQgYS9kZWJpYW4vaW5zdGFsbGVyL2kzODYvbW9kdWxlcy9pMzg2L3JlaXNlcjQtbW9kdWxl
cyBiL2RlYmlhbi9pbnN0YWxsZXIvaTM4Ni9tb2R1bGVzL2kzODYvcmVpc2VyNC1tb2R1bGVzCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uOTM3M2VmMTJmCi0tLSAvZGV2L251
bGwKKysrIGIvZGViaWFuL2luc3RhbGxlci9pMzg2L21vZHVsZXMvaTM4Ni9yZWlzZXI0LW1vZHVs
ZXMKQEAgLTAsMCArMSBAQAorI2luY2x1ZGUgPHJlaXNlcjQtbW9kdWxlcz4KZGlmZiAtLWdpdCBh
L2RlYmlhbi9pbnN0YWxsZXIvaTM4Ni9wYWNrYWdlLWxpc3QgYi9kZWJpYW4vaW5zdGFsbGVyL2kz
ODYvcGFja2FnZS1saXN0CmluZGV4IGI5MmQ2OTU5NS4uM2RiM2JmODI0IDEwMDY0NAotLS0gYS9k
ZWJpYW4vaW5zdGFsbGVyL2kzODYvcGFja2FnZS1saXN0CisrKyBiL2RlYmlhbi9pbnN0YWxsZXIv
aTM4Ni9wYWNrYWdlLWxpc3QKQEAgLTMsNiArMyw5IEBACiAjIGFyY2hpdGVjdHVyZSwgd2hpY2gg
aXMgZGVyaXZlZCBmcm9tIHRoZSBmaWxlcyBpbiB0aGUgbW9kdWxlcyBkaXJlY3RvcnkuCiAjIEl0
IG92ZXJ3cml0ZXMgc3BlY2lmaWNhdGlvbnMgZnJvbSAvdXNyL3NoYXJlL2tlcm5lbC13ZWRnZS9w
YWNrYWdlLWxpc3QuCiAjCisjSm9zZS9NZXR6dGxpIElUIDEwLTE2LTIwMTcgcmVpc2VyNCBzdXBw
b3J0CitQYWNrYWdlOiByZWlzZXI0LW1vZHVsZXMKK1ByaW9yaXR5OiBzdGFuZGFyZAogCiBQYWNr
YWdlOiBrZXJuZWwtaW1hZ2UKIFByb3ZpZGVzOiBydGMtbW9kdWxlcywgemxpYi1tb2R1bGVzCmRp
ZmYgLS1naXQgYS9kZWJpYW4vaW5zdGFsbGVyL21vZHVsZXMvcmVpc2VyNC1tb2R1bGVzIGIvZGVi
aWFuL2luc3RhbGxlci9tb2R1bGVzL3JlaXNlcjQtbW9kdWxlcwpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAuLjcwZGRhZTQzMQotLS0gL2Rldi9udWxsCisrKyBiL2RlYmlhbi9p
bnN0YWxsZXIvbW9kdWxlcy9yZWlzZXI0LW1vZHVsZXMKQEAgLTAsMCArMSBAQAorcmVpc2VyNApk
aWZmIC0tZ2l0IGEvZGViaWFuL2luc3RhbGxlci9wYWNrYWdlLWxpc3QgYi9kZWJpYW4vaW5zdGFs
bGVyL3BhY2thZ2UtbGlzdAppbmRleCA4ZmI2YTMxNTguLmFjYjdkY2U2MiAxMDA2NDQKLS0tIGEv
ZGViaWFuL2luc3RhbGxlci9wYWNrYWdlLWxpc3QKKysrIGIvZGViaWFuL2luc3RhbGxlci9wYWNr
YWdlLWxpc3QKQEAgLTEyMyw2ICsxMjMsMTMgQEAgUHJpb3JpdHk6IHN0YW5kYXJkCiBEZXNjcmlw
dGlvbjogSkZTIGZpbGVzeXN0ZW0gc3VwcG9ydAogIFRoaXMgcGFja2FnZSBjb250YWlucyB0aGUg
SkZTIGZpbGVzeXN0ZW0gbW9kdWxlIGZvciB0aGUga2VybmVsLgogCisjIEpvc2UvTWV0enRsaSBJ
VCAwNi0yNy0yMDE4IGFkZGVkIHpsaWItbW9kdWxlcyBhbmQgY29tcHJlc3MtbW9kdWxlcyBkZXBl
bmRlbmN5CitQYWNrYWdlOiByZWlzZXI0LW1vZHVsZXMKK0RlcGVuZHM6IGtlcm5lbC1pbWFnZSwg
Y3JjLW1vZHVsZXMsIHpsaWItbW9kdWxlcywgY29tcHJlc3MtbW9kdWxlcworUHJpb3JpdHk6IGV4
dHJhCitEZXNjcmlwdGlvbjogUmVpc2VyNCBmaWxlc3lzdGVtIHN1cHBvcnQKKyBUaGlzIHBhY2th
Z2UgY29udGFpbnMgdGhlIFJlaXNlcjQgZmlsZXN5c3RlbSBtb2R1bGUgZm9yIHRoZSBrZXJuZWwu
CisKIFBhY2thZ2U6IG50ZnMtbW9kdWxlcwogRGVwZW5kczoga2VybmVsLWltYWdlCiBQcmlvcml0
eTogb3B0aW9uYWwKZGlmZiAtLWdpdCBhL2RlYmlhbi90ZW1wbGF0ZXMvY29udHJvbC5leHRyYS5p
biBiL2RlYmlhbi90ZW1wbGF0ZXMvY29udHJvbC5leHRyYS5pbgppbmRleCBjZjY4MjMzZGUuLjRi
YWZmN2Q4ZCAxMDA2NDQKLS0tIGEvZGViaWFuL3RlbXBsYXRlcy9jb250cm9sLmV4dHJhLmluCisr
KyBiL2RlYmlhbi90ZW1wbGF0ZXMvY29udHJvbC5leHRyYS5pbgpAQCAtMSwyNCArMSwyNCBAQAot
UGFja2FnZTogbGludXgtY29tcGlsZXItZ2NjLTctYXJtCitQYWNrYWdlOiBsaW51eC1jb21waWxl
ci1nY2MtNi1hcm0KIEJ1aWxkLVByb2ZpbGVzOiA8IXN0YWdlMT4KLURlcGVuZHM6IGdjYy03LCAk
e21pc2M6RGVwZW5kc30KK0RlcGVuZHM6IGdjYy02LCAke21pc2M6RGVwZW5kc30KIEFyY2hpdGVj
dHVyZTogYXJtZWwgYXJtaGYKIE11bHRpLUFyY2g6IGZvcmVpZ24KIERlc2NyaXB0aW9uOiBDb21w
aWxlciBmb3IgTGludXggb24gQVJNIChtZXRhLXBhY2thZ2UpCiAgVGhpcyBwYWNrYWdlIGRlcGVu
ZHMgb24gR0NDIG9mIHRoZSBhcHByb3ByaWF0ZSB2ZXJzaW9uIGFuZCBhcmNoaXRlY3R1cmUKICBm
b3IgTGludXggb24gYXJtZWwgYW5kIGFybWhmLgogCi1QYWNrYWdlOiBsaW51eC1jb21waWxlci1n
Y2MtNy1zMzkwCitQYWNrYWdlOiBsaW51eC1jb21waWxlci1nY2MtNi1zMzkwCiBCdWlsZC1Qcm9m
aWxlczogPCFzdGFnZTE+Ci1EZXBlbmRzOiBnY2MtNywgJHttaXNjOkRlcGVuZHN9CitEZXBlbmRz
OiBnY2MtNiwgJHttaXNjOkRlcGVuZHN9CiBBcmNoaXRlY3R1cmU6IHMzOTAgczM5MHgKIE11bHRp
LUFyY2g6IGZvcmVpZ24KIERlc2NyaXB0aW9uOiBDb21waWxlciBmb3IgTGludXggb24gSUJNIHpT
ZXJpZXMgKG1ldGEtcGFja2FnZSkKICBUaGlzIHBhY2thZ2UgZGVwZW5kcyBvbiBHQ0Mgb2YgdGhl
IGFwcHJvcHJpYXRlIHZlcnNpb24gYW5kIGFyY2hpdGVjdHVyZQogIGZvciBMaW51eCBvbiBzMzkw
IGFuZCBzMzkweC4KIAotUGFja2FnZTogbGludXgtY29tcGlsZXItZ2NjLTcteDg2CitQYWNrYWdl
OiBsaW51eC1jb21waWxlci1nY2MtNi14ODYKIEJ1aWxkLVByb2ZpbGVzOiA8IXN0YWdlMT4KLURl
cGVuZHM6IGdjYy03ICg+PSA3LjIuMC0yMH4pLCAke21pc2M6RGVwZW5kc30KK0RlcGVuZHM6IGdj
Yy02LCAke21pc2M6RGVwZW5kc30KIEFyY2hpdGVjdHVyZTogYW1kNjQgaTM4NiB4MzIKIE11bHRp
LUFyY2g6IGZvcmVpZ24KIERlc2NyaXB0aW9uOiBDb21waWxlciBmb3IgTGludXggb24geDg2ICht
ZXRhLXBhY2thZ2UpCi0tIAoyLjE5LjAKCg==
--1022761936-1538746456=:1499--

