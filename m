From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: reiser4 firefox hangs due to fsync, sysrq-t dump
Date: Sat, 29 Dec 2007 23:35:03 +0300
Message-ID: <5c7c368b0712291235m546eca35ne25548edffcdbf42@mail.gmail.com>
References: <14514445.post@talk.nabble.com> <14533387.post@talk.nabble.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_17585_15083091.1198960503963"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:references;
        bh=SRiKLtv7j1RUnFYoC2JjActe1J+jG63JEnLupvh3IEU=;
        b=Q8Uqf+imsNsFHnWXFYVW91IhZVRgo7SY+pnbNSfr7QazbdjXkKYxbccXcpD24m5dBVwmfLOkMBZjS9AQZzUPL05Q7pQHIGOvFBLxVtgZMSr2D/WWEJm4jddDKYWZFm04gqlIzAv11lyvagnaBpij6N0JXg+FDfZIZGnCpKkBrK8=
In-Reply-To: <14533387.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: butdiene <butdiene@yahoo.com>
Cc: reiserfs-devel@vger.kernel.org

------=_Part_17585_15083091.1198960503963
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 12/29/07, butdiene <butdiene@yahoo.com> wrote:
>
> I'm not sure about what I'm doing. with a patch for optimal_io_size=4096*1024
> and atom_max_size=0x800, it improves a lot.

Not sure about it: reiser4 just keeps the optimal_io_size in a superblock
to return this for stat, fstat (2), etc., and doesn't use if for anything else.
Maybe firefox uses it somehow - I didn't investigate.

The following is a stacktrace where your firefox hangs. It seems there is
an atom size "leak". To confirm it, please apply the attached patch and
perform 2 working sessions (better with REISER4_DEBUG is on):
session 1:
just reproduce the firefox hang;
session 2:
dd if=/dev/zero of=xxx bs=65536 count=yyy && sync
where xxx - a file on your root partition, yyy is a count to write ~4 amount
of RAM (if possible).
Reboot before each session. Send me kernel messages for both sessions
with cat /proc/mounts output.

Thanks,
Edward.

Dec 26 17:40:49 localhost firefox-bin   D ffff810073495c78     0  8030   8011
Dec 26 17:40:49 localhost ffff810073495be8 0000000000000086
ffff81005ce39728 ffff81005ce39728
Dec 26 17:40:49 localhost ffff8100bf0b4dd0 ffff810073495b98
0000000000000008 ffffffff806b4c00
Dec 26 17:40:49 localhost ffffffff806b4c00 ffffffff806b1c00
ffffffff806b4c00 ffff8100b3a80140
Dec 26 17:40:49 localhost Call Trace:
Dec 26 17:40:49 localhost [<ffffffff802580f1>] sync_page+0x0/0x42
Dec 26 17:40:49 localhost [<ffffffff804d36f0>] io_schedule+0x28/0x34
Dec 26 17:40:49 localhost [<ffffffff8025812f>] sync_page+0x3e/0x42
Dec 26 17:40:49 localhost [<ffffffff804d3c27>] __wait_on_bit+0x40/0x6e
Dec 26 17:40:49 localhost [<ffffffff802582ab>] wait_on_page_bit+0x6c/0x72
Dec 26 17:40:49 localhost [<ffffffff80246b70>] wake_bit_function+0x0/0x23
Dec 26 17:40:49 localhost [<ffffffff802b8b78>] jwait_io+0x25/0x37
Dec 26 17:40:49 localhost [<ffffffff802c97a7>] reiser4_write_logs+0x988/0xbee
Dec 26 17:40:49 localhost [<ffffffff802c35c9>]
get_current_atom_locked_nocheck+0x37/0x3e
Dec 26 17:40:49 localhost [<ffffffff802c3a10>] reiser4_txn_end+0x355/0x4e5
Dec 26 17:40:49 localhost [<ffffffff802c28ea>] reiser4_atom_wait_event+0x9a/0xa1
Dec 26 17:40:49 localhost [<ffffffff802c3ba9>] reiser4_txn_restart+0x9/0x17
Dec 26 17:40:49 localhost [<ffffffff802c3c13>] force_commit_atom+0x47/0x4b
Dec 26 17:40:49 localhost [<ffffffff802c3e75>]
txnmgr_force_commit_all+0xbb/0x130
Dec 26 17:40:49 localhost [<ffffffff802d5780>] reiser4_sync_common+0x37/0x57
Dec 26 17:40:49 localhost [<ffffffff802965b6>] do_fsync+0x52/0x88
Dec 26 17:40:49 localhost [<ffffffff8029660f>] __do_fsync+0x23/0x36
Dec 26 17:40:49 localhost [<ffffffff8020b76e>] system_call+0x7e/0x83
Dec 26 17:40:49 localhost

