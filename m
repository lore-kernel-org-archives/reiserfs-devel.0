From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Fri, 02 Jun 2023 10:56:39 +0200
Message-ID: <6bb51cd9afb95f2a5bd9bd2a5113f6dcbf4aea07.camel@huaweicloud.com>
References: <0000000000007bedb605f119ed9f@google.com>
         <00000000000000964605faf87416@google.com>
         <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
         <1020d006-c698-aacc-bcc3-92e5b237ef91@huaweicloud.com>
         <29fcea18-d720-d5df-0e00-eb448e6bbfcf@suse.com>
         <07c825a21fb4c57f4290158e529d32f4e0e0fbf0.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-JzGDK1esDlvRzhOoEHct"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <07c825a21fb4c57f4290158e529d32f4e0e0fbf0.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>, Paul Moore <paul@paul-moore.com>, syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Cc: hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, peterz@infradead.org, mingo@redhat.com, will@kernel.org, Jan Kara <jack@suse.cz>


--=-JzGDK1esDlvRzhOoEHct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 2023-06-02 at 09:20 +0200, Roberto Sassu wrote:
> On Thu, 2023-06-01 at 17:22 -0400, Jeff Mahoney wrote:
> > On 5/31/23 05:49, Roberto Sassu wrote:
> > > On 5/5/2023 11:36 PM, Paul Moore wrote:
> > > > On Fri, May 5, 2023 at 4:51 PM syzbot
> > > > <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com> wrote:
> > > > > syzbot has bisected this issue to:
> > > > > 
> > > > > commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> > > > > Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > > Date:   Fri Mar 31 12:32:18 2023 +0000
> > > > > 
> > > > >      reiserfs: Add security prefix to xattr name in 
> > > > > reiserfs_security_write()
> > > > > 
> > > > > bisection log:  
> > > > > https://syzkaller.appspot.com/x/bisect.txt?x=14403182280000
> > > > > start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of 
> > > > > https://githu..
> > > > > git tree:       upstream
> > > > > final oops:     
> > > > > https://syzkaller.appspot.com/x/report.txt?x=16403182280000
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=12403182280000
> > > > > kernel config:  
> > > > > https://syzkaller.appspot.com/x/.config?x=73a06f6ef2d5b492
> > > > > dashboard link: 
> > > > > https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
> > > > > syz repro:      
> > > > > https://syzkaller.appspot.com/x/repro.syz?x=12442414280000
> > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a7318280000
> > > > > 
> > > > > Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
> > > > > Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in 
> > > > > reiserfs_security_write()")
> > > > > 
> > > > > For information about bisection process see: 
> > > > > https://goo.gl/tpsmEJ#bisection
> > > > 
> > > > I don't think Roberto's patch identified above is the actual root
> > > > cause of this problem as reiserfs_xattr_set_handle() is called in
> > > > reiserfs_security_write() both before and after the patch.  However,
> > > > due to some bad logic in reiserfs_security_write() which Roberto
> > > > corrected, I'm thinking that it is possible this code is being
> > > > exercised for the first time and syzbot is starting to trigger a
> > > > locking issue in the reiserfs code ... ?
> > > 
> > > + Jan, Jeff (which basically restructured the lock)
> > > 
> > > + Petr, Ingo, Will
> 
> Peter, clearly (sorry!)
> 
> > I involve the lockdep experts, to get a bit of help on this.
> > 
> > Yep, looks like that's been broken since it was added in 2009.  Since 
> > there can't be any users of it, it'd make sense to drop the security 
> > xattr support from reiserfs entirely.
> 
> Thanks, Jeff. Will make a patch to implement your suggestion.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next

--=-JzGDK1esDlvRzhOoEHct
Content-Disposition: attachment;
	filename*0=0001-reiserfs-Disable-security-xattr-initialization-since.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-reiserfs-Disable-security-xattr-initialization-since.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBhMzFmNWIwOWUzOWU1YTk2NDQ1N2IwYTUyYWE5YzQzN2EwYmY3ZjYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2JlcnRvIFNhc3N1IDxyb2JlcnRvLnNhc3N1QGh1YXdlaS5j
