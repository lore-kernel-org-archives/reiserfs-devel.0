From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Thu, 1 Jun 2023 22:30:51 +0200
Message-ID: <ffde7908-be73-cc56-2646-72f4f94cb51b@huaweicloud.com>
References: <00000000000000964605faf87416@google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------9s1UkhsFMSGVUfhtFoW0w0E7"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <00000000000000964605faf87416@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
To: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>, hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com

This is a multi-part message in MIME format.
--------------9s1UkhsFMSGVUfhtFoW0w0E7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/2023 10:51 PM, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> Author: Roberto Sassu <roberto.sassu@huawei.com>
> Date:   Fri Mar 31 12:32:18 2023 +0000
> 
>      reiserfs: Add security prefix to xattr name in reiserfs_security_write()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14403182280000
> start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of https://githu..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=16403182280000
> console output: https://syzkaller.appspot.com/x/log.txt?x=12403182280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=73a06f6ef2d5b492
> dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12442414280000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a7318280000
> 
> Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reiserfs_security_write()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
--------------9s1UkhsFMSGVUfhtFoW0w0E7
Content-Type: text/plain; charset=UTF-8;
 name="0001-reiserfs-Move-d_instantiate_new-out-of-the-write-loc.patch"
Content-Disposition: attachment;
 filename*0="0001-reiserfs-Move-d_instantiate_new-out-of-the-write-loc.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjZjU0NDVhZmMzNTFiYmM1NWEwMDgwZjFiYzQwOGZmNDk2YWViODc5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2JlcnRvIFNhc3N1IDxyb2JlcnRvLnNhc3N1QGh1
