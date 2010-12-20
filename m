From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Oops
Date: Mon, 20 Dec 2010 23:31:39 +0100
Message-ID: <AANLkTim_Wbqj6C5A91ecqBk3BkcvcggAcQkdNqVP062x@mail.gmail.com>
References: <4D0E569D.4010503@gmail.com>
	<4D0E8844.60902@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000325574f266586a50497df152b
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=dzrKjvxRjcloI8XlBGDTaq9LRVYuJi1iTq74jyagovU=;
        b=xQ/G8Q/xJIbT+KVttSbwWWLlfIoSMpCttD/TBO87EvV75n66K9XLLwxsubo45wX0sY
         4KtU/C/V55uH5FuS6csvO1vsS4gG6UZoHKyljabMtYMbBCQTh5WIQ5O/NBNskbx5PqY1
         9FQChjxPPFEgP1EydmCEDSoqhbrI2HDcNRldM=
In-Reply-To: <4D0E8844.60902@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?0JDQvdC00YDQtdC5INCa0L7Qu9GH0LXQvdC60L4=?= <komexx@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

--000325574f266586a50497df152b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello.

Could you please try the attached patch?

This patch is against reiser4-for-2.6.36.
Also please make sure you have the latest one
(I have updated the stuff  11-Dec-2010).

Report, if any problems.

Thanks,
Edward.


On Sun, Dec 19, 2010 at 11:33 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> =D0=90=D0=BD=D0=B4=D1=80=D0=B5=D0=B9 =D0=9A=D0=BE=D0=BB=D1=87=D0=B5=D0=BD=
=D0=BA=D0=BE wrote:
>> Wanted to try reiser4. I have compiled a kernel with reiser4, format
>> the partition and began to copy the folder /home.
>> After a short time the screen goes black and there was one console
>> with the error output. After switching to other tty and back up
>> continued. dmesg output copied to the pastebin
>> (http://pastebin.com/XyDKWJ8J).
>> This was repeated several times and the computer hangs perfectly still.
>> I have ubuntu 10.10 on a laptop Acer Aspire 7720z.
>
> Yup, I see the bug:
> instead of writing pages reiser4 kicks ext4 to do it,
> and, I guess, doesn't clear journal_info (this is why
> ext4 oopses).
>
> [ =C2=A0278.062271] =C2=A0[<c0318822>] ? jbd2_journal_start+0x12/0x20
> [ =C2=A0278.062322] =C2=A0[<c02f5858>] ? ext4_journal_start_sb+0xc8/0x100
> [ =C2=A0278.062377] =C2=A0[<c02e0957>] ? ext4_meta_trans_blocks+0x67/0xc0
> [ =C2=A0278.062431] =C2=A0[<c02e47e3>] ? ext4_da_writepages+0x203/0x560
> [ =C2=A0278.062484] =C2=A0[<c060fccd>] ? _raw_spin_lock+0xd/0x10
> [ =C2=A0278.062530] =C2=A0[<c0281ca2>] ? flush_some_atom+0x312/0x540
> [ =C2=A0278.062578] =C2=A0[<c02a4cdd>] ? writepages_cryptcompress+0x19d/0=
x220
> [ =C2=A0278.062636] =C2=A0[<c02913a8>] ? reiser4_writeout+0xa8/0x1a0
> [ =C2=A0278.062684] =C2=A0[<c022c186>] ? iput+0x36/0x270
> [ =C2=A0278.062724] =C2=A0[<c02367e4>] ? generic_writeback_sb_inodes+0xe4=
/0x150
> [ =C2=A0278.062782] =C2=A0[<c01dfaac>] ? do_writepages+0x1c/0x40
> [ =C2=A0278.062826] =C2=A0[<c0236125>] ? writeback_single_inode+0x85/0x25=
0
> [ =C2=A0278.062877] =C2=A0[<c060fccd>] ? _raw_spin_lock+0xd/0x10
> [ =C2=A0278.062921] =C2=A0[<c028db64>] ? reiser4_writeback_inodes+0xa4/0x=
130
> [ =C2=A0278.062974] =C2=A0[<c02367b1>] ? generic_writeback_sb_inodes+0xb1=
/0x150
> [ =C2=A0278.063031] =C2=A0[<c0236c6b>] ? writeback_inodes_wb+0x10b/0x150
>
>
> here should be writeback_sb_inodes() instead of writeback_inodes_wb
>
>
> [ =C2=A0278.063082] =C2=A0[<c0291d06>] ? entd_flush+0xa6/0xe0
> [ =C2=A0278.063127] =C2=A0[<c0291d40>] ? entd+0x0/0x240
> [ =C2=A0278.063166] =C2=A0[<c0291e51>] ? entd+0x111/0x240
> [ =C2=A0278.063208] =C2=A0[<c0165fd0>] ? autoremove_wake_function+0x0/0x5=
0
> [ =C2=A0278.064008] =C2=A0[<c0291d40>] ? entd+0x0/0x240
> [ =C2=A0278.067417] =C2=A0[<c0165ba4>] ? kthread+0x74/0x80
> [ =C2=A0278.067417] =C2=A0[<c0165b30>] ? kthread+0x0/0x80
> [ =C2=A0278.067417] =C2=A0[<c010357e>] ? kernel_thread_helper+0x6/0x10
>
>
> It is interesting that the path
> entd -> writeback_inodes_wb -> ext4_da_writepages
> has never been triggered on my testing machine (I also
> have reiser4 and ext4 there). Perhaps, this is because
> of different system configurations.
>
> I'll try to fix it in the near future, so that you'll be able to
> try reiser4.
>
> Thanks for your report,
> Edward.
>

