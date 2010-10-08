From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel Ooops when using kdesu
Date: Fri, 08 Oct 2010 11:22:03 +0200
Message-ID: <4CAEE2BB.4050500@gmail.com>
References: <20101007203544.222170@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000009090809060504030000"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20101007203544.222170@gmx.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?U3ZlbiBNw7xsbGVy?= <musv@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000009090809060504030000
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Sven Müller wrote:
> Hi Edward, 
>
> according to the advice in Gentoo Forums: 
>
> http://forums.gentoo.org/viewtopic-t-845764.html
>
> I'll send you the bug report. 
>   

Hello.
Could you please try the attached patch and report about results?

Thanks,
Edward.


> Behaviour: 
> When I try start a program via kdesu (KDE4) I'll get a Kernel Ooops. It's reproducible. The Ooops occurs on x86 and amd64. I've tested it on 2.6.34 and on 2.6.35 (r1 and r5). And until now it seems that only kdesu is affected. 
>
> Configuration:
> Kernel: Gentoo-Sources-2.6.35-r5
> Root Device is Reiser4
> Reiser4 Patch is from Kernel.org (Reiser4-for-2.6.35.patch)
> CPU: x86
> The Posting in Gentoo Forums (Link) is from a amd64. 
>
> /var/log/messages:
>
> Oct  7 22:26:32 localhost kernel: BUG: unable to handle kernel NULL pointer dereference at (null)
> Oct  7 22:26:32 localhost kernel: IP: [<c01b846a>] checkin_logical_cluster+0xb1/0x176
> Oct  7 22:26:32 localhost kernel: *pde = 00000000 
> Oct  7 22:26:32 localhost kernel: Oops: 0000 [#1] 
> Oct  7 22:26:32 localhost kernel: last sysfs file: /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
> Oct  7 22:26:32 localhost kernel: Modules linked in: pcmcia
> Oct  7 22:26:32 localhost kernel: 
> Oct  7 22:26:32 localhost kernel: Pid: 2306, comm: kio_file Not tainted 2.6.35-gentoo-r5 #2 Latitude C610            /Latitude C610                   
> Oct  7 22:26:32 localhost kernel: EIP: 0060:[<c01b846a>] EFLAGS: 00010246 CPU: 0
> Oct  7 22:26:32 localhost kernel: EIP is at checkin_logical_cluster+0xb1/0x176
> Oct  7 22:26:32 localhost kernel: EAX: 00000001 EBX: c9176d58 ECX: 00000000 EDX: 00000000
> Oct  7 22:26:32 localhost kernel: ESI: 00000000 EDI: 00000000 EBP: cb572eb4 ESP: c9176d14
> Oct  7 22:26:32 localhost kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> Oct  7 22:26:32 localhost kernel: Process kio_file (pid: 2306, ti=c9176000 task=cb376360 task.ti=c9176000)
> Oct  7 22:26:32 localhost kernel: Stack:
> Oct  7 22:26:32 localhost kernel: 00000000 c9176d58 00000000 cb572eb4 00000000 c9176d58 00000000 cb572eb4
> Oct  7 22:26:32 localhost kernel: <0> 00000000 c01bacff 00000000 c9192100 00000000 0000000d cb572eb4 c01baf36
> Oct  7 22:26:32 localhost kernel: <0> fffffff4 00000000 00000000 00000000 00000000 00000001 00000000 00000000
> Oct  7 22:26:32 localhost kernel: Call Trace:
> Oct  7 22:26:32 localhost kernel: [<c01bacff>] ? capture_page_cluster+0xa2/0xc7
> Oct  7 22:26:32 localhost kernel: [<c01baf36>] ? write_end_cryptcompress+0x212/0x222
> Oct  7 22:26:32 localhost kernel: [<c01b7455>] ? reiser4_write_end_careful+0xe8/0x153
> Oct  7 22:26:32 localhost kernel: [<c0148127>] ? pagecache_write_end+0x37/0x3e
> Oct  7 22:26:32 localhost kernel: [<c01ac107>] ? reiser4_dirty_inode+0x8/0x59
> Oct  7 22:26:32 localhost kernel: [<c017c356>] ? pipe_to_file+0x109/0x114
> Oct  7 22:26:32 localhost kernel: [<c01ac107>] ? reiser4_dirty_inode+0x8/0x59
> Oct  7 22:26:32 localhost kernel: [<c01ac107>] ? reiser4_dirty_inode+0x8/0x59
> Oct  7 22:26:32 localhost kernel: [<c017b3ff>] ? splice_from_pipe_feed+0x31/0x9e
> Oct  7 22:26:32 localhost kernel: [<c017c24d>] ? pipe_to_file+0x0/0x114
> Oct  7 22:26:32 localhost kernel: [<c017c1c0>] ? generic_file_splice_write+0xa2/0x12f
> Oct  7 22:26:32 localhost kernel: [<c017c11e>] ? generic_file_splice_write+0x0/0x12f
> Oct  7 22:26:32 localhost kernel: [<c017bca0>] ? vfs_splice_from+0x53/0x5a
> Oct  7 22:26:32 localhost kernel: [<c017c093>] ? direct_splice_actor+0x14/0x18
> Oct  7 22:26:32 localhost kernel: [<c017bb35>] ? splice_direct_to_actor+0xbe/0x172
> Oct  7 22:26:32 localhost kernel: [<c017c07f>] ? direct_splice_actor+0x0/0x18
> Oct  7 22:26:32 localhost kernel: [<c017bc34>] ? do_splice_direct+0x4b/0x64
> Oct  7 22:26:32 localhost kernel: [<c0166440>] ? do_sendfile+0x16c/0x1b5
> Oct  7 22:26:32 localhost kernel: [<c01664c9>] ? sys_sendfile64+0x40/0x86
> Oct  7 22:26:32 localhost kernel: [<c0102510>] ? sysenter_do_call+0x12/0x26
> Oct  7 22:26:32 localhost kernel: Code: 01 74 09 31 f6 83 f8 02 75 1e eb 05 8b 73 3c eb 17 8b 43 0c 31 ff 8b 70 04 03 30 81 c6 ff 0f 00 00 83 d7 00 0f ac fe 0c 8b 7b 48 <8b> 07 f6 c4 01 74 24 89 e8 e8 2f 4a fe ff e8 ac a3 fe ff 8b 4b 
> Oct  7 22:26:32 localhost kernel: EIP: [<c01b846a>] checkin_logical_cluster+0xb1/0x176 SS:ESP 0068:c9176d14
> Oct  7 22:26:32 localhost kernel: CR2: 0000000000000000
> Oct  7 22:26:32 localhost kernel: ---[ end trace 401667030bed02db ]---
>
>
> addr2line -e /usr/src/linux/vmlinux -i c01b846a:
>
> /usr/src/linux/fs/reiser4/plugin/file/cryptcompress.c:1722
> /usr/src/linux/fs/reiser4/plugin/file/cryptcompress.c:1780
>
> Let me know if you need any further information. I would be glad if I could help you. 
>
> Thx 
> Sven
>   



--------------000009090809060504030000
Content-Type: text/plain;
 name="reiser4-fix-write_begin_end_aops.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="reiser4-fix-write_begin_end_aops.patch"

Rml4IHdyaXRlX2VuZF9jcnlwdGNvbXByZXNzKCk6CnVwZGF0ZSBpX3NpemUsIGlmIHBvcyAr
IGNvdW50ID4gb2xkIGlfc2l6ZS4KClNpZ25lZC1vZmYtYnk6IEVkd2FyZCBTaGlzaGtpbiA8
ZWR3YXJkLnNoaXNoa2luQGdtYWlsLmNvbT4KLS0tCiBmcy9yZWlzZXI0L3BsdWdpbi9maWxl
L2NyeXB0Y29tcHJlc3MuYyAgIHwgICA0NyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tCiBmcy9yZWlzZXI0L3BsdWdpbi9maWxlL2ZpbGUuYyAgICAgICAgICAgIHwgICAgMiAt
CiBmcy9yZWlzZXI0L3BsdWdpbi9maWxlL2ZpbGUuaCAgICAgICAgICAgIHwgICAgNCArLQog
ZnMvcmVpc2VyNC9wbHVnaW4vZmlsZS9maWxlX2NvbnZlcnNpb24uYyB8ICAgIDYgLS0tCiBm
cy9yZWlzZXI0L3BsdWdpbi9wbHVnaW4uaCAgICAgICAgICAgICAgIHwgICAgMiAtCiA1IGZp
bGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKLS0tIGxp
bnV4LTIuNi4zNS5vcmlnL2ZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvY3J5cHRjb21wcmVzcy5j
CisrKyBsaW51eC0yLjYuMzUvZnMvcmVpc2VyNC9wbHVnaW4vZmlsZS9jcnlwdGNvbXByZXNz
LmMKQEAgLTM3NDksMTMgKzM3NDksMTQgQEAgaW50IHdyaXRlX2JlZ2luX2NyeXB0Y29tcHJl
c3Moc3RydWN0IGZpbAogCiAvKiBwbHVnaW4tPmNvbW1pdF93cml0ZSAqLwogaW50IHdyaXRl
X2VuZF9jcnlwdGNvbXByZXNzKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgcGFnZSAqcGFn
ZSwKLQkJCSAgdW5zaWduZWQgZnJvbSwgdW5zaWduZWQgdG8pCisJCQkgICAgbG9mZl90IHBv
cywgdW5zaWduZWQgY29waWVkKQogewotCWludCByZXQ7CisJaW50IHJldCA9IDA7CiAJaGlu
dF90ICpoaW50OwogCWxvY2tfaGFuZGxlICpsaDsKIAlzdHJ1Y3QgaW5vZGUgKiBpbm9kZTsK
IAlzdHJ1Y3QgY2x1c3Rlcl9oYW5kbGUgY2x1c3Q7CisJc3RydWN0IHJlaXNlcjRfc2xpZGUg
KndpbiA9IE5VTEw7CiAKIAl1bmxvY2tfcGFnZShwYWdlKTsKIApAQCAtMzc2OSwxNyArMzc3
MCw0MSBAQCBpbnQgd3JpdGVfZW5kX2NyeXB0Y29tcHJlc3Moc3RydWN0IGZpbGUgCiAJY2x1
c3Rlcl9pbml0X3JlYWQoJmNsdXN0LCBOVUxMKTsKIAljbHVzdC5oaW50ID0gaGludDsKIAot
CXJldCA9IGFsbG9jX2NsdXN0ZXJfcGdzZXQoJmNsdXN0LCBjbHVzdGVyX25ycGFnZXMoaW5v
ZGUpKTsKLQlpZiAocmV0KQotCQlnb3RvIG91dDsKLQljbHVzdC5pbmRleCA9IHBnX3RvX2Ns
dXN0KHBhZ2UtPmluZGV4LCBpbm9kZSk7Ci0JcmV0ID0gY2FwdHVyZV9wYWdlX2NsdXN0ZXIo
JmNsdXN0LCBpbm9kZSk7Ci0JaWYgKHJldCkKLQkJd2FybmluZygiZWR3YXJkLTE1NTciLAot
CQkJIkNhcHR1cmUgZmFpbGVkIChpbm9kZSAlbGx1LCByZXN1bHQ9JWkpIiwKLQkJCSh1bnNp
Z25lZCBsb25nIGxvbmcpZ2V0X2lub2RlX29pZChpbm9kZSksIHJldCk7CisJaWYgKHBvcyAr
IGNvcGllZCA+IGlub2RlLT5pX3NpemUpIHsKKwkJd2luID0gIGttYWxsb2Moc2l6ZW9mKCp3
aW4pLCByZWlzZXI0X2N0eF9nZnBfbWFza19nZXQoKSk7CisJCWlmICh3aW4gPT0gTlVMTCkK
KwkJCWdvdG8gb3V0OworCQkvKiBtYWtlIHN1cmUgdGhlcmUgaXMgbm8gaG9sZXMgKi8KKwkJ
YXNzZXJ0KCJlZHdhcmQteHh4IiwgcG9zIDw9IGlub2RlLT5pX3NpemUpOworCQlyZXQgPSBz
ZXRfY2x1c3Rlcl9ieV93aW5kb3coaW5vZGUsICZjbHVzdCwgd2luLCBjb3BpZWQsIHBvcyk7
CisJCWlmIChyZXQpCisJCQlnb3RvIG91dDsKKwkJcmV0ID0gY2FwdHVyZV9wYWdlX2NsdXN0
ZXIoJmNsdXN0LCBpbm9kZSk7CisJCWlmIChyZXQpIHsKKwkJCXdhcm5pbmcoImVkd2FyZC14
eHgiLAorCQkJCSJDYXB0dXJlIGZhaWxlZCAoaW5vZGUgJWxsdSwgcmVzdWx0PSVpKSIsCisJ
CQkJKHVuc2lnbmVkIGxvbmcgbG9uZylnZXRfaW5vZGVfb2lkKGlub2RlKSwgcmV0KTsKKwkJ
CWdvdG8gb3V0OworCQl9CisJCS8qIEZJWE1FLUVEV0FSRDoKKwkJICAgcmVzZXJ2ZSBzcGFj
ZSBmb3IgdXBkYXRlX3NkIGluIHdyaXRlX2JlZ2luKCkgKi8KKwkJcmV0ID0gdXBkYXRlX3Nk
X2NyeXB0Y29tcHJlc3MoaW5vZGUpOworCX0KKwllbHNlIHsKKwkJcmV0ID0gYWxsb2NfY2x1
c3Rlcl9wZ3NldCgmY2x1c3QsIGNsdXN0ZXJfbnJwYWdlcyhpbm9kZSkpOworCQlpZiAocmV0
KQorCQkJZ290byBvdXQ7CisJCWNsdXN0LmluZGV4ID0gcGdfdG9fY2x1c3QocGFnZS0+aW5k
ZXgsIGlub2RlKTsKKwkJcmV0ID0gY2FwdHVyZV9wYWdlX2NsdXN0ZXIoJmNsdXN0LCBpbm9k
ZSk7CisJCWlmIChyZXQpCisJCQl3YXJuaW5nKCJlZHdhcmQtMTU1NyIsCisJCQkJIkNhcHR1
cmUgZmFpbGVkIChpbm9kZSAlbGx1LCByZXN1bHQ9JWkpIiwKKwkJCQkodW5zaWduZWQgbG9u
ZyBsb25nKWdldF9pbm9kZV9vaWQoaW5vZGUpLCByZXQpOworCX0KICBvdXQ6CiAJZG9uZV9s
aChsaCk7CisJaWYgKHdpbikKKwkJa2ZyZWUod2luKTsKIAlrZnJlZShoaW50KTsKIAlwdXRf
Y2x1c3Rlcl9oYW5kbGUoJmNsdXN0KTsKIAlyZXR1cm4gcmV0OwotLS0gbGludXgtMi42LjM1
Lm9yaWcvZnMvcmVpc2VyNC9wbHVnaW4vZmlsZS9maWxlLmMKKysrIGxpbnV4LTIuNi4zNS9m
cy9yZWlzZXI0L3BsdWdpbi9maWxlL2ZpbGUuYwpAQCAtODkzLDcgKzg5Myw3IEBAIHN0YXRp
YyBpbnQgY2FwdHVyZV9wYWdlX2FuZF9jcmVhdGVfZXh0ZW4KIAogLyogcGx1Z2luLT53cml0
ZV9lbmQoKSAqLwogaW50IHdyaXRlX2VuZF91bml4X2ZpbGUoc3RydWN0IGZpbGUgKmZpbGUs
IHN0cnVjdCBwYWdlICpwYWdlLAotCQkJdW5zaWduZWQgZnJvbSwgdW5zaWduZWQgdG8pCisJ
CQlsb2ZmX3QgcG9zLCB1bnNpZ25lZCBjb3BpZWQpCiB7CiAJdW5sb2NrX3BhZ2UocGFnZSk7
CiAJcmV0dXJuIGNhcHR1cmVfcGFnZV9hbmRfY3JlYXRlX2V4dGVudChwYWdlKTsKLS0tIGxp
bnV4LTIuNi4zNS5vcmlnL2ZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvZmlsZS5oCisrKyBsaW51
eC0yLjYuMzUvZnMvcmVpc2VyNC9wbHVnaW4vZmlsZS9maWxlLmgKQEAgLTk3LDcgKzk3LDcg
QEAgaW50IHdyaXRlcGFnZXNfdW5peF9maWxlKHN0cnVjdCBhZGRyZXNzXwogaW50IHdyaXRl
X2JlZ2luX3VuaXhfZmlsZShzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBhZ2UgKnBhZ2Us
CiAJCQkgIHVuc2lnbmVkIGZyb20sIHVuc2lnbmVkIHRvKTsKIGludCB3cml0ZV9lbmRfdW5p
eF9maWxlKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKLQkJCXVuc2ln
bmVkIGZyb20sIHVuc2lnbmVkIHRvKTsKKwkJCWxvZmZfdCBwb3MsIHVuc2lnbmVkIGNvcGll
ZCk7CiBzZWN0b3JfdCBibWFwX3VuaXhfZmlsZShzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqLCBz
ZWN0b3JfdCBsYmxvY2spOwogCiAvKiBvdGhlciBwcml2YXRlIG1ldGhvZHMgKi8KQEAgLTEz
Nyw3ICsxMzcsNyBAQCBpbnQgd3JpdGVwYWdlc19jcnlwdGNvbXByZXNzKHN0cnVjdCBhZGRy
CiBpbnQgd3JpdGVfYmVnaW5fY3J5cHRjb21wcmVzcyhzdHJ1Y3QgZmlsZSAqZmlsZSwgc3Ry
dWN0IHBhZ2UgKnBhZ2UsCiAJCQkgICAgICB1bnNpZ25lZCBmcm9tLCB1bnNpZ25lZCB0byk7
CiBpbnQgd3JpdGVfZW5kX2NyeXB0Y29tcHJlc3Moc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVj
dCBwYWdlICpwYWdlLAotCQkJICAgIHVuc2lnbmVkIGZyb20sIHVuc2lnbmVkIHRvKTsKKwkJ
CSAgICBsb2ZmX3QgcG9zLCB1bnNpZ25lZCBjb3BpZWQpOwogc2VjdG9yX3QgYm1hcF9jcnlw
dGNvbXByZXNzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICosIHNlY3Rvcl90IGxibG9jayk7CiAK
IC8qIG90aGVyIHByaXZhdGUgbWV0aG9kcyAqLwotLS0gbGludXgtMi42LjM1Lm9yaWcvZnMv
cmVpc2VyNC9wbHVnaW4vZmlsZS9maWxlX2NvbnZlcnNpb24uYworKysgbGludXgtMi42LjM1
L2ZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvZmlsZV9jb252ZXJzaW9uLmMKQEAgLTY5NCwxNiAr
Njk0LDEyIEBAIGludCByZWlzZXI0X3dyaXRlX2VuZF9jYXJlZnVsKHN0cnVjdCBmaWwKIHsK
IAlpbnQgcmV0OwogCXJlaXNlcjRfY29udGV4dCAqY3R4OwotCXVuc2lnbmVkIHN0YXJ0LCBl
bmQ7CiAJc3RydWN0IGlub2RlICppbm9kZSA9IHBhZ2UtPm1hcHBpbmctPmhvc3Q7CiAKIAlh
c3NlcnQoInVta2EtMzEwMSIsIGZpbGUgIT0gTlVMTCk7CiAJYXNzZXJ0KCJ1bWthLTMxMDIi
LCBwYWdlICE9IE5VTEwpOwogCWFzc2VydCgidW1rYS0zMDkzIiwgUGFnZUxvY2tlZChwYWdl
KSk7CiAKLQlzdGFydCA9IHBvcyAmIChQQUdFX0NBQ0hFX1NJWkUgLSAxKTsKLQllbmQgPSBz
dGFydCArIGxlbjsKLQogCWZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpOwogCVNldFBhZ2VVcHRv
ZGF0ZShwYWdlKTsKIApAQCAtNzEzLDcgKzcwOSw3IEBAIGludCByZWlzZXI0X3dyaXRlX2Vu
ZF9jYXJlZnVsKHN0cnVjdCBmaWwKIAkJcmV0ID0gUFRSX0VSUihjdHgpOwogCQlnb3RvIG91
dDsKIAl9Ci0JcmV0ID0gUFJPVF9QQVNTSVZFKGludCwgd3JpdGVfZW5kLCAoZmlsZSwgcGFn
ZSwgc3RhcnQsIGVuZCkpOworCXJldCA9IFBST1RfUEFTU0lWRShpbnQsIHdyaXRlX2VuZCwg
KGZpbGUsIHBhZ2UsIHBvcywgY29waWVkKSk7CiAKIAkvKiBkb24ndCBjb21taXQgdHJhbnNh
Y3Rpb24gdW5kZXIgaW5vZGUgc2VtYXBob3JlICovCiAJY29udGV4dF9zZXRfY29tbWl0X2Fz
eW5jKGN0eCk7Ci0tLSBsaW51eC0yLjYuMzUub3JpZy9mcy9yZWlzZXI0L3BsdWdpbi9wbHVn
aW4uaAorKysgbGludXgtMi42LjM1L2ZzL3JlaXNlcjQvcGx1Z2luL3BsdWdpbi5oCkBAIC0y
NTEsNyArMjUxLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgZmlsZV9wbHVnaW4gewogCWludCAoKndy
aXRlX2JlZ2luKShzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBhZ2UgKnBhZ2UsCiAJCQkg
IHVuc2lnbmVkIGZyb20sIHVuc2lnbmVkIHRvKTsKIAlpbnQgKCp3cml0ZV9lbmQpKHN0cnVj
dCBmaWxlICpmaWxlLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKLQkJCSAgdW5zaWduZWQgZnJvbSwg
dW5zaWduZWQgdG8pOworCQkJIGxvZmZfdCBwb3MsIHVuc2lnbmVkIGNvcGllZCk7CiAJc2Vj
dG9yX3QgKCpibWFwKSAoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKiBtYXBwaW5nLCBzZWN0b3Jf
dCBsYmxvY2spOwogCS8qIG90aGVyIHByaXZhdGUgbWV0aG9kcyAqLwogCS8qIHNhdmUgaW5v
ZGUgY2FjaGVkIHN0YXQtZGF0YSBvbnRvIGRpc2suIEl0IHdhcyBjYWxsZWQK
--------------000009090809060504030000--
