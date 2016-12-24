From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [RFC] Change /proc/mounts values to human readable form
Date: Sat, 24 Dec 2016 18:43:34 +0100
Message-ID: <CADW=+3m4M7tpFtViYoXWyeqUn4qsozDU-Px9mKkZu9s6VPU-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a113e5684bc0c7505446b0a50
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7C8aRpurw2dPhdcEwwJh6hIcikS8qONOLsRI8ZYU5ME=;
        b=fXNv36pC3lswzwrsZOGmxyzenVPbTcvDHyW4JgFqTuIDvF7C2zR8Kgds9tCjOVQAve
         i//taGZfzGnbGgvqOR8satYa929TQLYxwxgjdy5pHgoTKdgwFNEss9W7AABHTx3FR2Vf
         xJ2EON7yBs/SKeiloAjLnskG2JOHiRglBuS9JZ6OZMRcMoP4mmH4uZqXhCfaW59v/UYq
         mKoC2TWhO2bMQHpRgHe8JgOR+fWY56OMY2ZAjjPKnr/P7ENbmzl4m6eZtmvVLHvkxCH8
         ARTw9Gjl9mepJgIrace1xUgQOOfE5t1HPokv8YyO5Sh4arhewalQvRC7rqYlA3pkEZQw
         a3Hg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

--001a113e5684bc0c7505446b0a50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Values in /proc/mounts were in hex format so the attached patch
modifies them to human readable form.
It doesn't print out units (seconds, bytes, pages) but I can make it
if it's desirable because it's not obvious that some values are in nr
of pages.



Du=C5=A1an

--001a113e5684bc0c7505446b0a50
Content-Type: application/octet-stream; name="modify_proc_mounts.patch"
Content-Disposition: attachment; filename="modify_proc_mounts.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ix3il4zi0

U2lnbmVkLW9mZi1ieTpEdXNoYW4gVGNob2xpY2ggPGR1c2FuY0BnbWFpbC5jb20+CgotLS0gbGlu
dXgtNC44LjE1LWdlbnRvby9mcy9yZWlzZXI0L3N1cGVyX29wcy5jCTIwMTYtMTItMjQgMTg6MjI6
MDkuODE5NjUyMTI0ICswMTAwCisrKyBsaW51eC00LjguMTEtZ2VudG9vLW1vZC9mcy9yZWlzZXI0
L3N1cGVyX29wcy5jCTIwMTYtMTItMjQgMTg6Mjg6MzMuODg0NTMxMzIwICswMTAwCkBAIC00Njcs
MTMgKzQ2NywxMiBAQCBzdGF0aWMgaW50IHJlaXNlcjRfc2hvd19vcHRpb25zKHN0cnVjdCBzCiAJ
c3VwZXIgPSBkZW50cnktPmRfc2I7CiAJc2JpbmZvID0gZ2V0X3N1cGVyX3ByaXZhdGUoc3VwZXIp
OwogCi0Jc2VxX3ByaW50ZihtLCAiLGF0b21fbWF4X3NpemU9MHgleCIsIHNiaW5mby0+dG1nci5h
dG9tX21heF9zaXplKTsKLQlzZXFfcHJpbnRmKG0sICIsYXRvbV9tYXhfYWdlPTB4JXgiLCBzYmlu
Zm8tPnRtZ3IuYXRvbV9tYXhfYWdlKTsKLQlzZXFfcHJpbnRmKG0sICIsYXRvbV9taW5fc2l6ZT0w
eCV4Iiwgc2JpbmZvLT50bWdyLmF0b21fbWluX3NpemUpOwotCXNlcV9wcmludGYobSwgIixhdG9t
X21heF9mbHVzaGVycz0weCV4IiwKKwlzZXFfcHJpbnRmKG0sICIsYXRvbV9tYXhfc2l6ZT0ldSIs
IHNiaW5mby0+dG1nci5hdG9tX21heF9zaXplKTsKKwlzZXFfcHJpbnRmKG0sICIsYXRvbV9tYXhf
YWdlPSV1Iiwgc2JpbmZvLT50bWdyLmF0b21fbWF4X2FnZSAvIEhaKTsKKwlzZXFfcHJpbnRmKG0s
ICIsYXRvbV9taW5fc2l6ZT0ldSIsIHNiaW5mby0+dG1nci5hdG9tX21pbl9zaXplKTsKKwlzZXFf
cHJpbnRmKG0sICIsYXRvbV9tYXhfZmx1c2hlcnM9JXUiLAogCQkgICBzYmluZm8tPnRtZ3IuYXRv
bV9tYXhfZmx1c2hlcnMpOwotCXNlcV9wcmludGYobSwgIixjYmtfY2FjaGVfc2xvdHM9MHgleCIs
Ci0JCSAgIHNiaW5mby0+dHJlZS5jYmtfY2FjaGUubnJfc2xvdHMpOworCXNlcV9wcmludGYobSwg
IixvcHRpbWFsX2lvX3NpemU9JWx1Iiwgc2JpbmZvLT5vcHRpbWFsX2lvX3NpemUpOwogCiAJcmV0
dXJuIDA7CiB9Cg==
--001a113e5684bc0c7505446b0a50--
