From: Anders Larsen <al@alarsen.net>
Subject: Re: [PATCH v8 06/20] fs: Fill in max and min timestamps in
	superblock
Date: Tue, 20 Aug 2019 13:28:23 +0200
Message-ID: <10056508.664JITJLOY@alarsen.net>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
 <20190818165817.32634-7-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <20190818165817.32634-7-deepa.kernel@gmail.com>
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mtd@lists.infradead.org, darrick.wong@oracle.com, y2038@lists.linaro.org, richard@nod.at, codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu, linux-ext4@vger.kernel.org, salah.triki@gmail.com, dushistov@mail.ru, arnd@arndb.de, reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, aivazian.tigran@gmail.com, jaharkes@cs.cmu.edu, luisbg@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, jack@suse.com, linux-fsdevel@vger.kernel.org, phillip@squashfs.org.uk, dwmw2@infradead.org

T24gU3VuZGF5LCAyMDE5LTA4LTE4IDE4OjU4IERlZXBhIERpbmFtYW5pIHdyb3RlOgo+IEZpbGwg
aW4gdGhlIGFwcHJvcHJpYXRlIGxpbWl0cyB0byBhdm9pZCBpbmNvbnNpc3RlbmNpZXMKPiBpbiB0
aGUgdmZzIGNhY2hlZCBpbm9kZSB0aW1lcyB3aGVuIHRpbWVzdGFtcHMgYXJlCj4gb3V0c2lkZSB0
aGUgcGVybWl0dGVkIHJhbmdlLgo+IAo+IEV2ZW4gdGhvdWdoIHNvbWUgZmlsZXN5c3RlbXMgYXJl
IHJlYWQtb25seSwgZmlsbCBpbiB0aGUKPiB0aW1lc3RhbXBzIHRvIHJlZmxlY3QgdGhlIG9uLWRp
c2sgcmVwcmVzZW50YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogRGVlcGEgRGluYW1hbmkgPGRl
ZXBhLmtlcm5lbEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhcnJpY2sgSi4gV29uZyA8ZGFy
cmljay53b25nQG9yYWNsZS5jb20+Cj4gQ2M6IGFpdmF6aWFuLnRpZ3JhbkBnbWFpbC5jb20KPiBD
YzogYWxAYWxhcnNlbi5uZXQKPiBDYzogY29kYUBjcy5jbXUuZWR1Cj4gQ2M6IGRhcnJpY2sud29u
Z0BvcmFjbGUuY29tCj4gQ2M6IGR1c2hpc3RvdkBtYWlsLnJ1Cj4gQ2M6IGR3bXcyQGluZnJhZGVh
ZC5vcmcKPiBDYzogaGNoQGluZnJhZGVhZC5vcmcKPiBDYzogamFja0BzdXNlLmNvbQo+IENjOiBq
YWhhcmtlc0Bjcy5jbXUuZWR1Cj4gQ2M6IGx1aXNiZ0BrZXJuZWwub3JnCj4gQ2M6IG5pY29AZmx1
eG5pYy5uZXQKPiBDYzogcGhpbGxpcEBzcXVhc2hmcy5vcmcudWsKPiBDYzogcmljaGFyZEBub2Qu
YXQKPiBDYzogc2FsYWgudHJpa2lAZ21haWwuY29tCj4gQ2M6IHNoYWdneUBrZXJuZWwub3JnCj4g
Q2M6IGxpbnV4LXhmc0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogY29kYWxpc3RAY29kYS5jcy5jbXUu
ZWR1Cj4gQ2M6IGxpbnV4LWV4dDRAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGpmcy1kaXNjdXNzaW9uQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+IENjOiByZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgZnMvYmVmcy9s
aW51eHZmcy5jICAgICAgIHwgMiArKwo+ICBmcy9iZnMvaW5vZGUuYyAgICAgICAgICAgfCAyICsr
Cj4gIGZzL2NvZGEvaW5vZGUuYyAgICAgICAgICB8IDMgKysrCj4gIGZzL2NyYW1mcy9pbm9kZS5j
ICAgICAgICB8IDIgKysKPiAgZnMvZWZzL3N1cGVyLmMgICAgICAgICAgIHwgMiArKwo+ICBmcy9l
eHQyL3N1cGVyLmMgICAgICAgICAgfCAyICsrCj4gIGZzL2ZyZWV2eGZzL3Z4ZnNfc3VwZXIuYyB8
IDIgKysKPiAgZnMvamZmczIvZnMuYyAgICAgICAgICAgIHwgMyArKysKPiAgZnMvamZzL3N1cGVy
LmMgICAgICAgICAgIHwgMiArKwo+ICBmcy9taW5peC9pbm9kZS5jICAgICAgICAgfCAyICsrCj4g
IGZzL3FueDQvaW5vZGUuYyAgICAgICAgICB8IDIgKysKCndydCBxbng0LCBmZWVsIGZyZWUgdG8g
YWRkCkFja2VkLWJ5OiBBbmRlcnMgTGFyc2VuIDxhbEBhbGFyc2VuLm5ldD4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWTIwMzggbWFpbGluZyBsaXN0
ClkyMDM4QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8veTIwMzgK