>
> /dev/root / reiser4
> rw,atom_max_size=0x800,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
> 0 0
>
>
> --- linux.0/fs/reiser4/reiser4.h        2007-12-28 16:30:59.000000000 -0600
> +++ linux.1/fs/reiser4/reiser4.h        2007-12-28 16:31:40.000000000 -0600
> @@ -197,7 +197,7 @@
>
>     Can be overwritten by optimal_io_size mount option.
>  */
> -#define REISER4_OPTIMAL_IO_SIZE (64 * 1024)
> +#define REISER4_OPTIMAL_IO_SIZE (4096 * 1024)
>
>  /* see comments in inode.c:oid_to_uino() */
>  #define REISER4_UINO_SHIFT (1 << 30)
>
>
>
>
> butdiene wrote:
> >
> > Hi,
> >
> > the file contains several sysrq-t dumps when firefox hangs,
> >
> >  http://www.nabble.com/file/p14514445/reiser4-sysrq-t.txt.bz2
> > reiser4-sysrq-t.txt.bz2
> >
> > thanks!
> >
>
> --
> View this message in context: http://www.nabble.com/reiser4-firefox-hangs-due-to-fsync%2C-sysrq-t-dump-tp14514445p14533387.html
> Sent from the ReiserFS - General mailing list archive at Nabble.com.
>
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

------=_Part_17585_15083091.1198960503963
Content-Type: text/x-patch; name=reiser4-print-max-atom_nrpointers.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_faslnj2v
Content-Disposition: attachment;
 filename=reiser4-print-max-atom_nrpointers.patch

