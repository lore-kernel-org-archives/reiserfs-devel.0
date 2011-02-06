From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Sun, 06 Feb 2011 23:28:09 +0100
Message-ID: <4D4F2079.2080407@gmail.com>
References: <4D4B1887.3020306@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020908080702060302090004"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type;
        bh=/VukKrN0Yi1KMZRgU4EC+7RvZgivz77q20DTwoR02qA=;
        b=IMjmiDNhEmUE/eTYqMATkzvjwQjYLV/SjrUzx4Aw9pHPG78eCD7kIqZ+X6jAW8ql9w
         wel4GaykcG29MPTI4DDrP7hDPkZgS92kmKRYtjCKxgn3XZiomG9fyoS1D84IhwQO9aeG
         ta+yJnsrXG2l/ya6mBhoe9Q3rOjpKzhc9VOBw=
In-Reply-To: <4D4B1887.3020306@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------020908080702060302090004
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

I have taken a look at your problem on weekends.

Please, apply the attached patch to reiser4progs-1.0.7,
and check your partition again. The patched fsck after
check phase should report about minor corruption and
suggest to repair it with --fix option.

Please, report about results.

Thanks,
Edward.


On 02/03/2011 10:05 PM, Gleb Baryshev wrote:
> 03.02.2011 22:09, Edward Shishkin writes:
>> Sorry, but this file looks corrupted.
>> Could you please try again?
>>
>> Also make sure that packed meta-data are
>> extracted correctly by the following way:
>>
>> #touch meta_tmp
>> #bzcat meta.bz2 | debugfs.reiser4 -U meta_tmp
>
> For some reason, debugfs was adding junk every time - 8 bytes (1B 5B 3F
> 31 30 33 34 68) before 'VRSN'; in other respects the metadata file is
> all right. Finally I ran debugfs from LiveCD and got correct dump:
> http://tootiny.net/813h25
>
> BTW, fsck from LiveCD segfaulted, too.
>
> Gleb
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html


--------------020908080702060302090004
Content-Type: text/plain;
 name="fsck-dont-allocate-unalloc-extents.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fsck-dont-allocate-unalloc-extents.patch"

RG9uJ3QgdHJ5IHRvIGFsbG9jYXRlIHVuYWxsb2NhdGVkIGV4dGVudHMuCgpTaWduZWQtb2Zm
LWJ5OiBFZHdhcmQgU2hpc2hraW4gPGVkd2FyZC5zaGlzaGtpbkBnbWFpbC5jb20+Ci0tLQog
bGlicmVpc2VyNC90cmVlLmMgfCAgICA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLS0gcmVpc2VyNHByb2dzLTEuMC43Lm9yaWcv
bGlicmVpc2VyNC90cmVlLmMKKysrIHJlaXNlcjRwcm9ncy0xLjAuNy9saWJyZWlzZXI0L3Ry
ZWUuYwpAQCAtMTM0Niw3ICsxMzQ2LDcgQEAgZXJybm9fdCByZWlzZXI0X3RyZWVfYWRqdXN0
KHJlaXNlcjRfdHJlZQogI2lmbmRlZiBFTkFCTEVfTUlOSU1BTAogCQkJcmVzID0gcmVpc2Vy
NF90cmVlX3dhbGtfbm9kZSh0cmVlLCB0cmVlLT5yb290LCAKIAkJCQkJCSAgICAgY2Jfbm9k
ZV9hZGp1c3QsCi0JCQkJCQkgICAgIGNiX25vZGVwdHJfYWRqdXN0LAorCQkJCQkJICAgICBO
VUxMLAogCQkJCQkJICAgICBjYl9ub2RlX3VubG9hZCk7CiAjZWxzZQogCQkJcmVzID0gcmVp
c2VyNF90cmVlX3dhbGtfbm9kZSh0cmVlLCB0cmVlLT5yb290LCAKQEAgLTE1ODYsNyArMTU4
Niw3IEBAIGVycm5vX3QgcmVpc2VyNF90cmVlX3N5bmMocmVpc2VyNF90cmVlX3QKIAkgICBl
dmVyeXRoaW5nLiAqLwogCWlmICgocmVzID0gcmVpc2VyNF90cmVlX3dhbGtfbm9kZSh0cmVl
LCB0cmVlLT5yb290LCAKIAkJCQkJICBjYl9ub2RlX2FkanVzdCwKLQkJCQkJICBjYl9ub2Rl
cHRyX2FkanVzdCwKKwkJCQkJICBOVUxMLAogCQkJCQkgIGNiX25vZGVfdW5sb2FkKSkpCiAJ
ewogCQlhYWxfZXJyb3IoIkNhbid0IHNhdmUgZm9ybWF0dGVkIG5vZGVzIHRvIGRldmljZS4i
KTsK
--------------020908080702060302090004--
