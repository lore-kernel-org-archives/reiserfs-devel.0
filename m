From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 6/6] vfs: change inode times to use struct
	timespec64
Date: Fri, 11 May 2018 23:44:43 -0700
Message-ID: <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
References: <20180512045921.18311-1-deepa.kernel@gmail.com>
 <20180512045921.18311-7-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <20180512045921.18311-7-deepa.kernel@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/y2038/>
List-Post: <mailto:y2038@lists.linaro.org>
List-Help: <mailto:y2038-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=subscribe>
Errors-To: y2038-bounces@lists.linaro.org
Sender: "Y2038" <y2038-bounces@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nico@linaro.org>, Christoph Hellwig <hch@lst.de>, hubcap@omnibond.com, Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, y2038 Mailman List <y2038@lists.linaro.org>, Richard Weinberger <richard@nod.at>, mark@fasheh.com, anton@tuxera.com, "J. Bruce Fields" <bfields@fieldses.org>, Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, jaharkes@cs.cmu.edu, reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Steven Whitehouse <swhiteho@redhat.com>, hirofumi@mail.parknet.co.jp, Felipe Balbi <balbi@kernel.org>, Ted Ts'o <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>, LKML <linux-kernel@vger.kernel>

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgOTo1OSBQTSwgRGVlcGEgRGluYW1hbmkgPGRlZXBhLmtl
cm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9mcy9wc3RvcmUvaW5vZGUuYyBi
L2ZzL3BzdG9yZS9pbm9kZS5jCj4gaW5kZXggNWZjYjg0NWI5ZmVjLi5mYjY4MWQzMDJiYjMgMTAw
NjQ0Cj4gLS0tIGEvZnMvcHN0b3JlL2lub2RlLmMKPiArKysgYi9mcy9wc3RvcmUvaW5vZGUuYwo+
IEBAIC0zOTIsNyArMzkyLDcgQEAgaW50IHBzdG9yZV9ta2ZpbGUoc3RydWN0IGRlbnRyeSAqcm9v
dCwgc3RydWN0IHBzdG9yZV9yZWNvcmQgKnJlY29yZCkKPiAgICAgICAgIGlub2RlLT5pX3ByaXZh
dGUgPSBwcml2YXRlOwo+Cj4gICAgICAgICBpZiAocmVjb3JkLT50aW1lLnR2X3NlYykKPiAtICAg
ICAgICAgICAgICAgaW5vZGUtPmlfbXRpbWUgPSBpbm9kZS0+aV9jdGltZSA9IHJlY29yZC0+dGlt
ZTsKPiArICAgICAgICAgICAgICAgaW5vZGUtPmlfbXRpbWUgPSBpbm9kZS0+aV9jdGltZSA9IHRp
bWVzcGVjX3RvX3RpbWVzcGVjNjQocmVjb3JkLT50aW1lKTsKPgo+ICAgICAgICAgZF9hZGQoZGVu
dHJ5LCBpbm9kZSk7CgpJJ20gZmluZSB0byBqdXN0IGNvbnZlcnQgcHN0b3JlIGludGVybmFsbHkg
dG8gdGltZXNwZWM2NCByaWdodCBub3cuIElzCml0IGNvcnJlY3QgdG8gc2F5IHRoYXQgSSBzaG91
bGQgdXNlIHRpbWVzcGVjNjRfdG9fdGltZXNwZWMoKSBoZXJlCnVudGlsIHRoaXMgZmxhZyBkYXkg
cGF0Y2g/IEFuZCBJJ2QgbmVlZCB0byBkbyB0aGlzIGFzIHdlbGwsIHllcz8KCmZzL3BzdG9yZS9w
bGF0Zm9ybS5jOiAgICAgcmVjb3JkLT50aW1lID0KbnNfdG9fdGltZXNwZWM2NChrdGltZV9nZXRf
cmVhbF9mYXN0X25zKCkpOwoKVGhhbmtzIQoKLUtlZXMKCi0tIApLZWVzIENvb2sKUGl4ZWwgU2Vj
dXJpdHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWTIw
MzggbWFpbGluZyBsaXN0ClkyMDM4QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5h
cm8ub3JnL21haWxtYW4vbGlzdGluZm8veTIwMzgK