ZGlmZiAtdXJOIGxpbnV4LTIuNi4yMy1tbTEtb3JpZy9mcy9yZWlzZXI0L3N1cGVyLmggbGludXgt
Mi42LjIzLW1tMS9mcy9yZWlzZXI0L3N1cGVyLmgKLS0tIGxpbnV4LTIuNi4yMy1tbTEtb3JpZy9m
cy9yZWlzZXI0L3N1cGVyLmgJMjAwNy0xMi0yOSAxOTo1MzowNC44Mzc2MDUxOTQgKzAzMDAKKysr
IGxpbnV4LTIuNi4yMy1tbTEvZnMvcmVpc2VyNC9zdXBlci5oCTIwMDctMTItMjkgMjA6MDQ6MTEu
MTM2NjkxNjc0ICswMzAwCkBAIC0yNjIsNyArMjYyLDcgQEAKIAogCS8qIG9wZXJhdGlvbnMgZm9y
IG9iamVjdHMgb24gdGhpcyBmaWxlIHN5c3RlbSAqLwogCXN0cnVjdCBvYmplY3Rfb3BzIG9wczsK
LQorCV9fdTMyIGF0b21fbWF4X25ycG9pbnRlcnM7CiAJLyoKIAkgKiBzdHJ1Y3R1cmUgdG8gbWFp
bnRhaW4gZF9jdXJzb3JzLiBTZWUgcGx1Z2luL2ZpbGVfb3BzX3JlYWRkaXIuYyBmb3IKIAkgKiBt
b3JlIGRldGFpbHMKZGlmZiAtdXJOIGxpbnV4LTIuNi4yMy1tbTEtb3JpZy9mcy9yZWlzZXI0L3R4
bm1nci5jIGxpbnV4LTIuNi4yMy1tbTEvZnMvcmVpc2VyNC90eG5tZ3IuYwotLS0gbGludXgtMi42
LjIzLW1tMS1vcmlnL2ZzL3JlaXNlcjQvdHhubWdyLmMJMjAwNy0xMi0yOSAxOTo1MzowNC44Njk2
MTM0MTMgKzAzMDAKKysrIGxpbnV4LTIuNi4yMy1tbTEvZnMvcmVpc2VyNC90eG5tZ3IuYwkyMDA3
LTEyLTI5IDIyOjAyOjQwLjY3MTA3MDE2NCArMDMwMApAQCAtMTIzNSw2ICsxMjM1LDMwIEBACiAJ
ICAgIGF0b20tPnR4bmhfY291bnQgPT0gYXRvbS0+bnJfd2FpdGVycyAmJiBhdG9tX3Nob3VsZF9j
b21taXQoYXRvbSk7CiB9CiAKK3N0YXRpYyB2b2lkIGNoZWNrX3ByaW50X2F0b21fbnJwb2ludGVy
cyAodHhuX2F0b20gKiBhdG9tKQoreworCXJlaXNlcjRfc3VwZXJfaW5mb19kYXRhICpzYmluZm8g
PSBnZXRfY3VycmVudF9zdXBlcl9wcml2YXRlKCk7CisKKwlzcGluX2xvY2tfcmVpc2VyNF9zdXBl
cihzYmluZm8pOworCWlmICgodW5zaWduZWQpYXRvbV9wb2ludGVyX2NvdW50KGF0b20pID4gc2Jp
bmZvLT5hdG9tX21heF9ucnBvaW50ZXJzKSB7CisJCXNiaW5mby0+YXRvbV9tYXhfbnJwb2ludGVy
cyA9IGF0b21fcG9pbnRlcl9jb3VudChhdG9tKTsKKyNpZiBSRUlTRVI0X0RFQlVHCisJCXByaW50
aygiZWR3YXJkLTE1NTU6IGF0b20gJXAgaGFzIG1heF9ucl9wb2ludGVycyAoJWQpLCBjbGVhbiAo
JWQpLCBkaXJ0eSAoJWQpXG4iLAorCQkgICAgICAgYXRvbSwgYXRvbV9wb2ludGVyX2NvdW50KGF0
b20pLCBhdG9tLT5jbGVhbiwgYXRvbS0+ZGlydHkpOworI2Vsc2UKKwkJcHJpbnRrKCJlZHdhcmQt
MTU1NTogYXRvbSAlcCBoYXMgbWF4X25yX3BvaW50ZXJzICglZClcbiIsCisJCSAgICAgICBhdG9t
LCBhdG9tX3BvaW50ZXJfY291bnQoYXRvbSkpOworI2VuZGlmCisJfQorCWlmIChhdG9tX2lzX2Nv
bW1pdHRhYmxlKGF0b20pICYmCisJICAgICh1bnNpZ25lZClhdG9tX3BvaW50ZXJfY291bnQoYXRv
bSkgPT0gc2JpbmZvLT5hdG9tX21heF9ucnBvaW50ZXJzKSB7CisJCXByaW50aygiZWR3YXJkLTE1
NTY6IGNvbW1pdCBhdG9tICVwIHdpdGggbWF4IG5ycG9pbnRlcnMgJWRcbiIsCisJCSAgICAgICBh
dG9tLCBzYmluZm8tPmF0b21fbWF4X25ycG9pbnRlcnMpOworCQlkdW1wX3N0YWNrKCk7CisJfQor
CXNwaW5fdW5sb2NrX3JlaXNlcjRfc3VwZXIoc2JpbmZvKTsKK30KKwogLyogY2FsbGVkIHBlcmlv
ZGljYWxseSBmcm9tIGt0eG5tZ3JkIHRvIGNvbW1pdCBvbGQgYXRvbXMuIFJlbGVhc2VzIGt0eG5t
Z3JkIHNwaW4KICAqIGxvY2sgYXQgZXhpdCAqLwogaW50IGNvbW1pdF9zb21lX2F0b21zKHR4bl9t
Z3IgKiBtZ3IpCkBAIC0xMjY0LDYgKzEyODgsNyBAQAogCQkgKiBmaXJzdCB0ZXN0IHdpdGhvdXQg
dGFraW5nIGF0b20gc3BpbiBsb2NrLCB3aGV0aGVyIGl0IGlzCiAJCSAqIGVsaWdpYmxlIGZvciBj
b21taXR0aW5nIGF0IGFsbAogCQkgKi8KKwkJY2hlY2tfcHJpbnRfYXRvbV9ucnBvaW50ZXJzKGF0
b20pOwogCQlpZiAoYXRvbV9pc19jb21taXR0YWJsZShhdG9tKSkgewogCQkJLyogbm93LCB0YWtl
IHNwaW4gbG9jayBhbmQgcmUtY2hlY2sgKi8KIAkJCXNwaW5fbG9ja19hdG9tKGF0b20pOwpAQCAt
MTY4Myw3ICsxNzA4LDcgQEAKIAkJCSAgIGZsdXNoZXIgKi8KIAkJCXJlaXNlcjRfYXRvbV9zZXRf
c3RhZ2UoY2QtPmF0b20sIEFTVEFHRV9DQVBUVVJFX1dBSVQpOwogCQkJY2QtPmF0b20tPmZsYWdz
IHw9IEFUT01fRk9SQ0VfQ09NTUlUOwotCisJCQljaGVja19wcmludF9hdG9tX25ycG9pbnRlcnMo
Y2QtPmF0b20pOwogCQkJcmVzdWx0ID0KIAkJCSAgICBjb21taXRfY3VycmVudF9hdG9tKCZjZC0+
bnJfd3JpdHRlbiwgJmNkLT5hdG9tKTsKIAkJCWlmIChyZXN1bHQgIT0gMCAmJiByZXN1bHQgIT0g
LUVfUkVQRUFUKQo=
------=_Part_17585_15083091.1198960503963--
