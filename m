From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Mon, 11 Jan 2016 02:28:06 -0800
Message-ID: <CAM12Q5Q8Au=8qFn-GqTq8_KeZCKn6RLGxE5W5Y9MJFdHGpixWw@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=089e01537f50897fe105290c6456
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=kFtaDvZ0nR7MDm6Z9Cdy4yYEZ4Kwqms+A2/TXEmn1F0=;
        b=U2/DPdEmnYg1yVmDwuFV/Ul/lDFA+Z8f6Hr1KEWPBB2uNv+Cyk6DoEertLa/fq5255
         tOi/8vyifsrpzq7bJbg2JQxaZck0e7QH10dfHNJe/Aic0l/4jj83xzwQBF2Eo4WMooHZ
         qRKhlpgM4/zdoIN5Zip0gkEFeKzjBF6szkFj1OaHa1jivDOiDFMB/2s7aE0QuxDKX3Bo
         YeMzYOMmN0rAihYCqNi58x697A8NcvISqN1i/uObwBh6tZJm7ynXLu7kbHuQQcprT3S6
         ZsZbEKIpypUZj1vLxAUL/VwIzupGSp8ren1YS/6ihdf0a+E2TRJEPVLjWOm8boPlSGCw
         cqgQ==
In-Reply-To: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>

--089e01537f50897fe105290c6456
Content-Type: text/plain; charset=UTF-8

(1/3) Reiser4 version 4.0.1 -enabled patches for Debian Installer
components and/or userland utilities:

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

Reiser4 version 4.0.1 -support for Debian.ized GNU Parted -- will
generate DEBs and UDEBs:

Already patched repo:
https://github.com/Metztli/reiser4-debian-parted

OR git clone git://git.debian.org/git/parted/parted.git
and apply patch attached


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

--089e01537f50897fe105290c6456
Content-Type: application/octet-stream; 
	name="0001-Reiser4-support-for-debian-parted-based-on-Bart-Hakv.patch"
Content-Disposition: attachment; 
	filename="0001-Reiser4-support-for-debian-parted-based-on-Bart-Hakv.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ij9trmjk0

