From: jose.r.r@metztli.com (Metztli Information Technology)
Subject: Reiser4 Kernel 4.15.15 and Upgraded wireless-regdb for Debian AMD64
Date: Tue,  3 Apr 2018 23:52:26 -0700 (PDT)
Message-ID: <20180404065226.96F141683BC3@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="1596004372-1522824746=:31038"
Return-path: <bounce-debian-devel=glddg-debian-devel-5=m.gmane.org@lists.debian.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1522825060; h=From: Date: Message-Id: To: Subject:
 MIME-Version: Content-Type: Sender;
 bh=oVjToSr6VXQSrFYQg4q0S2bv9ZAKOBlWLujANDgpSTA=; b=UtfeD/Y2xfISNxZH7/+n2sfQcgwq2zX3PQGDH8z2a9w24djFjK7MAWv9YcGyeHsHTBtz2fS2
 LGbYOuQTZz5BgEysDehzjgIQOiBbagMv9O+PZfo3+9tZtMDNilHGhtyNwOR+5tR9YCTsQ5Va
 85dsY3tQrkpiYlNz5Uq22PEwkb0=
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Resent-Message-ID: <d0CEjdr73ZJ.A.PPC.BuHxaB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-devel/>
List-Post: <mailto:debian-devel@lists.debian.org>
List-Help: <mailto:debian-devel-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-devel-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-devel-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180404065226.96F141683BC3@huitzilopochtli.metztli-it.com
To: reiserfs-devel@vger.kernel.org, debian-devel@lists.debian.org

--1596004372-1522824746=:31038
Content-ID: <20180403235226.31038@huitzilopochtli.metztli-it.com>
Content-Type: text/plain


Niltze-

Built reiser4 enhanced Linux 4.15.15 wrapped by Debian packaging for kernel 4.15.11 (last I found) modified for GCC6 stretch-backports AMD64.

Upon booting kernel in wireless maching, it complained about:

platform regulatory.0: firmware: failed to load regulatory.db (-2)
[   12.134223] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[   12.134281] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[   12.134283] cfg80211: failed to load regulatory.db

Doing an online search it seems this is a 'feature' of kernels 4.15.x, i.e., below is for Slackware:

< https://www.linuxquestions.org/questions/linux-kernel-70/kernel-platform-regulatory-0-direct-firmware-load-for-regulatory-db-failed-with-error-2-a-4175622954/ >

Notwithstanding, Debian seems to be lacking relevant files in ~2016 (last/latest) wireless-regdb package.

Although I created a repo at Github

< https://metztli.github.io/wireless-regdb-metztli/ .

there is only a small hack to debian-example in git source for wireless-regdb, from upstream, thus created attached patch for

git clone git://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git

cd wireless-regdb

cat debian-upgraded-regulatory-regdb-for-4.15x.patch | patch -p1

dpkg-buildpackage -F -us -uc -j2 -T binary

Generates upgraded wireless-regdb_2018.04.02-1_all.deb

./lib/firmware/
./lib/firmware/regulatory.db      #1} Specifically
./lib/firmware/regulatory.db.p7s  #2} Linux 4.15.x needs
./usr/
./usr/lib/
./usr/lib/crda/
./usr/lib/crda/regulatory.bin     #3} these upgraded files.
./usr/share/
./usr/share/doc/
./usr/share/doc/wireless-regdb/
./usr/share/doc/wireless-regdb/README
./usr/share/doc/wireless-regdb/changelog.Debian.gz
./usr/share/doc/wireless-regdb/copyright

Of course, also
apt-get install crda
as it is recent from Debian repositories.

I built *both* packages (nmu .1 and -1) and made available *without* guarantee to solve your particular relevant issue:

https://metztli.it/readOnlyEphemeral/wireless-regdb_2018.04.02-1_all.deb

https://metztli.it/readOnlyEphemeral/crda_3.18-1.1_amd64.deb

They fix the above wireless regulatory.db issue(s) in my machine.


Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.14 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

--1596004372-1522824746=:31038
Content-ID: <20180403235226.31038.1@huitzilopochtli.metztli-it.com>
Content-Type: application/octet-stream; name=debian-upgraded-regulatory-regdb-for-4.15x.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=debian-upgraded-regulatory-regdb-for-4.15x.patch

