From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [RFC] Smart fibration plugin ext_4321
Date: Sun, 25 Dec 2016 09:51:22 +0100
Message-ID: <CADW=+3ng7kNhXLyN6_PvQEHOUn2PkRYSkLTPqzVKUno5v=Wxrg@mail.gmail.com>
References: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a1140216249d4a5054477b949
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=JA/GPBjRAatsl8tgVEpcK8lFh2T3++etGBKj85K7ASE=;
        b=f3fqtwp5F5zuQBWjzDoyG1d3vkrMCQAfmphYSFVzIr7Ls/C9oBXWhtJUUh4EPte6Vm
         COpLgUxyRkjjm6ncR8VC1ZgwAeONoh1zp1qM1PYht2JU8NrTLdG80RA5sbtx6bYNNUVf
         60D08ZulzKyk1aNyjeghzZ2mNA/7P9rCNZzUvP2FtJACPNqvYo5zlDqT6ansfxA7oFEA
         S8bn9RpBXMK4buL7nWlUOcHrlFHSE/JQXQomBzsA2uCzVyOyMIEc42FuNFA42VRhdwFn
         y04jOCjaPm4hKWK3faaH/Yek3d7DFGLGPGTGKdlgzMDU2v763Z1H2xXEdeuOii0SJuEH
         KJ+A==
In-Reply-To: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

--001a1140216249d4a5054477b949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 25, 2016 at 1:59 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.c=
om> wrote:
> Fibration is a great way to decrease fragmentation and increase throughpu=
t.
> Currently there are 4 fibration plugins, lex, dot.o, ext_1 and ext_3
> and they all have their upsides and downsides.
>
> Proposed fibration plugin combines them all so that it combines files
> with same extensions for 1, 2. 3 and 4 character extension  in groups
> and sorts them in same fiber group.
>
> With this fibration plugin all eg. xvid files would be in same group
> in folder on disk sorted alphabetically so that we will avoid putting
> small files between them and in that way reduce fragmentation. That
> group (xvid 4 character extensions) would be among last groups under
> one directory so that all small files would be written before it.
>
> Problem with the attached patch is that currently every fibre value is
> defined as u64  (eg. static __u64 fibre_ext_3) but if I understood
> correctly comments in kassign.c and fibration.c fibration part of the
> key is only 7 bits long.
> If that is true how did fibre_ext_3 worked?
>
Patch v2 addresses the problem that we have only 127 fibration groups
available with 7 bits in the key so I made following groups:

1. Fibration value 0-31 - files with 1 character extension except .o files
2. Fibration value 32-60 - files with 2 character extension
3. Fibration value 61-90 - files with 3 character extension
4. Fibration value 91-120 - files with 4 character extension
5. Fibration value 121-125 - Free for some special files
6. Fibration value 126 - rest of files
7. Fibration value 127 - .o files

Overlap from 128/4=3D32 and we use offset 30 is because control
characters (those we do not use in file names) are in 0-31 range so we
will never use those values.

I also changed name of fibration plugin to ext_1234 to better reflect
the real function of plugin.

This is all still RFC as I made no changes to reiser4progs yet.

Dushan
> Thanks
>
> Dushan

--001a1140216249d4a5054477b949
Content-Type: application/octet-stream; name="fibration_ext_1234.2.patch"
Content-Disposition: attachment; filename="fibration_ext_1234.2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ix4eoqjj1