--000325574f266586a50497df152b
Content-Type: application/octet-stream; name="reiser4-fix-entd_flush.patch"
Content-Disposition: attachment; filename="reiser4-fix-entd_flush.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ghxxtyo60

ZW50ZF9mbHVzaDogdXNlIF9fd3JpdGViYWNrX2lub2Rlc19zYigpIGluc3RlYWQgb2YKd3JpdGVi
YWNrX2lub2Rlc193Yi4gVGhlIGxhc3Qgb25lIGFsc28gd3JpdGVzIGlub2RlcywKd2hpY2ggZG9u
J3QgYmVsb25nIHJlaXNlcjQ6IHRoaXMgaXMgbm90IGFjY2VwdGFibGUKaW4gYWNjb3JkYW5jZSB3
aXRoIGVudGQgc2VtYW50aWMgKGVudGQgcmVzcG9uZHMgc29sZWx5CnRvIHJlaXNlcjRfd3JpdGVw
YWdlKCkgYW5kIG11c3Qgbm90IHNlcnZlIG90aGVyIGZpbGUKc3lzdGVtcykuCgpTaWduZWQtb2Zm
LWJ5OiBFZHdhcmQgU2hpc2hraW4gPGVkd2FyZC5zaGlzaGtpbkBnbWFpbC5jb20+Ci0tLQogZnMv
ZnMtd3JpdGViYWNrLmMgICAgICAgICB8ICAgMTAgKysrKysrLS0tLQogZnMvcmVpc2VyNC9lbnRk
LmMgICAgICAgICB8ICAgMTEgKysrKysrKysrLS0KIGluY2x1ZGUvbGludXgvd3JpdGViYWNrLmgg
fCAgICAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKLS0tIGxpbnV4LTIuNi4zNi5vcmlnL2ZzL2ZzLXdyaXRlYmFjay5jCisrKyBsaW51eC0y
LjYuMzYvZnMvZnMtd3JpdGViYWNrLmMKQEAgLTU2MCwxNyArNTYwLDE5IEBAIHZvaWQgd3JpdGVi
YWNrX2lub2Rlc193YihzdHJ1Y3QgYmRpX3dyaXQKIH0KIEVYUE9SVF9TWU1CT0wod3JpdGViYWNr
X2lub2Rlc193Yik7CiAKLXN0YXRpYyB2b2lkIF9fd3JpdGViYWNrX2lub2Rlc19zYihzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLAordm9pZCBfX3dyaXRlYmFja19pbm9kZXNfc2Ioc3RydWN0IHN1cGVy
X2Jsb2NrICpzYiwKIAkJc3RydWN0IGJkaV93cml0ZWJhY2sgKndiLCBzdHJ1Y3Qgd3JpdGViYWNr
X2NvbnRyb2wgKndiYykKIHsKLQlXQVJOX09OKCFyd3NlbV9pc19sb2NrZWQoJnNiLT5zX3Vtb3Vu
dCkpOwotCiAJc3Bpbl9sb2NrKCZpbm9kZV9sb2NrKTsKIAlpZiAoIXdiYy0+Zm9yX2t1cGRhdGUg
fHwgbGlzdF9lbXB0eSgmd2ItPmJfaW8pKQogCQlxdWV1ZV9pbyh3Yiwgd2JjLT5vbGRlcl90aGFu
X3RoaXMpOwotCWdlbmVyaWNfd3JpdGViYWNrX3NiX2lub2RlcyhzYiwgd2IsIHdiYywgdHJ1ZSk7
CisJaWYgKHNiLT5zX29wLT53cml0ZWJhY2tfaW5vZGVzKQorCQlzYi0+c19vcC0+d3JpdGViYWNr
X2lub2RlcyhzYiwgd2IsIHdiYywgdHJ1ZSk7CisJZWxzZQorCQlnZW5lcmljX3dyaXRlYmFja19z
Yl9pbm9kZXMoc2IsIHdiLCB3YmMsIHRydWUpOwogCXNwaW5fdW5sb2NrKCZpbm9kZV9sb2NrKTsK
IH0KK0VYUE9SVF9TWU1CT0woX193cml0ZWJhY2tfaW5vZGVzX3NiKTsKIAogLyoKICAqIFRoZSBt
YXhpbXVtIG51bWJlciBvZiBwYWdlcyB0byB3cml0ZW91dCBpbiBhIHNpbmdsZSBiZGkgZmx1c2gv
a3VwZGF0ZQotLS0gbGludXgtMi42LjM2Lm9yaWcvZnMvcmVpc2VyNC9lbnRkLmMKKysrIGxpbnV4
LTIuNi4zNi9mcy9yZWlzZXI0L2VudGQuYwpAQCAtMjQyLDggKzI0MiwxNSBAQCBzdGF0aWMgdm9p
ZCBlbnRkX2ZsdXNoKHN0cnVjdCBzdXBlcl9ibG9jCiAJaWYgKHJxLT53YmMtPm5yX3RvX3dyaXRl
ID4gMCkgewogCQlycS0+d2JjLT5yYW5nZV9zdGFydCA9IDA7CiAJCXJxLT53YmMtPnJhbmdlX2Vu
ZCA9IExMT05HX01BWDsKLQkJd3JpdGViYWNrX2lub2Rlc193YigmcnEtPm1hcHBpbmctPmJhY2tp
bmdfZGV2X2luZm8tPndiLAotCQkJCSAgICBycS0+d2JjKTsKKwkJLyoKKwkJICogd2UgZG9uJ3Qg
bmVlZCB0byBwaW4gc3VwZXJibG9jayBmb3Igd3JpdGViYWNrOgorCQkgKiB0aGlzIGlzIGltcGxp
Y2l0bHkgcGlubmVkIGJ5IHdyaXRlX3BhZ2VfYnlfZW50CisJCSAqICh2aWEgaWdyYWIpLCBzbyB0
aGF0IHNodXRkb3duX3N1cGVyKCkgd2lsbCB3YWl0CisJCSAqIChvbiByZWlzZXI0X3B1dF9zdXBl
cikgZm9yIGVudGQgY29tcGxldGlvbi4KKwkJICovCisJCV9fd3JpdGViYWNrX2lub2Rlc19zYihz
dXBlciwKKwkJCQkgICAgICAmcnEtPm1hcHBpbmctPmJhY2tpbmdfZGV2X2luZm8tPndiLAorCQkJ
CSAgICAgIHJxLT53YmMpOwogCX0KIAlycS0+d2JjLT5ucl90b193cml0ZSA9IEVOVERfQ0FQVFVS
RV9BUEFHRV9CVVJTVDsKIAotLS0gbGludXgtMi42LjM2Lm9yaWcvaW5jbHVkZS9saW51eC93cml0
ZWJhY2suaAorKysgbGludXgtMi42LjM2L2luY2x1ZGUvbGludXgvd3JpdGViYWNrLmgKQEAgLTcw
LDYgKzcwLDkgQEAgaW50IHdyaXRlYmFja19pbm9kZXNfc2JfaWZfaWRsZShzdHJ1Y3Qgcwogdm9p
ZCBzeW5jX2lub2Rlc19zYihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKik7CiB2b2lkIHdyaXRlYmFja19p
bm9kZXNfd2Ioc3RydWN0IGJkaV93cml0ZWJhY2sgKndiLAogCQlzdHJ1Y3Qgd3JpdGViYWNrX2Nv
bnRyb2wgKndiYyk7Cit2b2lkIF9fd3JpdGViYWNrX2lub2Rlc19zYihzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiLAorCQkJICAgc3RydWN0IGJkaV93cml0ZWJhY2sgKndiLAorCQkJICAgc3RydWN0IHdy
aXRlYmFja19jb250cm9sICp3YmMpOwogbG9uZyB3Yl9kb193cml0ZWJhY2soc3RydWN0IGJkaV93
cml0ZWJhY2sgKndiLCBpbnQgZm9yY2Vfd2FpdCk7CiB2b2lkIHdha2V1cF9mbHVzaGVyX3RocmVh
ZHMobG9uZyBucl9wYWdlcyk7CiAK
--000325574f266586a50497df152b--