RnJvbSA4ODdiNGVhNzMzZDUzMzU1NTZlOGRmOWUxNTk3YzRlODMwNzNiN2M4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNZXR6dGxpIEluZm9ybWF0aW9uIFRlY2hub2xvZ3kgPGpvc2VA
bWV0enRsaS1pdC5jb20+CkRhdGU6IFR1ZSwgMyBBcHIgMjAxOCAyMjozODo1MyAtMDcwMApTdWJq
ZWN0OiBbUEFUQ0hdIFVwZ3JhZGVkIExpbnV4IHdpcmVsZXNzIHJlZ3VsYXRvcnkgZGF0YWJhc2Ug
Zm9yIGtlcm5lbCA0LjE1LngKCi0tLQogZGViaWFuL2NoYW5nZWxvZyB8IDEzICsrKysrKysrKysr
KysKIGRlYmlhbi9jb21wYXQgICAgfCAgMSArCiBkZWJpYW4vY29udHJvbCAgIHwgMTUgKysrKysr
KysrKysrKysrCiBkZWJpYW4vY29weXJpZ2h0IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiBk
ZWJpYW4vZG9jcyAgICAgIHwgIDEgKwogZGViaWFuL3J1bGVzICAgICB8IDE4ICsrKysrKysrKysr
KysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZGViaWFuL2NoYW5nZWxvZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRlYmlhbi9jb21wYXQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkZWJpYW4vY29udHJvbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRl
Ymlhbi9jb3B5cmlnaHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkZWJpYW4vZG9jcwogY3JlYXRlIG1v
ZGUgMTAwNzU1IGRlYmlhbi9ydWxlcwoKZGlmZiAtLWdpdCBhL2RlYmlhbi9jaGFuZ2Vsb2cgYi9k
ZWJpYW4vY2hhbmdlbG9nCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjhmMDVh
MWQKLS0tIC9kZXYvbnVsbAorKysgYi9kZWJpYW4vY2hhbmdlbG9nCkBAIC0wLDAgKzEsMTMgQEAK
K3dpcmVsZXNzLXJlZ2RiICgyMDE4LjA0LjAyLTEpIG1ldHp0bGk7IHVyZ2VuY3k9bWVkaXVtCisK
KyAgKiBOb24tbWFpbnRhaW5lciB1cGxvYWQuCisgICogUmVpc2VyNCwgKFNGUk4pIDQuMC4yLCAt
ZW5hYmxlZCBMaW51eCA0LjE1LjE1IGZvciBzdHJldGNoLWJhY2twb3J0cyBuZWVkcyB0aGlzLgor
ICAqIE1vZGlmaWVkIGRlYmlhbi9ydWxlcyB0byBpbnN0YWxsIHJlZ3VsYXRvcnkuZGIucDdzICYg
cmVndWxhdG9yeS5kYiBhdCAvbGliL2Zpcm13YXJlCisKKyAtLSBNZXR6dGxpIEluZm9ybWF0aW9u
IFRlY2hub2xvZ3kgPGpvc2VAbWV0enRsaS1pdC5jb20+ICBNb24sIDAyIEFwciAyMDE4IDEzOjE0
OjAxIC0wNzAwCisKK3dpcmVsZXNzLXJlZ2RiICgyMDA5LjAxLjE1LTEpIHVuc3RhYmxlOyB1cmdl
bmN5PWxvdworCisgICogSW5pdGlhbCByZWxlYXNlCisKKyAtLSBMdWlzIFIuIFJvZHJpZ3VleiA8
bWNncm9mQGdtYWlsLmNvbT4gIFRodSwgMjIgSmFuIDIwMDkgMTY6MDA6MDAgKzAxMDAKZGlmZiAt
LWdpdCBhL2RlYmlhbi9jb21wYXQgYi9kZWJpYW4vY29tcGF0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAuLjdlZDZmZjgKLS0tIC9kZXYvbnVsbAorKysgYi9kZWJpYW4vY29tcGF0
CkBAIC0wLDAgKzEgQEAKKzUKZGlmZiAtLWdpdCBhL2RlYmlhbi9jb250cm9sIGIvZGViaWFuL2Nv
bnRyb2wKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uZTZlNzE2MQotLS0gL2Rl
di9udWxsCisrKyBiL2RlYmlhbi9jb250cm9sCkBAIC0wLDAgKzEsMTUgQEAKK1NvdXJjZTogd2ly
ZWxlc3MtcmVnZGIKK1NlY3Rpb246IGFkbWluCitQcmlvcml0eTogb3B0aW9uYWwKK01haW50YWlu
ZXI6IEx1aXMgUi4gUm9kcmlndWV6IDxtY2dyb2ZAZ21haWwuY29tPgorQnVpbGQtRGVwZW5kczog
Y2RicywgZGViaGVscGVyICg+PSA1KSwgcHl0aG9uCitTdGFuZGFyZHMtVmVyc2lvbjogMy43LjMK
KworUGFja2FnZTogd2lyZWxlc3MtcmVnZGIKK0FyY2hpdGVjdHVyZTogYWxsCitEZXBlbmRzOgor
U3VnZ2VzdHM6IGNyZGEKK0Rlc2NyaXB0aW9uOiBUaGUgTGludXggd2lyZWxlc3MgcmVndWxhdG9y
eSBkYXRhYmFzZQorIFRoaXMgcGFja2FnZSBjb250YWlucyB0aGUgd2lyZWxlc3MgcmVndWxhdG9y
eSBkYXRhYmFzZSB1c2VkIGJ5IGFsbAorIGNmZzgwMjExIGJhc2VkIExpbnV4IHdpcmVsZXNzIGRy
aXZlcnMuIFRoZSB3aXJlbGVzcyBkYXRhYmFzZSBiZWluZworIHVzZWQgaXMgbWFpbnRhaW5lZCBi
eSBTZXRoIEZvcnNoZWUuCmRpZmYgLS1naXQgYS9kZWJpYW4vY29weXJpZ2h0IGIvZGViaWFuL2Nv
cHlyaWdodApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5jMDFmMWEwCi0tLSAv
ZGV2L251bGwKKysrIGIvZGViaWFuL2NvcHlyaWdodApAQCAtMCwwICsxLDIxIEBACitUaGlzIHBh
Y2thZ2Ugd2FzIGRlYmlhbml6ZWQgYnkgTHVpcyBSb2RyaWd1ZXogPG1jZ3JvZkBnbWFpbC5jb20+
IG9uCitUaHUsIDIyIEphbiAyMDA5IDE2OjAwOjAwICswMTAwLgorCitUaGUgd2lyZWxlc3MtcmVn
ZGIgcGFja2FnZXMgd2FzIGRvd25sb2FkZWQgZnJvbSA8aHR0cDovL3dpcmVsZXNzLmtlcm5lbC5v
cmcvZG93bmxvYWQvd2lyZWxlc3MtcmVnZGIvPgorCitDb3B5cmlnaHQgKGMpIDIwMDgsIEx1aXMg
Ui4gUm9kcmlndWV6IDxtY2dyb2ZAZ21haWwuY29tPgorQ29weXJpZ2h0IChjKSAyMDA4LCBKb2hh
bm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBzb2x1dGlvbnMubmV0PgorQ29weXJpZ2h0IChjKSAyMDA4
LCBNaWNoYWVsIEdyZWVuIDxNaWNoYWVsLkdyZWVuQEF0aGVyb3MuY29tPgorCitQZXJtaXNzaW9u
IHRvIHVzZSwgY29weSwgbW9kaWZ5LCBhbmQvb3IgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJlIGZv
ciBhbnkKK3B1cnBvc2Ugd2l0aCBvciB3aXRob3V0IGZlZSBpcyBoZXJlYnkgZ3JhbnRlZCwgcHJv
dmlkZWQgdGhhdCB0aGUgYWJvdmUKK2NvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lv
biBub3RpY2UgYXBwZWFyIGluIGFsbCBjb3BpZXMuCisKK1RIRSBTT0ZUV0FSRSBJUyBQUk9WSURF
RCAiQVMgSVMiIEFORCBUSEUgQVVUSE9SIERJU0NMQUlNUyBBTEwgV0FSUkFOVElFUworV0lUSCBS
RUdBUkQgVE8gVEhJUyBTT0ZUV0FSRSBJTkNMVURJTkcgQUxMIElNUExJRUQgV0FSUkFOVElFUyBP
RgorTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTLiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQVVU
SE9SIEJFIExJQUJMRSBGT1IKK0FOWSBTUEVDSUFMLCBESVJFQ1QsIElORElSRUNULCBPUiBDT05T
RVFVRU5USUFMIERBTUFHRVMgT1IgQU5ZIERBTUFHRVMKK1dIQVRTT0VWRVIgUkVTVUxUSU5HIEZS
T00gTE9TUyBPRiBVU0UsIERBVEEgT1IgUFJPRklUUywgV0hFVEhFUiBJTiBBTgorQUNUSU9OIE9G
IENPTlRSQUNULCBORUdMSUdFTkNFIE9SIE9USEVSIFRPUlRJT1VTIEFDVElPTiwgQVJJU0lORyBP
VVQgT0YKK09SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgVVNFIE9SIFBFUkZPUk1BTkNFIE9GIFRI
SVMgU09GVFdBUkUuCisKZGlmZiAtLWdpdCBhL2RlYmlhbi9kb2NzIGIvZGViaWFuL2RvY3MKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uZTg0NTU2NgotLS0gL2Rldi9udWxsCisr
KyBiL2RlYmlhbi9kb2NzCkBAIC0wLDAgKzEgQEAKK1JFQURNRQpkaWZmIC0tZ2l0IGEvZGViaWFu
L3J1bGVzIGIvZGViaWFuL3J1bGVzCm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAu
LjViNTRiOGMKLS0tIC9kZXYvbnVsbAorKysgYi9kZWJpYW4vcnVsZXMKQEAgLTAsMCArMSwxOCBA
QAorIyEvdXNyL2Jpbi9tYWtlIC1mCisKK2luY2x1ZGUgL3Vzci9zaGFyZS9jZGJzLzEvcnVsZXMv
ZGViaGVscGVyLm1rCisKK1BSRUZJWCA9IC91c3IKKyMgSm9zZS9NZXR6dGxpIElUOiAwNC0wMi0y
MDE4CitQUkVGSVhfRklSTSA9IC9saWIKK0NSREFfTElCID89ICQoUFJFRklYKS9saWIvY3JkYQor
IyBKb3NlL01ldHp0bGkgSVQ6IDA0LTAyLTIwMTgKK0NSREFfRklSTSA/PSAkKFBSRUZJWF9GSVJN
KS9maXJtd2FyZQorCitpbnN0YWxsL3dpcmVsZXNzLXJlZ2RiOjoKKwlpbnN0YWxsIC1vIDAgLWcg
MCAtbSA3NTUgLWQgZGViaWFuLyQoY2Ric19jdXJwa2cpLyQoQ1JEQV9MSUIpCisJaW5zdGFsbCAt
byAwIC1nIDAgLW0gNjQ0IHJlZ3VsYXRvcnkuYmluIGRlYmlhbi8kKGNkYnNfY3VycGtnKS8kKENS
REFfTElCKS9yZWd1bGF0b3J5LmJpbgorIyBKb3NlL01ldHp0bGkgSVQ6IDA0LTAyLTIwMTgKKwlp
bnN0YWxsIC1vIDAgLWcgMCAtbSA3NTUgLWQgZGViaWFuLyQoY2Ric19jdXJwa2cpLyQoQ1JEQV9G
SVJNKQorCWluc3RhbGwgLW8gMCAtZyAwIC1tIDY0NCByZWd1bGF0b3J5LmRiIGRlYmlhbi8kKGNk
YnNfY3VycGtnKS8kKENSREFfRklSTSkvcmVndWxhdG9yeS5kYgorCWluc3RhbGwgLW8gMCAtZyAw
IC1tIDY0NCByZWd1bGF0b3J5LmRiLnA3cyBkZWJpYW4vJChjZGJzX2N1cnBrZykvJChDUkRBX0ZJ
Uk0pL3JlZ3VsYXRvcnkuZGIucDdzCi0tIAoyLjE0LjIKCg==
--1596004372-1522824746=:31038--

