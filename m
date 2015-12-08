From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Fwd: Initial Reiser4 patch for Parted
Date: Tue, 8 Dec 2015 00:03:39 -0800
Message-ID: <CAM12Q5Q0mf=uNF1Uw9cOiZRRTRc14Gnzn6wNUDq7dCn8cEHQzg@mail.gmail.com>
References: <CAM12Q5QDp__EAjLUEUbmyFFm1ap=uQrF2Od_S5ZBg6NnOL2ZAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a1142296856154005265e6973
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=JtnUNI7ryF5W6azUAjS/Ujv4HXmC0QrFt/0e6snLV+0=;
        b=e02h588lQAfRE+HBGXyp1udOz431TEVSsJUsVrv+QTQ57/kQwyYGaIVLiNC9zeD5eN
         rsN4fRvFfRmrWAnsyxqQ5ZeKWHaR5tNpHoPxZuKGO5sHJYN2HdMrNZ3D0KAKLSrFTB+H
         yF2r8WCaIQEja0ToFNzt5z5fi8s6Lb9wklKePQ8ItAswG4vvBF21WdQrE0mjTkbm+lVC
         y6lTIW3yTNCrxZA2Lsf6Ubw12MHchYA85nKlwUCGqZI1u+stpQ3PwLXF6CtX2Os3s8Gk
         FbKEofD2NeTLc1f1+Envbtl9nTbe0gucOldTc/yTYx1vxaSP+ms/FXgX+Nqtbkg8jqNf
         9s3g==
In-Reply-To: <CAM12Q5QDp__EAjLUEUbmyFFm1ap=uQrF2Od_S5ZBg6NnOL2ZAg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

--001a1142296856154005265e6973
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ----------
From: Jose R R <jose.r.r@metztli.com>
Date: Tue, Dec 8, 2015 at 12:00 AM
Subject: Initial Reiser4 patch for Parted
To: bug-parted@gnu.org
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>,
cjwatson@debian.org


'patch against git://git.sv.gnu.org/parted.git master that adds the
ability to detect existing reiser4 partitions'

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

--001a1142296856154005265e6973
Content-Type: application/octet-stream; 
	name="0001-Initial-Reiser4-support-based-on-Bart-Hakvoort-2004-.patch"
Content-Disposition: attachment; 
	filename="0001-Initial-Reiser4-support-based-on-Bart-Hakvoort-2004-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ihx3az900

