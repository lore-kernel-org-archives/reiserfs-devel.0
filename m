From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [RFC] Smart fibration plugin ext_4321
Date: Sun, 25 Dec 2016 01:59:51 +0100
Message-ID: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a113eaf320307bd05447123d5
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=hkzqmG6fJN6WfaKSwaZAJ4cu/MOkCWWOrD/knDA6TAk=;
        b=e0YWb8nte0vdOxraUdTjWZ+Ffvlwv+85hmjMxAIFl1mUv58DV9QT0lFt6e+RIN2QtK
         lDVoVZUd8O5vS805MoANTq10BKg7+E821ZfUpN/a8SITQkAnawsGAH+WlL68sJDoko1D
         rOKo9QgSQKpg3wpfUTDl9hwF6+P8Y8Q/0us2uK2JOqagNYeUugrkZjJJm406aikupZTy
         oXi6chpl5R1o0dJcDfvqTZbGIphEcE+FkJsNgMDZfVLDkTaq1NJDd0cww3gnXnY5S8OT
         zZBV8p8S4yteNQNvb/PxFdIuAi+uSs04KbddYW1uI7NSU+niJEjtrsEs7a23xjKys7RO
         ameA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

--001a113eaf320307bd05447123d5
Content-Type: text/plain; charset=UTF-8

Fibration is a great way to decrease fragmentation and increase throughput.
Currently there are 4 fibration plugins, lex, dot.o, ext_1 and ext_3
and they all have their upsides and downsides.

Proposed fibration plugin combines them all so that it combines files
with same extensions for 1, 2. 3 and 4 character extension  in groups
and sorts them in same fiber group.

With this fibration plugin all eg. xvid files would be in same group
in folder on disk sorted alphabetically so that we will avoid putting
small files between them and in that way reduce fragmentation. That
group (xvid 4 character extensions) would be among last groups under
one directory so that all small files would be written before it.

Problem with the attached patch is that currently every fibre value is
defined as u64  (eg. static __u64 fibre_ext_3) but if I understood
correctly comments in kassign.c and fibration.c fibration part of the
key is only 7 bits long.
If that is true how did fibre_ext_3 worked?

Thanks

Dushan

--001a113eaf320307bd05447123d5
Content-Type: application/octet-stream; name="fibration_ext_4321.patch"
Content-Disposition: attachment; filename="fibration_ext_4321.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ix3y3ita0