YXdlaS5jb20+CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMDozNjozNyArMDIwMApTdWJqZWN0
OiBbUkZDXVtQQVRDSF0gcmVpc2VyZnM6IE1vdmUgZF9pbnN0YW50aWF0ZV9uZXcoKSBvdXQg
b2YgdGhlIHdyaXRlIGxvY2sKCkNvbW1pdCA0YzA1MTQxZGY1N2YgKCJyZWlzZXJmczogbG9j
a2luZywgcHVzaCB3cml0ZSBsb2NrIG91dCBvZiB4YXR0cgpjb2RlIikgbW92ZWQgeGF0dHIg
b3BlcmF0aW9ucyBvdXRzaWRlIHRoZSB3cml0ZSBsb2NrLiBUaGUgcHJvYmxlbSBpcyB0aGF0
Cm5vdCBhbGwgeGF0dHIgb3BlcmF0aW9ucyBhcmUgb3V0c2lkZSB0aGF0IGxvY2suICBGb3Ig
ZXhhbXBsZSwgdGhlIHdyaXRlCmxvY2sgaXMgbm90IHJlbGVhc2VkIHdoZW4gZF9pbnN0YW50
aWF0ZV9uZXcoKSBpcyBjYWxsZWQuIEF0IHRoYXQgdGltZSwKYWN0aXZlIExTTXMgbGlrZWx5
IGZldGNoIHRoZSBjb250ZW50IGZyb20gdGhlaXIgeGF0dHJzLgoKTWl4aW5nIHRoZSB0d28g
Y2FzZXMgKHhhdHRyIG9wZXJhdGlvbnMgd2l0aG91dCBhbmQgd2l0aCBhIHdyaXRlIGxvY2sp
CmNvdWxkIGNhdXNlIGEgZGVhZGxvY2suIEZvciBleGFtcGxlLCBhIGRlYWRsb2NrIGNvdWxk
IGhhcHBlbiBkdWUgdG8gdGhlCmZvbGxvd2luZyBjaXJjdWxhciBkZXBlbmRlbmNpZXM6Cgp3
cml0ZSBsb2NrICh0YXNrIEEpIC0+IGlub2RlIGxvY2sgKHRhc2sgQikgLT53cml0ZSBsb2Nr
ICh0YXNrIEIpCi0+IGlub2RlIGxvY2sgKHRhc2sgQSkKCk1ha2Ugc3VyZSB0aGF0IGFsbCB4
YXR0ciBvcGVyYXRpb25zIGFyZSBvdXRzaWRlIHRoZSB3cml0ZSBsb2NrLCBieQp3cmFwcGlu
ZyBhbGwgZF9pbnN0YW50aWF0ZV9uZXcoKSBjYWxscyB3aXRoIHJlaXNlcmZzX3dyaXRlX3Vu
bG9jaygpIGFuZApyZWlzZXJmc193cml0ZV9sb2NrKCkuCgpGaXhlczogZDgyZGNkOWUyMWI3
ICgicmVpc2VyZnM6IEFkZCBzZWN1cml0eSBwcmVmaXggdG8geGF0dHIgbmFtZSBpbiByZWlz
ZXJmc19zZWN1cml0eV93cml0ZSgpIikKUmVwb3J0ZWQtYnk6IHN5emJvdCs4ZmI2NGE2MWZk
ZDk2YjUwZjNiOEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tClNpZ25lZC1vZmYtYnk6IFJv
YmVydG8gU2Fzc3UgPHJvYmVydG8uc2Fzc3VAaHVhd2VpLmNvbT4KLS0tCiBmcy9yZWlzZXJm
cy9uYW1laS5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2ZzL3JlaXNlcmZzL25hbWVpLmMgYi9mcy9yZWlzZXJmcy9uYW1l
aS5jCmluZGV4IDUyMjQwY2M4OTFjLi4zNTA4YmYxYTc1ZSAxMDA2NDQKLS0tIGEvZnMvcmVp
c2VyZnMvbmFtZWkuYworKysgYi9mcy9yZWlzZXJmcy9uYW1laS5jCkBAIC02ODksNyArNjg5
LDkgQEAgc3RhdGljIGludCByZWlzZXJmc19jcmVhdGUoc3RydWN0IG1udF9pZG1hcCAqaWRt
YXAsIHN0cnVjdCBpbm9kZSAqZGlyLAogCXJlaXNlcmZzX3VwZGF0ZV9pbm9kZV90cmFuc2Fj
dGlvbihpbm9kZSk7CiAJcmVpc2VyZnNfdXBkYXRlX2lub2RlX3RyYW5zYWN0aW9uKGRpcik7
CiAKKwlyZWlzZXJmc193cml0ZV91bmxvY2soZGlyLT5pX3NiKTsKIAlkX2luc3RhbnRpYXRl
X25ldyhkZW50cnksIGlub2RlKTsKKwlyZWlzZXJmc193cml0ZV9sb2NrKGRpci0+aV9zYik7
CiAJcmV0dmFsID0gam91cm5hbF9lbmQoJnRoKTsKIAogb3V0X2ZhaWxlZDoKQEAgLTc3Myw3
ICs3NzUsOSBAQCBzdGF0aWMgaW50IHJlaXNlcmZzX21rbm9kKHN0cnVjdCBtbnRfaWRtYXAg
KmlkbWFwLCBzdHJ1Y3QgaW5vZGUgKmRpciwKIAkJZ290byBvdXRfZmFpbGVkOwogCX0KIAor
CXJlaXNlcmZzX3dyaXRlX3VubG9jayhkaXItPmlfc2IpOwogCWRfaW5zdGFudGlhdGVfbmV3
KGRlbnRyeSwgaW5vZGUpOworCXJlaXNlcmZzX3dyaXRlX2xvY2soZGlyLT5pX3NiKTsKIAly
ZXR2YWwgPSBqb3VybmFsX2VuZCgmdGgpOwogCiBvdXRfZmFpbGVkOgpAQCAtODc0LDcgKzg3
OCw5IEBAIHN0YXRpYyBpbnQgcmVpc2VyZnNfbWtkaXIoc3RydWN0IG1udF9pZG1hcCAqaWRt
YXAsIHN0cnVjdCBpbm9kZSAqZGlyLAogCS8qIHRoZSBhYm92ZSBhZGRfZW50cnkgZGlkIG5v
dCB1cGRhdGUgZGlyJ3Mgc3RhdCBkYXRhICovCiAJcmVpc2VyZnNfdXBkYXRlX3NkKCZ0aCwg
ZGlyKTsKIAorCXJlaXNlcmZzX3dyaXRlX3VubG9jayhkaXItPmlfc2IpOwogCWRfaW5zdGFu
dGlhdGVfbmV3KGRlbnRyeSwgaW5vZGUpOworCXJlaXNlcmZzX3dyaXRlX2xvY2soZGlyLT5p
X3NiKTsKIAlyZXR2YWwgPSBqb3VybmFsX2VuZCgmdGgpOwogb3V0X2ZhaWxlZDoKIAlyZWlz
ZXJmc193cml0ZV91bmxvY2soZGlyLT5pX3NiKTsKQEAgLTExOTEsNyArMTE5Nyw5IEBAIHN0
YXRpYyBpbnQgcmVpc2VyZnNfc3ltbGluayhzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwKIAkJ
Z290byBvdXRfZmFpbGVkOwogCX0KIAorCXJlaXNlcmZzX3dyaXRlX3VubG9jayhwYXJlbnRf
ZGlyLT5pX3NiKTsKIAlkX2luc3RhbnRpYXRlX25ldyhkZW50cnksIGlub2RlKTsKKwlyZWlz
ZXJmc193cml0ZV9sb2NrKHBhcmVudF9kaXItPmlfc2IpOwogCXJldHZhbCA9IGpvdXJuYWxf
ZW5kKCZ0aCk7CiBvdXRfZmFpbGVkOgogCXJlaXNlcmZzX3dyaXRlX3VubG9jayhwYXJlbnRf
ZGlyLT5pX3NiKTsKLS0gCjIuMjUuMQoK

--------------9s1UkhsFMSGVUfhtFoW0w0E7--

