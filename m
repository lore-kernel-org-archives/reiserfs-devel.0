From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Mon, 11 Jan 2016 02:52:16 -0800
Message-ID: <CAM12Q5RuC-DTFLK+XO=voddM6GRXzCw4ci9OOShDFSfJVGx+aw@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=047d7b3a8680f583d905290cbab0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=R9GMtC7R8McubEqrNNnWV+UGXHB9ilmgfHpLvF4Iu3E=;
        b=kB7evDNqhtaPLw2Z1sxiTOXvbTOtlWVQZtWlckBVsCIjUxTXCrQwr2aXVtyEhFfWhC
         18nO5Q0D6AZe2YQBiSJYk1aH0ZZqYtHZUu7iQANnPcDa3CHFlBa8N3zr6Ok+3yftddQ1
         1MEKhkr8DCogcCeDo4BgeZv+7pa+/NGsvTUsx3LQ3xFktsnp7oAvDFJWTU55x6gqIgaN
         GGp8svrfTnitYlPj6AkOg6plq/y7ry3IsY521JiCaZTvUAYTCpTTBWm75DWf4GUbtaGF
         EDJhFVx76SimX87Zhjt/P82LL78/vGCJjq9DWn/JKQrjYN83oSN4L9pprWNRajz9CMXW
         l15w==
In-Reply-To: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>

--047d7b3a8680f583d905290cbab0
Content-Type: text/plain; charset=UTF-8

(3/3) Reiser4 version 4.0.1 -enabled patches for Debian Installer
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
>
>
> P.S I am already preparing some images for Google Compute Engine (GCE)
> < https://cloud.google.com/compute/ > to add to currently testing
> Reiser4 images created last year.
> --

Reiser4 4.0.1 -enabled Reiser4progs utilities to manage Reiser4 4.0.1
derived creation, formatting, and partitioning. In addition to
generating the desired userland utilities for Debian (which are
already in Stretch & Sid debian repos), it creates UDEBs suitable for
inclusion in a Reiser4 4.0.1 -enabled Debian-Installer (d-i)

Patch inclueded in repo:
https://github.com/Metztli/debian-installer-reiser4progs

and attached patch below:

Best Professional Regards

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

--047d7b3a8680f583d905290cbab0
Content-Type: application/octet-stream; 
	name="0001-Added-reiser4progs-support-to-generate-UDEBs-for-Deb.patch"
Content-Disposition: attachment; 
	filename="0001-Added-reiser4progs-support-to-generate-UDEBs-for-Deb.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ij9umnic0