RnJvbSBlOTcxYmE4MzQyZDhmZGE0YmNlMTkxODkyMGM3YzhjNjJjODFlNTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIDxqb3NlLnJvZHJpZ3VlekBtZXR6dGxpLWl0LmNv
bT4KRGF0ZTogTW9uLCA3IERlYyAyMDE1IDA0OjA3OjI2IC0wODAwClN1YmplY3Q6IFtQQVRDSF0g
SW5pdGlhbCBSZWlzZXI0IHN1cHBvcnQgYmFzZWQgb24gQmFydCBIYWt2b29ydCAyMDA0IHdvcmsu
CgotLS0KIGxpYnBhcnRlZC9NYWtlZmlsZS5hbSAgICAgICAgICB8ICAxICsKIGxpYnBhcnRlZC9m
cy9NYWtlZmlsZS5hbSAgICAgICB8ICAzICsrCiBsaWJwYXJ0ZWQvZnMvcmVpc2VyNC9yZWlzZXI0
LmMgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGxpYnBh
cnRlZC9saWJwYXJ0ZWQuYyAgICAgICAgICB8ICA0ICsrKwogNCBmaWxlcyBjaGFuZ2VkLCA3OSBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGlicGFydGVkL2ZzL3JlaXNlcjQvcmVp
c2VyNC5jCgpkaWZmIC0tZ2l0IGEvbGlicGFydGVkL01ha2VmaWxlLmFtIGIvbGlicGFydGVkL01h
a2VmaWxlLmFtCmluZGV4IGNiNTg2NDguLjQ5NzA5ZGMgMTAwNjQ0Ci0tLSBhL2xpYnBhcnRlZC9N
YWtlZmlsZS5hbQorKysgYi9saWJwYXJ0ZWQvTWFrZWZpbGUuYW0KQEAgLTMsNiArMyw3IEBACiAj
CiAjIFRoaXMgZmlsZSBtYXkgYmUgbW9kaWZpZWQgYW5kL29yIGRpc3RyaWJ1dGVkIHdpdGhvdXQg
cmVzdHJpY3Rpb24uCiAKK0FVVE9NQUtFX09QVElPTlMgPSBzdWJkaXItb2JqZWN0cwogU1VCRElS
U19DSEVDSyA9CiBpZiBIQVZFX0NIRUNLCiBTVUJESVJTX0NIRUNLICs9IHRlc3RzCmRpZmYgLS1n
aXQgYS9saWJwYXJ0ZWQvZnMvTWFrZWZpbGUuYW0gYi9saWJwYXJ0ZWQvZnMvTWFrZWZpbGUuYW0K
aW5kZXggZDNjYzhiYy4uM2Q2ZDMyNSAxMDA2NDQKLS0tIGEvbGlicGFydGVkL2ZzL01ha2VmaWxl
LmFtCisrKyBiL2xpYnBhcnRlZC9mcy9NYWtlZmlsZS5hbQpAQCAtMyw2ICszLDggQEAKICMKICMg
VGhpcyBmaWxlIG1heSBiZSBtb2RpZmllZCBhbmQvb3IgZGlzdHJpYnV0ZWQgd2l0aG91dCByZXN0
cmljdGlvbi4KIAorQVVUT01BS0VfT1BUSU9OUyA9IHN1YmRpci1vYmplY3RzCisKIHBhcnRlZGlu
Y2x1ZGVkaXIgPSAtSSQodG9wX2J1aWxkZGlyKS9pbmNsdWRlIC1JJCh0b3Bfc3JjZGlyKS9pbmNs
dWRlCiAKIEFNX0NGTEFHUyA9ICQoV0FSTl9DRkxBR1MpCkBAIC00NCw2ICs0Niw3IEBAIGxpYmZz
X2xhX1NPVVJDRVMgPQkJXAogICBudGZzL250ZnMuYwkJCVwKICAgcmVpc2VyZnMvcmVpc2VyZnMu
YwkJXAogICByZWlzZXJmcy9yZWlzZXJmcy5oCQlcCisgIHJlaXNlcjQvcmVpc2VyNC5jCQlcCiAg
IHVmcy91ZnMuYwkJCVwKICAgeGZzL3BsYXRmb3JtX2RlZnMuaAkJXAogICB4ZnMveGZzLmMJCQlc
CmRpZmYgLS1naXQgYS9saWJwYXJ0ZWQvZnMvcmVpc2VyNC9yZWlzZXI0LmMgYi9saWJwYXJ0ZWQv
ZnMvcmVpc2VyNC9yZWlzZXI0LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
MGE4NmUwYwotLS0gL2Rldi9udWxsCisrKyBiL2xpYnBhcnRlZC9mcy9yZWlzZXI0L3JlaXNlcjQu
YwpAQCAtMCwwICsxLDcxIEBACisvKgorICAgIGxpYnBhcnRlZCAtIGEgbGlicmFyeSBmb3IgbWFu
aXB1bGF0aW5nIGRpc2sgcGFydGl0aW9ucworICAgIENvcHlyaWdodCAoQykgMjAwMCBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKworICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgICAgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQg
YnkKKyAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9m
IHRoZSBMaWNlbnNlLCBvcgorICAgIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24u
CisKKyAgICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3
aWxsIGJlIHVzZWZ1bCwKKyAgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZl
biB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAgICBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCisgICAgWW91IHNob3VsZCBoYXZlIHJlY2Vp
dmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAgICBhbG9uZyB3
aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorICAg
IEZvdW5kYXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1B
ICAwMjExMS0xMzA3ICBVU0EKKyovCisKKyNpbmNsdWRlIDxjb25maWcuaD4KKworI2luY2x1ZGUg
PHBhcnRlZC9wYXJ0ZWQuaD4KKyNpbmNsdWRlIDxwYXJ0ZWQvZW5kaWFuLmg+CisKKyNpZiBFTkFC
TEVfTkxTCisjICBpbmNsdWRlIDxsaWJpbnRsLmg+CisjICBkZWZpbmUgXyhTdHJpbmcpIGRnZXR0
ZXh0IChQQUNLQUdFLCBTdHJpbmcpCisjZWxzZQorIyAgZGVmaW5lIF8oU3RyaW5nKSAoU3RyaW5n
KQorI2VuZGlmIC8qIEVOQUJMRV9OTFMgKi8KKworI2luY2x1ZGUgPHVuaXN0ZC5oPgorI2luY2x1
ZGUgPHN0cmluZy5oPgorCitzdGF0aWMgUGVkR2VvbWV0cnkqCityZWlzZXI0X3Byb2JlIChQZWRH
ZW9tZXRyeSogZ2VvbSkKK3sKKwljaGFyCWJ1Zls1MTJdOworCisJaWYgKCFwZWRfZ2VvbWV0cnlf
cmVhZCAoZ2VvbSwgYnVmLCAxMjgsIDEpKQorCQlyZXR1cm4gMDsJCisJCisJaWYgKCBzdHJjbXAo
IGJ1ZiwgIlJlSXNFcjQiICkgPT0gMCApCisJCXJldHVybiBwZWRfZ2VvbWV0cnlfZHVwbGljYXRl
KCBnZW9tICkgOworCisJZWxzZQorCQlyZXR1cm4gTlVMTDsKK30KKworc3RhdGljIFBlZEZpbGVT
eXN0ZW1PcHMgcmVpc2VyNF9vcHMgPSB7CisJcHJvYmU6CQlyZWlzZXI0X3Byb2JlLAorfTsKKwor
c3RhdGljIFBlZEZpbGVTeXN0ZW1UeXBlIHJlaXNlcjRfdHlwZSA9IHsKKwluZXh0OglOVUxMLAor
CW9wczoJJnJlaXNlcjRfb3BzLAorCW5hbWU6CSJyZWlzZXI0IgorfTsKKwordm9pZAorcGVkX2Zp
bGVfc3lzdGVtX3JlaXNlcjRfaW5pdCAoKQoreworCXBlZF9maWxlX3N5c3RlbV90eXBlX3JlZ2lz
dGVyICgmcmVpc2VyNF90eXBlKTsKK30KKwordm9pZAorcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcjRf
ZG9uZSAoKQoreworCXBlZF9maWxlX3N5c3RlbV90eXBlX3VucmVnaXN0ZXIgKCZyZWlzZXI0X3R5
cGUpOworfQorCmRpZmYgLS1naXQgYS9saWJwYXJ0ZWQvbGlicGFydGVkLmMgYi9saWJwYXJ0ZWQv
bGlicGFydGVkLmMKaW5kZXggZDVjYmIzYS4uODI5MWIxZCAxMDA2NDQKLS0tIGEvbGlicGFydGVk
L2xpYnBhcnRlZC5jCisrKyBiL2xpYnBhcnRlZC9saWJwYXJ0ZWQuYwpAQCAtMTA4LDYgKzEwOCw3
IEBAIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9qZnNfaW5pdCAodm9pZCk7CiBleHRlcm4g
dm9pZCBwZWRfZmlsZV9zeXN0ZW1faGZzX2luaXQgKHZvaWQpOwogZXh0ZXJuIHZvaWQgcGVkX2Zp
bGVfc3lzdGVtX2ZhdF9pbml0ICh2b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9l
eHQyX2luaXQgKHZvaWQpOworZXh0ZXJuIHZvaWQgcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcjRfaW5p
dCAodm9pZCk7CiBleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0ZW1fbmlsZnMyX2luaXQgKHZvaWQp
OwogZXh0ZXJuIHZvaWQgcGVkX2ZpbGVfc3lzdGVtX2J0cmZzX2luaXQgKHZvaWQpOwogCkBAIC0x
MjQsNiArMTI1LDcgQEAgaW5pdF9maWxlX3N5c3RlbV90eXBlcyAoKQogCXBlZF9maWxlX3N5c3Rl
bV9oZnNfaW5pdCAoKTsKIAlwZWRfZmlsZV9zeXN0ZW1fZmF0X2luaXQgKCk7CiAJcGVkX2ZpbGVf
c3lzdGVtX2V4dDJfaW5pdCAoKTsKKwlwZWRfZmlsZV9zeXN0ZW1fcmVpc2VyNF9pbml0ICgpOwog
CXBlZF9maWxlX3N5c3RlbV9uaWxmczJfaW5pdCAoKTsKIAlwZWRfZmlsZV9zeXN0ZW1fYnRyZnNf
aW5pdCAoKTsKIH0KQEAgLTE4Nyw2ICsxODksNyBAQCBleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0
ZW1fbnRmc19kb25lICh2b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV9yZWlzZXJm
c19kb25lICh2b2lkKTsKIGV4dGVybiB2b2lkIHBlZF9maWxlX3N5c3RlbV91ZnNfZG9uZSAodm9p
ZCk7CiBleHRlcm4gdm9pZCBwZWRfZmlsZV9zeXN0ZW1feGZzX2RvbmUgKHZvaWQpOworZXh0ZXJu
IHZvaWQgcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcjRfZG9uZSAodm9pZCk7CiBleHRlcm4gdm9pZCBw
ZWRfZmlsZV9zeXN0ZW1fYW1pZ2FfZG9uZSAodm9pZCk7CiBleHRlcm4gdm9pZCBwZWRfZmlsZV9z
eXN0ZW1fYnRyZnNfZG9uZSAodm9pZCk7CiAKQEAgLTIwMyw2ICsyMDYsNyBAQCBkb25lX2ZpbGVf
c3lzdGVtX3R5cGVzICgpCiAJcGVkX2ZpbGVfc3lzdGVtX3JlaXNlcmZzX2RvbmUgKCk7CiAJcGVk
X2ZpbGVfc3lzdGVtX3Vmc19kb25lICgpOwogCXBlZF9maWxlX3N5c3RlbV94ZnNfZG9uZSAoKTsK
KwlwZWRfZmlsZV9zeXN0ZW1fcmVpc2VyNF9kb25lICgpOwogCXBlZF9maWxlX3N5c3RlbV9hbWln
YV9kb25lICgpOwogCXBlZF9maWxlX3N5c3RlbV9idHJmc19kb25lICgpOwogfQotLSAKMi42LjIK
Cg==
--001a1142296856154005265e6973--