RnJvbSBlNTgxZDE5NWU3MTJhYmRjNWYxOGIxNDNhM2EyYzU2NjRkNTQxNDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIDxqb3NlLnJvZHJpZ3VlekBtZXR6dGxpLWl0LmNv
bT4KRGF0ZTogU2F0LCAyNiBEZWMgMjAxNSAxODozMTozMyAtMDgwMApTdWJqZWN0OiBbUEFUQ0hd
IFJlaXNlcjQgc3VwcG9ydCBmb3IgZGViaWFuLXBhcnRlZCBiYXNlZCBvbiBCYXJ0IEhha3Zvb3J0
IDIwMDQKIHdvcmsuCgotLS0KIGRlYmlhbi9saWJwYXJ0ZWQyLnN5bWJvbHMgICAgICB8ICAyICsr
CiBsaWJwYXJ0ZWQvTWFrZWZpbGUuYW0gICAgICAgICAgfCAgMSArCiBsaWJwYXJ0ZWQvZnMvTWFr
ZWZpbGUuYW0gICAgICAgfCAgMyArKwogbGlicGFydGVkL2ZzL3JlaXNlcjQvcmVpc2VyNC5jIHwg
NzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBsaWJwYXJ0ZWQv
bGlicGFydGVkLmMgICAgICAgICAgfCAgNCArKysKIDUgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYnBhcnRlZC9mcy9yZWlzZXI0L3JlaXNlcjQu
YwoKZGlmZiAtLWdpdCBhL2RlYmlhbi9saWJwYXJ0ZWQyLnN5bWJvbHMgYi9kZWJpYW4vbGlicGFy
dGVkMi5zeW1ib2xzCmluZGV4IGE1ZTc2NDMuLmY1YTUzY2IgMTAwNjQ0Ci0tLSBhL2RlYmlhbi9s
aWJwYXJ0ZWQyLnN5bWJvbHMKKysrIGIvZGViaWFuL2xpYnBhcnRlZDIuc3ltYm9scwpAQCAtMTQ2
LDYgKzE0Niw4IEBAIGxpYnBhcnRlZC5zby4yIGxpYnBhcnRlZDIgI01JTlZFUiMKICBwZWRfZmls
ZV9zeXN0ZW1fbnRmc19pbml0QEJhc2UgMy4xCiAgcGVkX2ZpbGVfc3lzdGVtX3Byb2JlQEJhc2Ug
My4xCiAgcGVkX2ZpbGVfc3lzdGVtX3Byb2JlX3NwZWNpZmljQEJhc2UgMy4xCisgcGVkX2ZpbGVf
c3lzdGVtX3JlaXNlcjRfZG9uZUBCYXNlIDMuMi0xMgorIHBlZF9maWxlX3N5c3RlbV9yZWlzZXI0
X2luaXRAQmFzZSAzLjItMTIKICBwZWRfZmlsZV9zeXN0ZW1fcmVpc2VyZnNfZG9uZUBCYXNlIDMu
MQogIHBlZF9maWxlX3N5c3RlbV9yZWlzZXJmc19pbml0QEJhc2UgMy4xCiAgcGVkX2ZpbGVfc3lz
dGVtX3R5cGVfZ2V0QEJhc2UgMy4xCmRpZmYgLS1naXQgYS9saWJwYXJ0ZWQvTWFrZWZpbGUuYW0g
Yi9saWJwYXJ0ZWQvTWFrZWZpbGUuYW0KaW5kZXggYjQxMGU2NC4uMDczNTViZSAxMDA2NDQKLS0t
IGEvbGlicGFydGVkL01ha2VmaWxlLmFtCisrKyBiL2xpYnBhcnRlZC9NYWtlZmlsZS5hbQpAQCAt
Myw2ICszLDcgQEAKICMKICMgVGhpcyBmaWxlIG1heSBiZSBtb2RpZmllZCBhbmQvb3IgZGlzdHJp
YnV0ZWQgd2l0aG91dCByZXN0cmljdGlvbi4KIAorQVVUT01BS0VfT1BUSU9OUyA9IHN1YmRpci1v
YmplY3RzCiBTVUJESVJTX0NIRUNLID0KIGlmIEhBVkVfQ0hFQ0sKIFNVQkRJUlNfQ0hFQ0sgKz0g
dGVzdHMKZGlmZiAtLWdpdCBhL2xpYnBhcnRlZC9mcy9NYWtlZmlsZS5hbSBiL2xpYnBhcnRlZC9m
cy9NYWtlZmlsZS5hbQppbmRleCBkZTYwN2EyLi40Mzk0NmQyIDEwMDY0NAotLS0gYS9saWJwYXJ0
ZWQvZnMvTWFrZWZpbGUuYW0KKysrIGIvbGlicGFydGVkL2ZzL01ha2VmaWxlLmFtCkBAIC0zLDYg
KzMsOCBAQAogIwogIyBUaGlzIGZpbGUgbWF5IGJlIG1vZGlmaWVkIGFuZC9vciBkaXN0cmlidXRl
ZCB3aXRob3V0IHJlc3RyaWN0aW9uLgogCitBVVRPTUFLRV9PUFRJT05TID0gc3ViZGlyLW9iamVj
dHMKKwogcGFydGVkaW5jbHVkZWRpciA9IC1JJCh0b3BfYnVpbGRkaXIpL2luY2x1ZGUgLUkkKHRv
cF9zcmNkaXIpL2luY2x1ZGUKIAogQU1fQ0ZMQUdTID0gJChXQVJOX0NGTEFHUykKQEAgLTQ0LDYg
KzQ2LDcgQEAgbGliZnNfbGFfU09VUkNFUyA9CQlcCiAgIG50ZnMvbnRmcy5jCQkJXAogICByZWlz
ZXJmcy9yZWlzZXJmcy5jCQlcCiAgIHJlaXNlcmZzL3JlaXNlcmZzLmgJCVwKKyAgcmVpc2VyNC9y
ZWlzZXI0LmMJCVwKICAgdWZzL3Vmcy5jCQkJXAogICB4ZnMvcGxhdGZvcm1fZGVmcy5oCQlcCiAg
IHhmcy94ZnMuYwkJCVwKZGlmZiAtLWdpdCBhL2xpYnBhcnRlZC9mcy9yZWlzZXI0L3JlaXNlcjQu
YyBiL2xpYnBhcnRlZC9mcy9yZWlzZXI0L3JlaXNlcjQuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwLi4wYTg2ZTBjCi0tLSAvZGV2L251bGwKKysrIGIvbGlicGFydGVkL2ZzL3Jl
aXNlcjQvcmVpc2VyNC5jCkBAIC0wLDAgKzEsNzEgQEAKKy8qCisgICAgbGlicGFydGVkIC0gYSBs
aWJyYXJ5IGZvciBtYW5pcHVsYXRpbmcgZGlzayBwYXJ0aXRpb25zCisgICAgQ29weXJpZ2h0IChD
KSAyMDAwIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorCisgICAgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
KyAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQorICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhl
ciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgICAgKGF0IHlvdXIgb3B0aW9uKSBhbnkg
bGF0ZXIgdmVyc2lvbi4KKworICAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUg
aG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgICAgTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICAgIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisKKyAgICBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZQorICAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVl
IFNvZnR3YXJlCisgICAgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAz
MzAsIEJvc3RvbiwgTUEgIDAyMTExLTEzMDcgIFVTQQorKi8KKworI2luY2x1ZGUgPGNvbmZpZy5o
PgorCisjaW5jbHVkZSA8cGFydGVkL3BhcnRlZC5oPgorI2luY2x1ZGUgPHBhcnRlZC9lbmRpYW4u
aD4KKworI2lmIEVOQUJMRV9OTFMKKyMgIGluY2x1ZGUgPGxpYmludGwuaD4KKyMgIGRlZmluZSBf
KFN0cmluZykgZGdldHRleHQgKFBBQ0tBR0UsIFN0cmluZykKKyNlbHNlCisjICBkZWZpbmUgXyhT
dHJpbmcpIChTdHJpbmcpCisjZW5kaWYgLyogRU5BQkxFX05MUyAqLworCisjaW5jbHVkZSA8dW5p
c3RkLmg+CisjaW5jbHVkZSA8c3RyaW5nLmg+CisKK3N0YXRpYyBQZWRHZW9tZXRyeSoKK3JlaXNl
cjRfcHJvYmUgKFBlZEdlb21ldHJ5KiBnZW9tKQoreworCWNoYXIJYnVmWzUxMl07CisKKwlpZiAo
IXBlZF9nZW9tZXRyeV9yZWFkIChnZW9tLCBidWYsIDEyOCwgMSkpCisJCXJldHVybiAwOwkKKwkK
KwlpZiAoIHN0cmNtcCggYnVmLCAiUmVJc0VyNCIgKSA9PSAwICkKKwkJcmV0dXJuIHBlZF9nZW9t
ZXRyeV9kdXBsaWNhdGUoIGdlb20gKSA7CisKKwllbHNlCisJCXJldHVybiBOVUxMOworfQorCitz
dGF0aWMgUGVkRmlsZVN5c3RlbU9wcyByZWlzZXI0X29wcyA9IHsKKwlwcm9iZToJCXJlaXNlcjRf
cHJvYmUsCit9OworCitzdGF0aWMgUGVkRmlsZVN5c3RlbVR5cGUgcmVpc2VyNF90eXBlID0gewor
CW5leHQ6CU5VTEwsCisJb3BzOgkmcmVpc2VyNF9vcHMsCisJbmFtZToJInJlaXNlcjQiCit9Owor
Cit2b2lkCitwZWRfZmlsZV9zeXN0ZW1fcmVpc2VyNF9pbml0ICgpCit7CisJcGVkX2ZpbGVfc3lz
dGVtX3R5cGVfcmVnaXN0ZXIgKCZyZWlzZXI0X3R5cGUpOworfQorCit2b2lkCitwZWRfZmlsZV9z
eXN0ZW1fcmVpc2VyNF9kb25lICgpCit7CisJcGVkX2ZpbGVfc3lzdGVtX3R5cGVfdW5yZWdpc3Rl
ciAoJnJlaXNlcjRfdHlwZSk7Cit9CisKZGlmZiAtLWdpdCBhL2xpYnBhcnRlZC9saWJwYXJ0ZWQu
YyBiL2xpYnBhcnRlZC9saWJwYXJ0ZWQuYwppbmRleCBmZTBjN2ZlLi4zNTRmY2Y5IDEwMDY0NAot
LS0gYS9saWJwYXJ0ZWQvbGlicGFydGVkLmMKKysrIGIvbGlicGFydGVkL2xpYnBhcnRlZC5jCkBA
IC0xMDgsNiArMTA4LDcgQEAgZXh0ZXJuIHZvaWQgcGVkX2ZpbGVfc3lzdGVtX2pmc19pbml0ICh2
b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9oZnNfaW5pdCAodm9pZCk7CiBleHRl
cm4gdm9pZCBwZWRfZmlsZV9zeXN0ZW1fZmF0X2luaXQgKHZvaWQpOwogZXh0ZXJuIHZvaWQgcGVk
X2ZpbGVfc3lzdGVtX2V4dDJfaW5pdCAodm9pZCk7CitleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0
ZW1fcmVpc2VyNF9pbml0ICh2b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9uaWxm
czJfaW5pdCAodm9pZCk7CiBleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0ZW1fYnRyZnNfaW5pdCAo
dm9pZCk7CiBleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0ZW1femZzX2luaXQgKHZvaWQpOwpAQCAt
MTI1LDYgKzEyNiw3IEBAIGluaXRfZmlsZV9zeXN0ZW1fdHlwZXMgKCkKIAlwZWRfZmlsZV9zeXN0
ZW1faGZzX2luaXQgKCk7CiAJcGVkX2ZpbGVfc3lzdGVtX2ZhdF9pbml0ICgpOwogCXBlZF9maWxl
X3N5c3RlbV9leHQyX2luaXQgKCk7CisJcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcjRfaW5pdCAoKTsK
IAlwZWRfZmlsZV9zeXN0ZW1fbmlsZnMyX2luaXQgKCk7CiAJcGVkX2ZpbGVfc3lzdGVtX2J0cmZz
X2luaXQgKCk7CiAJcGVkX2ZpbGVfc3lzdGVtX3pmc19pbml0ICgpOwpAQCAtMTg5LDYgKzE5MSw3
IEBAIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9udGZzX2RvbmUgKHZvaWQpOwogZXh0ZXJu
IHZvaWQgcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcmZzX2RvbmUgKHZvaWQpOwogZXh0ZXJuIHZvaWQg
cGVkX2ZpbGVfc3lzdGVtX3Vmc19kb25lICh2b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5
c3RlbV94ZnNfZG9uZSAodm9pZCk7CitleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0ZW1fcmVpc2Vy
NF9kb25lICh2b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9hbWlnYV9kb25lICh2
b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9idHJmc19kb25lICh2b2lkKTsKIGV4
dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV96ZnNfZG9uZSAodm9pZCk7CkBAIC0yMDcsNiArMjEw
LDcgQEAgZG9uZV9maWxlX3N5c3RlbV90eXBlcyAoKQogCXBlZF9maWxlX3N5c3RlbV9yZWlzZXJm
c19kb25lICgpOwogCXBlZF9maWxlX3N5c3RlbV91ZnNfZG9uZSAoKTsKIAlwZWRfZmlsZV9zeXN0
ZW1feGZzX2RvbmUgKCk7CisJcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcjRfZG9uZSAoKTsKIAlwZWRf
ZmlsZV9zeXN0ZW1fYW1pZ2FfZG9uZSAoKTsKIAlwZWRfZmlsZV9zeXN0ZW1fYnRyZnNfZG9uZSAo
KTsKIH0KLS0gCjIuNi40Cgo=
--089e01537f50897fe105290c6456--