RnJvbSAzNDc4YzI1NDUyNzdmNWY1NGQ2MDJhMDUxMzkwMjA2YzgyNjQzNmVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIDxqb3NlLnJvZHJpZ3VlekBtZXR6dGxpLWl0LmNv
bT4KRGF0ZTogU3VuLCAyNyBEZWMgMjAxNSAyMDoxODoxNSAtMDgwMApTdWJqZWN0OiBbUEFUQ0hd
IEFkZGVkIHJlaXNlcjRwcm9ncyBzdXBwb3J0IHRvIGdlbmVyYXRlIFVERUJzIGZvcgogRGViaWFu
LUluc3RhbGxlcgoKLS0tCiBSRUFETUUubWQgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysr
KysKIGJ1aWxkL3JlaXNlcjRwcm9ncy9ydW4tbGRjb25maWcgfCAgMSArCiBidWlsZC91ZGVicy9y
dW4tbGRjb25maWcgICAgICAgIHwgIDEgKwogZGViaWFuL2NvbnRyb2wgICAgICAgICAgICAgICAg
ICB8IDE3ICsrKysrKysrKysrKysrKwogZGViaWFuL3J1bGVzICAgICAgICAgICAgICAgICAgICB8
IDQ4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNo
YW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IFJFQURNRS5tZAogY3JlYXRlIG1vZGUgMTIwMDAwIGJ1aWxkL3JlaXNlcjRwcm9ncy9ydW4t
bGRjb25maWcKIGNyZWF0ZSBtb2RlIDEyMDAwMCBidWlsZC91ZGVicy9ydW4tbGRjb25maWcKCmRp
ZmYgLS1naXQgYS9SRUFETUUubWQgYi9SRUFETUUubWQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMC4uMmU4YTJjZAotLS0gL2Rldi9udWxsCisrKyBiL1JFQURNRS5tZApAQCAtMCww
ICsxLDUgQEAKKyMgZGViaWFuLWluc3RhbGxlci1yZWlzZXI0cHJvZ3MKKworQ29tcG9uZW50IHNl
dCB3aWxsIGNyZWF0ZSBVREVCcyBzdWl0YWJsZSBmb3IgaW5jbHVzaW9uIGludG8gdGhlIERlYmlh
bi1JbnN0YWxsZXIgKGQtaSkKK2ZvciBhIHN1Y2Nlc3NmdWwgRGViaWFuIHBhcnRpdGlvbmluZywg
Zm9ybWF0dGluZywgYW5kIGluc3RhbGxhdGlvbiBvbnRvIFJlaXNlcjQgZmlsZXN5c3RlbS4KK0Fk
ZGl0aW9uYWxseSwgb2YgY291cnNlLCB3aWxsIGFsc28gZ2VuZXJhdGUgdXBzdHJlYW0gbWFpbnRh
aW5lcidzIHVzZXJsYW5kIERFQiBwYWNrYWdlcy4KZGlmZiAtLWdpdCBhL2J1aWxkL3JlaXNlcjRw
cm9ncy9ydW4tbGRjb25maWcgYi9idWlsZC9yZWlzZXI0cHJvZ3MvcnVuLWxkY29uZmlnCm5ldyBm
aWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAuLjI2NTc0NzUKLS0tIC9kZXYvbnVsbAorKysg
Yi9idWlsZC9yZWlzZXI0cHJvZ3MvcnVuLWxkY29uZmlnCkBAIC0wLDAgKzEgQEAKKy4uLy4uL3J1
bi1sZGNvbmZpZwpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2J1aWxk
L3VkZWJzL3J1bi1sZGNvbmZpZyBiL2J1aWxkL3VkZWJzL3J1bi1sZGNvbmZpZwpuZXcgZmlsZSBt
b2RlIDEyMDAwMAppbmRleCAwMDAwMDAwLi4yNjU3NDc1Ci0tLSAvZGV2L251bGwKKysrIGIvYnVp
bGQvdWRlYnMvcnVuLWxkY29uZmlnCkBAIC0wLDAgKzEgQEAKKy4uLy4uL3J1bi1sZGNvbmZpZwpc
IE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2RlYmlhbi9jb250cm9sIGIv
ZGViaWFuL2NvbnRyb2wKaW5kZXggMTUxYTNkYS4uNWFiZTNiNiAxMDA2NDQKLS0tIGEvZGViaWFu
L2NvbnRyb2wKKysrIGIvZGViaWFuL2NvbnRyb2wKQEAgLTE3LDYgKzE3LDIzIEBAIERlc2NyaXB0
aW9uOiBhZG1pbmlzdHJhdGlvbiB1dGlsaXRpZXMgZm9yIHRoZSBSZWlzZXI0IGZpbGVzeXN0ZW0K
ICAgIC0gbWVhc3VyZWZzLnJlaXNlcjQKICAgIC0gbWtmcy5yZWlzZXI0CiAKK1BhY2thZ2U6IHJl
aXNlcjRwcm9ncy11ZGViCitYQy1QYWNrYWdlLVR5cGU6IHVkZWIKK1NlY3Rpb246IGRlYmlhbi1p
bnN0YWxsZXIKK0FyY2hpdGVjdHVyZTogYW55CitEZXBlbmRzOiAke3NobGliczpEZXBlbmRzfQor
RGVzY3JpcHRpb246IHVzZXItbGV2ZWwgdG9vbHMgdG8gbWFuYWdlIFJlaXNlcjQgZmlsZXN5c3Rl
bXMKKyBUaGlzIGluc3RhbGxlciBtb2R1bGUgY29udGFpbnMgdXRpbGl0aWVzIHRvIGNoZWNrLCBy
ZXNpemUsIGFuZCBkZWJ1ZyAKKyBSZWlzZXI0IGZpbGVzeXN0ZW1zLiAKKworUGFja2FnZTogbWty
ZWlzZXI0LXVkZWIKK1hDLVBhY2thZ2UtVHlwZTogdWRlYgorU2VjdGlvbjogZGViaWFuLWluc3Rh
bGxlcgorQXJjaGl0ZWN0dXJlOiBhbnkKK0RlcGVuZHM6ICR7c2hsaWJzOkRlcGVuZHN9CitEZXNj
cmlwdGlvbjogdXNlci1sZXZlbCB0b29sIHRvIG1ha2UgUmVpc2VyNCBmaWxlc3lzdGVtcworIFRo
aXMgaW5zdGFsbGVyIG1vZHVsZSBjb250YWlucyB0aGUgdXRpbGl0eSB0byBjcmVhdGUgUmVpc2Vy
NCBmaWxlc3lzdGVtcy4KKwogUGFja2FnZTogbGlicmVpc2VyNC1kZXYKIFNlY3Rpb246IGxpYmRl
dmVsCiBQcmlvcml0eTogZXh0cmEKZGlmZiAtLWdpdCBhL2RlYmlhbi9ydWxlcyBiL2RlYmlhbi9y
dWxlcwppbmRleCA2N2ZmMWIwLi41NTFiMTcyIDEwMDc1NQotLS0gYS9kZWJpYW4vcnVsZXMKKysr
IGIvZGViaWFuL3J1bGVzCkBAIC00NSwyMSArNDUsMjEgQEAgY29uZmlndXJlLXJlaXNlcjRwcm9n
cy1zdGFtcDoKIAljZCAkKENVUkRJUikvYnVpbGQvcmVpc2VyNHByb2dzICYmICQoQ09ORklHVVJF
KSAtLXdpdGgtcmVhZGxpbmUKIAl0b3VjaCAkQAogCi0jY29uZmlndXJlL21rcmVpc2VyNC11ZGVi
IGNvbmZpZ3VyZS9yZWlzZXI0cHJvZ3MtdWRlYjo6IGNvbmZpZ3VyZS11ZGVicy1zdGFtcAotI2Nv
bmZpZ3VyZS11ZGVicy1zdGFtcDo6Ci0jCW1rZGlyIC1wICQoQ1VSRElSKS9idWlsZC91ZGVicwot
IwljZCAkKENVUkRJUikvYnVpbGQvdWRlYnMgJiYgJChDT05GSUdVUkUpIC0td2l0aC1yZWFkbGlu
ZT1ubyAKLSMJdG91Y2ggJEAKK2NvbmZpZ3VyZS9ta3JlaXNlcjQtdWRlYiBjb25maWd1cmUvcmVp
c2VyNHByb2dzLXVkZWI6OiBjb25maWd1cmUtdWRlYnMtc3RhbXAKK2NvbmZpZ3VyZS11ZGVicy1z
dGFtcDo6CisJbWtkaXIgLXAgJChDVVJESVIpL2J1aWxkL3VkZWJzCisJY2QgJChDVVJESVIpL2J1
aWxkL3VkZWJzICYmICQoQ09ORklHVVJFKSAtLXdpdGgtcmVhZGxpbmU9bm8gCisJdG91Y2ggJEAK
IAogYnVpbGQvbGlicmVpc2VyNC1kZXYgYnVpbGQvcmVpc2VyNHByb2dzOjogYnVpbGQtcmVpc2Vy
NHByb2dzLXN0YW1wCiBidWlsZC1yZWlzZXI0cHJvZ3Mtc3RhbXA6CiAJJChNQUtFKSAtQyAkKENV
UkRJUikvYnVpbGQvcmVpc2VyNHByb2dzCiAJdG91Y2ggJEAKIAotI2J1aWxkL21rcmVpc2VyNC11
ZGViIGJ1aWxkL3JlaXNlcjRwcm9ncy11ZGViOjogYnVpbGQtdWRlYnMtc3RhbXAKLSNidWlsZC11
ZGVicy1zdGFtcDo6Ci0jCSQoTUFLRSkgLUMgJChDVVJESVIpL2J1aWxkL3VkZWJzCi0jCXRvdWNo
ICRACitidWlsZC9ta3JlaXNlcjQtdWRlYiBidWlsZC9yZWlzZXI0cHJvZ3MtdWRlYjo6IGJ1aWxk
LXVkZWJzLXN0YW1wCitidWlsZC11ZGVicy1zdGFtcDo6CisJJChNQUtFKSAtQyAkKENVUkRJUikv
YnVpbGQvdWRlYnMKKwl0b3VjaCAkQAogCiBpbnN0YWxsL3JlaXNlcjRwcm9nczo6IGluc3RhbGwt
cmVpc2VyNHByb2dzLXN0YW1wCiBpbnN0YWxsLXJlaXNlcjRwcm9ncy1zdGFtcDoKQEAgLTgyLDIx
ICs4MiwyMSBAQCBpbnN0YWxsLWxpYnJlaXNlcjQtZGV2LXN0YW1wOjoKIAlybSAtcmYgJChDVVJE
SVIpL2RlYmlhbi9saWJyZWlzZXI0LWRldi91c3Ivc2hhcmUvZG9jL3tBVVRIT1JTLEJVR1MsUkVB
RE1FLFRIQU5LU30KIAlybSAtZiAkKENVUkRJUikvZGViaWFuL2xpYnJlaXNlcjQtZGV2L3Vzci9s
aWIvKi5sYQogCi0jaW5zdGFsbC9ta3JlaXNlcjQtdWRlYjo6IGluc3RhbGwtbWtyZWlzZXI0LXVk
ZWItc3RhbXAKLSNpbnN0YWxsLW1rcmVpc2VyNC11ZGViLXN0YW1wOjoKLSMJJChNQUtFKSAtQyAk
KENVUkRJUikvYnVpbGQvdWRlYnMgaW5zdGFsbCBERVNURElSPSQoQ1VSRElSKS9kZWJpYW4vbWty
ZWlzZXI0LXVkZWIvCi0jCW12ICQoQ1VSRElSKS9kZWJpYW4vbWtyZWlzZXI0LXVkZWIvdXNyL3Ni
aW4gJChDVVJESVIpL2RlYmlhbi9ta3JlaXNlcjQtdWRlYi8KLSMJcm0gLXJmICQoQ1VSRElSKS9k
ZWJpYW4vbWtyZWlzZXI0LXVkZWIvc2Jpbi9tYWtlX3JlaXNlcjQKLSMJcm0gLXJmICQoQ1VSRElS
KS9kZWJpYW4vbWtyZWlzZXI0LXVkZWIvdXNyCi0jCXJtIC1yZiAkKENVUkRJUikvZGViaWFuL21r
cmVpc2VyNC11ZGViL3NiaW4ve2RlYnVnZnMucmVpc2VyNCxmc2NrLnJlaXNlcjQsbWVhc3VyZWZz
LnJlaXNlcjR9Ci0KLSNpbnN0YWxsL3JlaXNlcjRwcm9ncy11ZGViOjogaW5zdGFsbC1yZWlzZXI0
cHJvZ3MtdWRlYi1zdGFtcAotI2luc3RhbGwtcmVpc2VyNHByb2dzLXVkZWItc3RhbXA6OgotIwkk
KE1BS0UpIC1DICQoQ1VSRElSKS9idWlsZC91ZGVicyBpbnN0YWxsIERFU1RESVI9JChDVVJESVIp
L2RlYmlhbi9yZWlzZXI0cHJvZ3MtdWRlYi8KLSMJbXYgJChDVVJESVIpL2RlYmlhbi9yZWlzZXI0
cHJvZ3MtdWRlYi91c3Ivc2JpbiAkKENVUkRJUikvZGViaWFuL3JlaXNlcjRwcm9ncy11ZGViLwot
IwlybSAtcmYgJChDVVJESVIpL2RlYmlhbi9yZWlzZXI0cHJvZ3MtdWRlYi9zYmluL21ha2VfcmVp
c2VyNAotIwlybSAtcmYgJChDVVJESVIpL2RlYmlhbi9yZWlzZXI0cHJvZ3MtdWRlYi91c3IKLSMJ
cm0gLXJmICQoQ1VSRElSKS9kZWJpYW4vcmVpc2VyNHByb2dzLXVkZWIvc2Jpbi97bWtmcy5yZWlz
ZXI0LG1lYXN1cmVmcy5yZWlzZXI0fQoraW5zdGFsbC9ta3JlaXNlcjQtdWRlYjo6IGluc3RhbGwt
bWtyZWlzZXI0LXVkZWItc3RhbXAKK2luc3RhbGwtbWtyZWlzZXI0LXVkZWItc3RhbXA6OgorCSQo
TUFLRSkgLUMgJChDVVJESVIpL2J1aWxkL3VkZWJzIGluc3RhbGwgREVTVERJUj0kKENVUkRJUikv
ZGViaWFuL21rcmVpc2VyNC11ZGViLworCW12ICQoQ1VSRElSKS9kZWJpYW4vbWtyZWlzZXI0LXVk
ZWIvdXNyL3NiaW4gJChDVVJESVIpL2RlYmlhbi9ta3JlaXNlcjQtdWRlYi8KKwlybSAtcmYgJChD
VVJESVIpL2RlYmlhbi9ta3JlaXNlcjQtdWRlYi9zYmluL21ha2VfcmVpc2VyNAorCXJtIC1yZiAk
KENVUkRJUikvZGViaWFuL21rcmVpc2VyNC11ZGViL3VzcgorCXJtIC1yZiAkKENVUkRJUikvZGVi
aWFuL21rcmVpc2VyNC11ZGViL3NiaW4ve2RlYnVnZnMucmVpc2VyNCxmc2NrLnJlaXNlcjQsbWVh
c3VyZWZzLnJlaXNlcjR9CisKK2luc3RhbGwvcmVpc2VyNHByb2dzLXVkZWI6OiBpbnN0YWxsLXJl
aXNlcjRwcm9ncy11ZGViLXN0YW1wCitpbnN0YWxsLXJlaXNlcjRwcm9ncy11ZGViLXN0YW1wOjoK
KwkkKE1BS0UpIC1DICQoQ1VSRElSKS9idWlsZC91ZGVicyBpbnN0YWxsIERFU1RESVI9JChDVVJE
SVIpL2RlYmlhbi9yZWlzZXI0cHJvZ3MtdWRlYi8KKwltdiAkKENVUkRJUikvZGViaWFuL3JlaXNl
cjRwcm9ncy11ZGViL3Vzci9zYmluICQoQ1VSRElSKS9kZWJpYW4vcmVpc2VyNHByb2dzLXVkZWIv
CisJcm0gLXJmICQoQ1VSRElSKS9kZWJpYW4vcmVpc2VyNHByb2dzLXVkZWIvc2Jpbi9tYWtlX3Jl
aXNlcjQKKwlybSAtcmYgJChDVVJESVIpL2RlYmlhbi9yZWlzZXI0cHJvZ3MtdWRlYi91c3IKKwly
bSAtcmYgJChDVVJESVIpL2RlYmlhbi9yZWlzZXI0cHJvZ3MtdWRlYi9zYmluL3tta2ZzLnJlaXNl
cjQsbWVhc3VyZWZzLnJlaXNlcjR9CiAKIGNsZWFuOjoKIAlkaF9hdXRvcmVjb25mX2NsZWFuCi0t
IAoyLjYuNAoK
--047d7b3a8680f583d905290cbab0--