U2lnbmVkLW9mZi1ieTpEdXNoYW4gVGNob2xpY2ggPGR1c2FuY0BnbWFpbC5jb20+CgotLS0gbGlu
dXgtNC44LjE1LWdlbnRvby9mcy9yZWlzZXI0L3BsdWdpbi9maWJyYXRpb24uaAkyMDE2LTEyLTI0
IDE4OjIyOjA5LjY4MzY0NjE0NyArMDEwMAorKysgbGludXgvZnMvcmVpc2VyNC9wbHVnaW4vZmli
cmF0aW9uLmgJMjAxNi0xMi0yNSAwOTozMDoxNi41ODUxNTMwOTMgKzAxMDAKQEAgLTIwLDYgKzIw
LDcgQEAgdHlwZWRlZiBlbnVtIHsKIAlGSUJSQVRJT05fRE9UX08sCiAJRklCUkFUSU9OX0VYVF8x
LAogCUZJQlJBVElPTl9FWFRfMywKKwlGSUJSQVRJT05fRVhUXzEyMzQsCiAJTEFTVF9GSUJSQVRJ
T05fSUQKIH0gcmVpc2VyNF9maWJyYXRpb25faWQ7CiAKLS0tIGxpbnV4LTQuOC4xNS1nZW50b28v
ZnMvcmVpc2VyNC9wbHVnaW4vZmlicmF0aW9uLmMJMjAxNi0xMi0yNCAxODoyMjowOS42Nzk2NDU5
NzEgKzAxMDAKKysrIGxpbnV4L2ZzL3JlaXNlcjQvcGx1Z2luL2ZpYnJhdGlvbi5jCTIwMTYtMTIt
MjUgMDk6Mjk6NTguMDkyMzQwMzU1ICswMTAwCkBAIC04MSw2ICs4MSwzMSBAQCBzdGF0aWMgX191
NjQgZmlicmVfZXh0XzMoY29uc3Qgc3RydWN0IGluCiAJCXJldHVybiBGSUJSRV9OTygwKTsKIH0K
IAorLyoKKyogZXh0LjEyMzQgZmlicmF0aW9uOiB0cnkgdG8gc2VwYXJhdGUgZmlsZXMgd2l0aCBk
aWZmZXJlbnQgMSwgMiwgMyBhbmQgNC1jaGFyYWN0ZXIKKyogZXh0ZW5zaW9ucyBmcm9tIGVhY2gg
b3RoZXIgaW4gZ3JvdXBzIG9mIDMwIGVhY2ggYW5kIHB1dCBldmVyeXRoaW5nIGVsc2UgYWZ0ZXIK
KyogdGhlbSAoZ3JvdXAgMTI2KSB3aXRoIC5vIGZpbGVzIGF0IHRoZSBlbmQgKGdyb3VwIDEyNyku
CisqLworCitzdGF0aWMgX191NjQgZmlicmVfZXh0XzEyMzQoY29uc3Qgc3RydWN0IGlub2RlICpk
aXIsIGNvbnN0IGNoYXIgKm5hbWUsIGludCBsZW4pCit7CisJaWYgKGxlbiA+IDUgJiYgbmFtZVts
ZW4gLSA1XSA9PSAnLicpCisJCXJldHVybiBGSUJSRV9OTyhuYW1lW2xlbiAtIDRdICsgbmFtZVts
ZW4gLSAzXSArIG5hbWVbbGVuIC0gMl0gKworCQkJCW5hbWVbbGVuIC0gMV0pIC8gMTYgKyA5MCk7
CisJZWxzZSBpZiAobGVuID4gNCAmJiBuYW1lW2xlbiAtIDRdID09ICcuJykKKwkJcmV0dXJuIEZJ
QlJFX05PKChuYW1lW2xlbiAtIDNdICsgbmFtZVtsZW4gLSAyXSArCisJCQkJbmFtZVtsZW4gLSAx
XSkgLyAxMiArIDYwKTsKKwllbHNlIGlmIChsZW4gPiAzICYmIG5hbWVbbGVuIC0gM10gPT0gJy4n
KQorCQlyZXR1cm4gRklCUkVfTk8oKG5hbWVbbGVuIC0gMl0gKyBuYW1lW2xlbiAtIDFdKSAvIDgg
KyAzMCk7CisJLyogc3BlY2lhbCB0cmVhdG1lbnQgZm9yIC4qXC5vICovCisJZWxzZSBpZiAobGVu
ID4gMiAmJiBuYW1lW2xlbiAtIDFdID09ICdvJyAmJiBuYW1lW2xlbiAtIDJdID09ICcuJykKKwkJ
cmV0dXJuIEZJQlJFX05PKDEyNyk7CisJZWxzZSBpZiAobGVuID4gMiAmJiBuYW1lW2xlbiAtIDJd
ID09ICcuJykKKwkJcmV0dXJuIEZJQlJFX05PKChuYW1lW2xlbiAtIDFdKSAvIDQpOworCWVsc2UK
KwkJcmV0dXJuIEZJQlJFX05PKDEyNik7Cit9IAorCiBzdGF0aWMgaW50IGNoYW5nZV9maWJyYXRp
b24oc3RydWN0IGlub2RlICppbm9kZSwKIAkJCSAgICByZWlzZXI0X3BsdWdpbiAqIHBsdWdpbiwK
IAkJCSAgICBwc2V0X21lbWJlciBtZW1iKQpAQCAtMTYxLDcgKzE4NiwxOCBAQCBmaWJyYXRpb25f
cGx1Z2luIGZpYnJhdGlvbl9wbHVnaW5zW0xBU1RfCiAJCQkubGlua2FnZSA9IHtOVUxMLCBOVUxM
fQogCQl9LAogCQkuZmlicmUgPSBmaWJyZV9leHRfMwotCX0KKwl9LAorICAgICAgICBbRklCUkFU
SU9OX0VYVF8xMjM0XSA9IHsKKyAgICAgICAgICAgICAgICAuaCA9IHsKKyAgICAgICAgICAgICAg
ICAgICAgICAgIC50eXBlX2lkID0gUkVJU0VSNF9GSUJSQVRJT05fUExVR0lOX1RZUEUsCisgICAg
ICAgICAgICAgICAgICAgICAgICAuaWQgPSBGSUJSQVRJT05fRVhUXzEyMzQsCisgICAgICAgICAg
ICAgICAgICAgICAgICAucG9wcyA9ICZmaWJyYXRpb25fcGx1Z2luX29wcywKKyAgICAgICAgICAg
ICAgICAgICAgICAgIC5sYWJlbCA9ICJleHQtMTIzNCIsCisgICAgICAgICAgICAgICAgICAgICAg
ICAuZGVzYyA9ICJmaWJyYXRlIGZpbGUgYnkgMSwgMiwgMyBhbmQgNCBjaGFyYWN0ZXIgZXh0ZW5z
aW9uIiwKKyAgICAgICAgICAgICAgICAgICAgICAgIC5saW5rYWdlID0ge05VTEwsIE5VTEx9Cisg
ICAgICAgICAgICAgICAgfSwKKyAgICAgICAgICAgICAgICAuZmlicmUgPSBmaWJyZV9leHRfMTIz
NAorICAgICAgICB9CiB9OwogCiAvKgo=
--001a1140216249d4a5054477b949--