b20+CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAxMDoxMDoyOCArMDIwMApTdWJqZWN0OiBbUEFUQ0hd
IHJlaXNlcmZzOiBEaXNhYmxlIHNlY3VyaXR5IHhhdHRyIGluaXRpYWxpemF0aW9uIHNpbmNlIGl0
CiBuZXZlciB3b3JrZWQKCkNvbW1pdCBkODJkY2Q5ZTIxYjcgKCJyZWlzZXJmczogQWRkIHNlY3Vy
aXR5IHByZWZpeCB0byB4YXR0ciBuYW1lIGluCnJlaXNlcmZzX3NlY3VyaXR5X3dyaXRlKCkiKSwg
d2hpbGUgZml4ZWQgdGhlIHNlY3VyaXR5IHhhdHRyIGluaXRpYWxpemF0aW9uLAppdCBhbHNvIHJl
dmVhbGVkIGEgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IGJldHdlZW4gdGhlIHJlaXNlcmZz
IHdyaXRlCmxvY2sgYW5kIHRoZSBpbm9kZSBsb2NrLgoKU2luY2UgdGhlIGJ1ZyBpbiBzZWN1cml0
eSB4YXR0ciBpbml0aWFsaXphdGlvbiB3YXMgaW50cm9kdWNlZCBzaW5jZSB0aGUKYmVnaW5uaW5n
LCB0aGVyZSBjYW5ub3QgYmUgYW55IHVzZXIgb2YgdGhpcyBmZWF0dXJlLiBJbnN0ZWFkIG9mIHRy
eWluZyB0bwpmaXggdGhlIGxvY2tpbmcgZGVwZW5kZW5jeSwgd2hpY2ggd2FzIGFscmVhZHkgY2hh
bGxlbmdpbmcgdG8gY29udmVydCBmcm9tCkJMSywganVzdCBkaXNhYmxlIHRoZSBmZWF0dXJlLgoK
SG93ZXZlciwgc3RpbGwga2VlcCB0aGUgc2VjdXJpdHkgeGF0dHIgaGFuZGxlciwgc2luY2UgaXQg
d2FzIGludHJvZHVjZWQKZWFybGllciwgYW5kIHVzZXJzIG1pZ2h0IGhhdmUgbWFudWFsbHkgYWRk
ZWQgeGF0dHJzLgoKUmVwb3J0ZWQtYnk6IHN5emJvdCs4ZmI2NGE2MWZkZDk2YjUwZjNiOEBzeXpr
YWxsZXIuYXBwc3BvdG1haWwuY29tCkNsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20vYnVnP2V4dGlkPThmYjY0YTYxZmRkOTZiNTBmM2I4ClN1Z2dlc3RlZC1ieTogSmVmZiBNYWhv
bmV5IDxqZWZmbUBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iZXJ0byBTYXNzdSA8cm9iZXJ0
by5zYXNzdUBodWF3ZWkuY29tPgotLS0KIGZzL3JlaXNlcmZzL3N1cGVyLmMgICAgICAgICAgfCAy
ICsrCiBmcy9yZWlzZXJmcy94YXR0cl9zZWN1cml0eS5jIHwgMyArKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvcmVpc2VyZnMvc3VwZXIuYyBiL2Zz
L3JlaXNlcmZzL3N1cGVyLmMKaW5kZXggOTI5YWNjZTZlNzMuLjI2MjA0MWI4N2NkIDEwMDY0NAot
LS0gYS9mcy9yZWlzZXJmcy9zdXBlci5jCisrKyBiL2ZzL3JlaXNlcmZzL3N1cGVyLmMKQEAgLTE2
NTQsNiArMTY1NCw4IEBAIHN0YXRpYyBpbnQgcmVhZF9zdXBlcl9ibG9jayhzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnMsIGludCBvZmZzZXQpCiAKIAlyZWlzZXJmc193YXJuaW5nKE5VTEwsICIiLCAicmVp
c2VyZnMgZmlsZXN5c3RlbSBpcyBkZXByZWNhdGVkIGFuZCAiCiAJCSJzY2hlZHVsZWQgdG8gYmUg
cmVtb3ZlZCBmcm9tIHRoZSBrZXJuZWwgaW4gMjAyNSIpOworCXJlaXNlcmZzX3dhcm5pbmcoTlVM
TCwgIiIsICJpbml0aWFsaXppbmcgc2VjdXJpdHkgeGF0dHJzIG5ldmVyIHdvcmtlZCwgZGlzYWJs
ZSBpdCIpOworCiAJU0JfQlVGRkVSX1dJVEhfU0IocykgPSBiaDsKIAlTQl9ESVNLX1NVUEVSX0JM
T0NLKHMpID0gcnM7CiAKZGlmZiAtLWdpdCBhL2ZzL3JlaXNlcmZzL3hhdHRyX3NlY3VyaXR5LmMg
Yi9mcy9yZWlzZXJmcy94YXR0cl9zZWN1cml0eS5jCmluZGV4IDA3OGRkOGNjMzEyLi40MDM3YTk5
OGRiZiAxMDA2NDQKLS0tIGEvZnMvcmVpc2VyZnMveGF0dHJfc2VjdXJpdHkuYworKysgYi9mcy9y
ZWlzZXJmcy94YXR0cl9zZWN1cml0eS5jCkBAIC02OSw2ICs2OSw5IEBAIGludCByZWlzZXJmc19z
ZWN1cml0eV9pbml0KHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAogCXNl
Yy0+dmFsdWUgPSBOVUxMOwogCXNlYy0+bGVuZ3RoID0gMDsKIAorCS8qIFNlZSB3YXJuaW5nIGlu
IHJlYWRfc3VwZXJfYmxvY2soKS4gKi8KKwlyZXR1cm4gMDsKKwogCS8qIERvbid0IGFkZCBzZWxp
bnV4IGF0dHJpYnV0ZXMgb24geGF0dHJzIC0gdGhleSdsbCBuZXZlciBnZXQgdXNlZCAqLwogCWlm
IChJU19QUklWQVRFKGRpcikpCiAJCXJldHVybiAwOwotLSAKMi4yNS4xCgo=


--=-JzGDK1esDlvRzhOoEHct--

