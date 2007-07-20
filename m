From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Reiser4 performance bottlenecks and possible solutions
Date: Fri, 20 Jul 2007 21:12:38 +0800
Message-ID: <6ec7a4340707200612h47394f95o8d907c60f7fbd7e8@mail.gmail.com>
References: <20070719212617.GA9075@physik.fu-berlin.de>
	 <6ec7a4340707200609l18697bb2n199e95a56a309f9f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_157545_22128955.1184937158291"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:references;
        b=M3xsffX1QEC8JM40qhALDroMBZME1P9ChJEnbmbRzihdMX0bZyyOsuEAj36qyWQ9qi3wYhbM8b56Qm6bbfOrnFjITg/OPGxfruRQnpsQ/vOtVuN0/XDeyMlaBPu1KB3AViZ6ADxHygydzIUgAIIND+HH+87cOAhhqpi5i1z8Pp4=
In-Reply-To: <6ec7a4340707200609l18697bb2n199e95a56a309f9f@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, reiserfs-devel@vger.kernel.org, Edward Shishkin <edward@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>

------=_Part_157545_22128955.1184937158291
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

I suspect your problem of "syncing for minutes" might be:

1, Not having a mount option "noatime,nodiratime"
2, Application sync/fsync/O_SYNC... too much
3, Memory size >>>> Disk write speed(what atom_max_size matters)

You may add the mount option yourself, the patch(for
"reiser4-for-2.6.21.patch.gz") added a mount option "fsync" as said
before(the default value is 100):

"Terrible fsync() performance has been talked for a thousand times
without a full solution. I'm thinking of a temporary solution: adding
a mount option and let the user determine the fsync() frequency(yes,
you may lose data when power-fail), things like:
you may use "#mount /dev/sda1 /mnt/tmp -o fsync=10" which means "fsync
once when invoked fsync 10 times""

The "atom_max_size" mount option seemed useless, so the only way is
modify the source code and re-compile. The patch modified the default
value of 1/4 mem_size to 1/8 mem_size which means if your HDD performs
a 30MB/s in "hdparm -t" and your RAM is 512MB, you would have
theoretically maximum 2 seconds waiting for atoms writing to
disk(change the value as you wish).

At last, if you're paranoid enough for performance, use
"formatting=extents" when mkfs.reiser4. Although tailing saves 5%-10%
space, you gain more performance from do_sync_read().

Thanks!

2007/7/20, Adrian Glaubitz <glaubitz@physik.fu-berlin.de>:
> Hello,
>
> I found your posting on gmane about improvement for the reiser4-code
> to overcome some performance bottlenecks. I'm using reiser4 for my
> root-partiotion on my laptop and the disk is occasionally very
> busy with syncing for minutes. So, if possible, can you send
> me your patches to test them ?
>
>
> Adrian
>

------=_Part_157545_22128955.1184937158291
Content-Type: application/octet-stream; name="reiser4-perf-gain.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reiser4-perf-gain.patch"
X-Attachment-Id: f_f4cowhon

