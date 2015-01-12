From: Luis Henriques <luis.henriques@canonical.com>
Subject: [PATCH 3.16.y-ckt 136/216] reiserfs: destroy allocated commit
 workqueue
Date: Mon, 12 Jan 2015 18:28:34 +0000
Message-ID: <1421087394-2712-24-git-send-email-luis.henriques@canonical.com>
References: <1421085933-32536-1-git-send-email-luis.henriques@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <kernel-team-bounces@lists.ubuntu.com>
In-Reply-To: <1421085933-32536-1-git-send-email-luis.henriques@canonical.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/kernel-team>,
 <mailto:kernel-team-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/kernel-team>
List-Post: <mailto:kernel-team@lists.ubuntu.com>
List-Help: <mailto:kernel-team-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/kernel-team>,
 <mailto:kernel-team-request@lists.ubuntu.com?subject=subscribe>
Errors-To: kernel-team-bounces@lists.ubuntu.com
Sender: kernel-team-bounces@lists.ubuntu.com
Content-Type: text/plain; charset="macroman"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org, kernel-team@lists.ubuntu.com
Cc: Jan Kara <jack@suse.cz>, Jiri Slaby <jslaby@suse.cz>, reiserfs-devel@vger.kernel.org

My4xNi43LWNrdDQgLXN0YWJsZSByZXZpZXcgcGF0Y2guICBJZiBhbnlvbmUgaGFzIGFueSBvYmpl
Y3Rpb25zLCBwbGVhc2UgbGV0IG1lIGtub3cuCgotLS0tLS0tLS0tLS0tLS0tLS0KCkZyb206IEpp
cmkgU2xhYnkgPGpzbGFieUBzdXNlLmN6PgoKY29tbWl0IGZhMGM1NTQwNzM5MzIwMjU4YzNlM2E0
NWFhYWU5ZGFlNDY3YjI1MDQgdXBzdHJlYW0uCgpXaGVuIHJlc2lyZWZzIGlzIHRyeWluZyB0byBt
b3VudCBhIHBhcnRpdGlvbiwgaXQgY3JlYXRlcyBhIGNvbW1pdAp3b3JrcXVldWUgKHNiaS0+Y29t
bWl0X3dxKS4gQnV0IHdoZW4gbW91bnQgZmFpbHMgbGF0ZXIsIHRoZSB3b3JrcXVldWUKaXMgbm90
IGZyZWVkLgoKU2lnbmVkLW9mZi1ieTogSmlyaSBTbGFieSA8anNsYWJ5QHN1c2UuY3o+ClJlcG9y
dGVkLWJ5OiBhdXhzdnJAZ21haWwuY29tClJlcG9ydGVkLWJ5OiBCZW5vw650IE1vbmluIDxiZW5v
aXQubW9uaW5AZ214LmZyPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IHJlaXNlcmZz
LWRldmVsQHZnZXIua2VybmVsLm9yZwpGaXhlczogNzk3ZDkwMTZjZWNhNjk4NzliYjI3MzIxODgx
MGZhMGJlZWY0NmFhYwpTaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpTaWdu
ZWQtb2ZmLWJ5OiBMdWlzIEhlbnJpcXVlcyA8bHVpcy5oZW5yaXF1ZXNAY2Fub25pY2FsLmNvbT4K
LS0tCiBmcy9yZWlzZXJmcy9zdXBlci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9yZWlzZXJmcy9zdXBlci5jIGIvZnMvcmVpc2VyZnMv
c3VwZXIuYwppbmRleCA1ZmQ4ZjU3ZTA3ZmMuLjI3NTc1MDQxYmVhMyAxMDA2NDQKLS0tIGEvZnMv
cmVpc2VyZnMvc3VwZXIuYworKysgYi9mcy9yZWlzZXJmcy9zdXBlci5jCkBAIC0yMTYxLDYgKzIx
NjEsOSBAQCBlcnJvcl91bmxvY2tlZDoKIAkJcmVpc2VyZnNfd3JpdGVfdW5sb2NrKHMpOwogCX0K
IAorCWlmIChzYmktPmNvbW1pdF93cSkKKwkJZGVzdHJveV93b3JrcXVldWUoc2JpLT5jb21taXRf
d3EpOworCiAJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZSRUlTRVJGU19TQihzKS0+b2xkX3dv
cmspOwogCiAJcmVpc2VyZnNfZnJlZV9iaXRtYXBfY2FjaGUocyk7Ci0tIAoyLjEuNAoKCi0tIApr
ZXJuZWwtdGVhbSBtYWlsaW5nIGxpc3QKa2VybmVsLXRlYW1AbGlzdHMudWJ1bnR1LmNvbQpodHRw
czovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9rZXJuZWwtdGVhbQo=