U2lnbmVkLW9mZi1ieTpEdXNoYW4gVGNob2xpY2ggPGR1c2FuY0BnbWFpbC5jb20+CgotLS0gbGlu
dXgtNC44LjE1LWdlbnRvby9mcy9yZWlzZXI0L3BsdWdpbi9maWJyYXRpb24uYwkyMDE2LTEyLTI0
IDE4OjIyOjA5LjY3OTY0NTk3MSArMDEwMAorKysgbGludXgvZnMvcmVpc2VyNC9wbHVnaW4vZmli
cmF0aW9uLmMJMjAxNi0xMi0yNSAwMTozMTo0My43MDAzODM2MjQgKzAxMDAKQEAgLTgxLDYgKzgx
LDI1IEBAIHN0YXRpYyBfX3U2NCBmaWJyZV9leHRfMyhjb25zdCBzdHJ1Y3QgaW4KIAkJcmV0dXJu
IEZJQlJFX05PKDApOwogfQogCisvKgorKiBleHQuNDMyMSBmaWJyYXRpb246IHRyeSB0byBzZXBh
cmF0ZSBmaWxlcyB3aXRoIGRpZmZlcmVudCAxLCAyLCAzIGFuZCA0LWNoYXJhY3RlcgorKiBleHRl
bnNpb25zIGZyb20gZWFjaCBvdGhlci4KKyovCisKK3N0YXRpYyBfX3U2NCBmaWJyZV9leHRfNDMy
MShjb25zdCBzdHJ1Y3QgaW5vZGUgKmRpciwgY29uc3QgY2hhciAqbmFtZSwgaW50IGxlbikKK3sK
KwlpZiAobGVuID4gNSAmJiBuYW1lW2xlbiAtIDVdID09ICcuJykKKwkJcmV0dXJuIEZJQlJFX05P
KG5hbWVbbGVuIC0gNF0gKyBuYW1lW2xlbiAtIDNdICsgbmFtZVtsZW4gLSAyXSArIG5hbWVbbGVu
IC0gMV0gKyA3NjgpOworCWVsc2UgaWYgKGxlbiA+IDQgJiYgbmFtZVtsZW4gLSA0XSA9PSAnLicp
CisJCXJldHVybiBGSUJSRV9OTyhuYW1lW2xlbiAtIDNdICsgbmFtZVtsZW4gLSAyXSArIG5hbWVb
bGVuIC0gMV0gKyAzODQpOworCWVsc2UgaWYgKGxlbiA+IDMgJiYgbmFtZVtsZW4gLSAzXSA9PSAn
LicpCisJCXJldHVybiBGSUJSRV9OTyhuYW1lW2xlbiAtIDJdICsgbmFtZVtsZW4gLSAxXSArIDEy
OCk7CisJZWxzZSBpZiAobGVuID4gMiAmJiBuYW1lW2xlbiAtIDJdID09ICcuJykKKwkJcmV0dXJu
IEZJQlJFX05PKG5hbWVbbGVuIC0gMV0pOworCWVsc2UKKwkJcmV0dXJuIEZJQlJFX05PKDApOwor
fSAKKwogc3RhdGljIGludCBjaGFuZ2VfZmlicmF0aW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUsCiAJ
CQkgICAgcmVpc2VyNF9wbHVnaW4gKiBwbHVnaW4sCiAJCQkgICAgcHNldF9tZW1iZXIgbWVtYikK
QEAgLTE2MSw3ICsxODAsMTggQEAgZmlicmF0aW9uX3BsdWdpbiBmaWJyYXRpb25fcGx1Z2luc1tM
QVNUXwogCQkJLmxpbmthZ2UgPSB7TlVMTCwgTlVMTH0KIAkJfSwKIAkJLmZpYnJlID0gZmlicmVf
ZXh0XzMKLQl9CisJfSwKKyAgICAgICAgW0ZJQlJBVElPTl9FWFRfNDMyMV0gPSB7CisgICAgICAg
ICAgICAgICAgLmggPSB7CisgICAgICAgICAgICAgICAgICAgICAgICAudHlwZV9pZCA9IFJFSVNF
UjRfRklCUkFUSU9OX1BMVUdJTl9UWVBFLAorICAgICAgICAgICAgICAgICAgICAgICAgLmlkID0g
RklCUkFUSU9OX0VYVF80MzIxLAorICAgICAgICAgICAgICAgICAgICAgICAgLnBvcHMgPSAmZmli
cmF0aW9uX3BsdWdpbl9vcHMsCisgICAgICAgICAgICAgICAgICAgICAgICAubGFiZWwgPSAiZXh0
LTQzMjEiLAorICAgICAgICAgICAgICAgICAgICAgICAgLmRlc2MgPSAiZmlicmF0ZSBmaWxlIGJ5
IDQsIDMsIDIgYW5kIDEgY2hhcmFjdGVyIGV4dGVuc2lvbiIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAubGlua2FnZSA9IHtOVUxMLCBOVUxMfQorICAgICAgICAgICAgICAgIH0sCisgICAgICAg
ICAgICAgICAgLmZpYnJlID0gZmlicmVfZXh0XzQzMjEKKyAgICAgICAgfQogfTsKIAogLyoKLS0t
IGxpbnV4LTQuOC4xNS1nZW50b28vZnMvcmVpc2VyNC9wbHVnaW4vZmlicmF0aW9uLmgJMjAxNi0x
Mi0yNCAxODoyMjowOS42ODM2NDYxNDcgKzAxMDAKKysrIGxpbnV4L2ZzL3JlaXNlcjQvcGx1Z2lu
L2ZpYnJhdGlvbi5oCTIwMTYtMTItMjUgMDE6MTk6MTIuOTc1MzkwMTUxICswMTAwCkBAIC0yMCw2
ICsyMCw3IEBAIHR5cGVkZWYgZW51bSB7CiAJRklCUkFUSU9OX0RPVF9PLAogCUZJQlJBVElPTl9F
WFRfMSwKIAlGSUJSQVRJT05fRVhUXzMsCisJRklCUkFUSU9OX0VYVF80MzIxLAogCUxBU1RfRklC
UkFUSU9OX0lECiB9IHJlaXNlcjRfZmlicmF0aW9uX2lkOwogCg==
--001a113eaf320307bd05447123d5--