LS0tIGxpbnV4LTIuNi4yMS9mcy9yZWlzZXI0L3N1cGVyX29wcy5jLm9yaWcKKysrIGxpbnV4LTIu
Ni4yMS9mcy9yZWlzZXI0L3N1cGVyX29wcy5jCkBAIC00NDksNiArNDQ5LDcgQEAKIAkJICAgc2Jp
bmZvLT50bWdyLmF0b21fbWF4X2ZsdXNoZXJzKTsKIAlzZXFfcHJpbnRmKG0sICIsY2JrX2NhY2hl
X3Nsb3RzPTB4JXgiLAogCQkgICBzYmluZm8tPnRyZWUuY2JrX2NhY2hlLm5yX3Nsb3RzKTsKKwlz
ZXFfcHJpbnRmKG0sICIsZnN5bmM9JWQiLCBzYmluZm8tPmZzeW5jKTsKIAogCXJldHVybiAwOwog
fQotLS0gbGludXgtMi42LjIxL2ZzL3JlaXNlcjQvc3VwZXIuaC5vcmlnCisrKyBsaW51eC0yLjYu
MjEvZnMvcmVpc2VyNC9zdXBlci5oCkBAIC0xOTYsNiArMTk2LDggQEAKIAkvKiBmaWxlLXN5c3Rl
bSB3aWRlIGZsYWdzLiBTZWUgcmVpc2VyNF9mc19mbGFnIGVudW0gKi8KIAl1bnNpZ25lZCBsb25n
IGZzX2ZsYWdzOwogCisJaW50IGZzeW5jOworCiAJLyogdHJhbnNhY3Rpb24gbWFuYWdlciAqLwog
CXR4bl9tZ3IgdG1ncjsKIAotLS0gbGludXgtMi42LjIxL2ZzL3JlaXNlcjQvaW5pdF9zdXBlci5j
Lm9yaWcKKysrIGxpbnV4LTIuNi4yMS9mcy9yZWlzZXI0L2luaXRfc3VwZXIuYwpAQCAtMzA1LDYg
KzMwNSw4IEBACiAJb3B0X2Rlc2NfdCAqb3B0cywgKnA7CiAJcmVpc2VyNF9zdXBlcl9pbmZvX2Rh
dGEgKnNiaW5mbyA9IGdldF9zdXBlcl9wcml2YXRlKHN1cGVyKTsKIAorCXNiaW5mby0+ZnN5bmMg
PSAxMDA7CisKIAkvKiBpbml0aWFsaXplIHN1cGVyLCBleHBvcnQsIGRlbnRyeSBvcGVyYXRpb25z
ICovCiAJc2JpbmZvLT5vcHMuc3VwZXIgPSByZWlzZXI0X3N1cGVyX29wZXJhdGlvbnM7CiAJc2Jp
bmZvLT5vcHMuZXhwb3J0ID0gcmVpc2VyNF9leHBvcnRfb3BlcmF0aW9uczsKQEAgLTMxMyw3ICsz
MTUsNyBAQAogCXN1cGVyLT5zX2V4cG9ydF9vcCA9ICZzYmluZm8tPm9wcy5leHBvcnQ7CiAKIAkv
KiBpbml0aWFsaXplIHRyYW5zYWN0aW9uIG1hbmFnZXIgcGFyYW1ldGVycyB0byBkZWZhdWx0IHZh
bHVlcyAqLwotCXNiaW5mby0+dG1nci5hdG9tX21heF9zaXplID0gdG90YWxyYW1fcGFnZXMgLyA0
OworCXNiaW5mby0+dG1nci5hdG9tX21heF9zaXplID0gdG90YWxyYW1fcGFnZXMgLyA4OwogCXNi
aW5mby0+dG1nci5hdG9tX21heF9hZ2UgPSBSRUlTRVI0X0FUT01fTUFYX0FHRSAvIEhaOwogCXNi
aW5mby0+dG1nci5hdG9tX21pbl9zaXplID0gMjU2OwogCXNiaW5mby0+dG1nci5hdG9tX21heF9m
bHVzaGVycyA9IEFUT01fTUFYX0ZMVVNIRVJTOwotLS0gbGludXgtMi42LjIxL2ZzL3JlaXNlcjQv
cGx1Z2luL2ZpbGUvZmlsZS5jLm9yaWcKKysrIGxpbnV4LTIuNi4yMS9mcy9yZWlzZXI0L3BsdWdp
bi9maWxlL2ZpbGUuYwpAQCAtMjIsNiArMjIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BhZ2V2ZWMu
aD4KICNpbmNsdWRlIDxsaW51eC9zeXNjYWxscy5oPgogCitpbnQgZnN5bmNfbnVtID0gMDsKIAog
c3RhdGljIGludCB1bnBhY2soc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBpbm9kZSAqaW5vZGUs
IGludCBmb3JldmVyKTsKIHN0YXRpYyB2b2lkIGRyb3BfYWNjZXNzKHVuaXhfZmlsZV9pbmZvX3Qg
Kik7CkBAIC0xNDAzLDIyICsxNDA0LDQzIEBACiAJcmVpc2VyNF9jb250ZXh0ICpjdHg7CiAJdHhu
X2F0b20gKmF0b207CiAJcmVpc2VyNF9ibG9ja19uciByZXNlcnZlOworCXJlaXNlcjRfc3VwZXJf
aW5mb19kYXRhICpzYmluZm87CiAKIAljdHggPSByZWlzZXI0X2luaXRfY29udGV4dChkZW50cnkt
PmRfaW5vZGUtPmlfc2IpOwogCWlmIChJU19FUlIoY3R4KSkKIAkJcmV0dXJuIFBUUl9FUlIoY3R4
KTsKIAotCXJlc2VydmUgPSBlc3RpbWF0ZV91cGRhdGVfY29tbW9uKGRlbnRyeS0+ZF9pbm9kZSk7
Ci0JaWYgKHJlaXNlcjRfZ3JhYl9zcGFjZShyZXNlcnZlLCBCQV9DQU5fQ09NTUlUKSkgeworCXNi
aW5mbyA9IGdldF9jdXJyZW50X3N1cGVyX3ByaXZhdGUoKTsKKwlpZiAoc2JpbmZvLT5mc3luYyA9
PSAwKQorCXsKIAkJcmVpc2VyNF9leGl0X2NvbnRleHQoY3R4KTsKLQkJcmV0dXJuIFJFVEVSUigt
RU5PU1BDKTsKKwkJcmV0dXJuIDA7CisJfQorCWVsc2UgaWYgKHNiaW5mby0+ZnN5bmMgPT0gMSkK
Kwl7Citmc3luY19maWxlOglyZXNlcnZlID0gZXN0aW1hdGVfdXBkYXRlX2NvbW1vbihkZW50cnkt
PmRfaW5vZGUpOworCQlpZiAocmVpc2VyNF9ncmFiX3NwYWNlKHJlc2VydmUsIEJBX0NBTl9DT01N
SVQpKSB7CisJCQlyZWlzZXI0X2V4aXRfY29udGV4dChjdHgpOworCQkJcmV0dXJuIFJFVEVSUigt
RU5PU1BDKTsKKwkJfQorCQl3cml0ZV9zZF9ieV9pbm9kZV9jb21tb24oZGVudHJ5LT5kX2lub2Rl
KTsKKwkJCQkJCQkJCisJCWF0b20gPSBnZXRfY3VycmVudF9hdG9tX2xvY2tlZCgpOworCQlzcGlu
X2xvY2tfdHhuaChjdHgtPnRyYW5zKTsKKwkJZm9yY2VfY29tbWl0X2F0b20oY3R4LT50cmFucyk7
CisJCXJlaXNlcjRfZXhpdF9jb250ZXh0KGN0eCk7CisJCXJldHVybiAwOworCX0KKwllbHNlIGlm
IChzYmluZm8tPmZzeW5jID4gMSkKKwl7CisJCWZzeW5jX251bSsrOworCQlpZiAoZnN5bmNfbnVt
ID49IHNiaW5mby0+ZnN5bmMpIHsKKwkJCWZzeW5jX251bSA9IDA7CisJCQlnb3RvIGZzeW5jX2Zp
bGU7CisJCX0KKwkJcmVpc2VyNF9leGl0X2NvbnRleHQoY3R4KTsKKwkJcmV0dXJuIDA7CiAJfQot
CXdyaXRlX3NkX2J5X2lub2RlX2NvbW1vbihkZW50cnktPmRfaW5vZGUpOwotCi0JYXRvbSA9IGdl
dF9jdXJyZW50X2F0b21fbG9ja2VkKCk7Ci0Jc3Bpbl9sb2NrX3R4bmgoY3R4LT50cmFucyk7Ci0J
Zm9yY2VfY29tbWl0X2F0b20oY3R4LT50cmFucyk7Ci0JcmVpc2VyNF9leGl0X2NvbnRleHQoY3R4
KTsKIAlyZXR1cm4gMDsKIH0KIAo=
------=_Part_157545_22128955.1184937158291--
