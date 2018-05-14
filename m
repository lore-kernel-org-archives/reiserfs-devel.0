From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 6/6] vfs: change inode times to use struct
	timespec64
Date: Mon, 14 May 2018 10:53:00 -0700
Message-ID: <CAGXu5jLdPMK_EN5wekwbusaKzYOwsFCsFmy7coOEqxB-sGv+JQ@mail.gmail.com>
References: <20180512045921.18311-1-deepa.kernel@gmail.com>
 <20180512045921.18311-7-deepa.kernel@gmail.com>
 <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
 <CABeXuvpi_dm6TE3pH_KGehgNwW177hJFBmR8u29w6KJH1aA1Kg@mail.gmail.com>
 <CAGXu5jJpO+z8k_=UuVY9WAeiEgABQg4gWE6nz82BX0_UhaPUWw@mail.gmail.com>
 <CABeXuvrO5XLD5QhBPui-v_G6JX=FgcaZLOL0C6B40f4oCyqOWg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <CABeXuvrO5XLD5QhBPui-v_G6JX=FgcaZLOL0C6B40f4oCyqOWg@mail.gmail.com>
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
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nico@linaro.org>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, y2038 Mailman List <y2038@lists.linaro.org>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, anton@tuxera.com, "J. Bruce Fields" <bfields@fieldses.org>, Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, Jan Harkes <jaharkes@cs.cmu.edu>, reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Steven Whitehouse <swhiteho@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Felipe Balbi <balbi@kernel.org>, Ted Ts'o <tytso@mit.edu>, Miklos

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMTA6MjUgQU0sIERlZXBhIERpbmFtYW5pIDxkZWVwYS5r
ZXJuZWxAZ21haWwuY29tPiB3cm90ZToKPiBPbiBNb24sIE1heSAxNCwgMjAxOCBhdCA5OjMwIEFN
LCBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4+IE9uIFN1biwgTWF5
IDEzLCAyMDE4IGF0IDk6MDUgUE0sIERlZXBhIERpbmFtYW5pIDxkZWVwYS5rZXJuZWxAZ21haWwu
Y29tPiB3cm90ZToKPj4+IEtlZXMgbWVudGlvbmVkIHRoYXQgaGUgd2FudHMgdG8gbWVyZ2UgYSBw
YXRjaCB0byBwc3RvcmUgdGhhdCBjaGFuZ2VzCj4+PiBpdCB0byB1c2UgdGltZXNwZWM2NCBpbnRl
cm5hbGx5IGZvciA0LjE3Ogo+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvNS8xMy8zCj4+
Cj4+IEknbSBzdGlsbCB3b3JraW5nIG9uIGEgdjIgZm9yIHBzdG9yZS4gV2hhdCBpcyB0aGUgY29y
cmVjdAo+PiBjcm9zcy1hcmNoaXRlY3R1cmUgZm9ybWF0IHN0cmluZyBmb3IgdGltZXNwZWM2NCdz
IHR2X3NlYz8gSW4geW91cgo+PiBvdGhlciBwYXRjaGVzLCB5b3UncmUgdXNpbmcgJWxsZCBhbmQg
YSAobG9uZyBsb25nKSBjYXN0LiBJJ2QgcmVhbGx5Cj4+IGxpa2UgdG8gYXZvaWQgdGhlIG5lZWQg
Zm9yIGNhc3RzLgo+Cj4gV2UgY2Fubm90IHJlYWxseSBhdm9pZCBpdCBmb3Igbm93Lgo+IHN0cnVj
dCB0aW1lc3BlYzY0IGlzIGRlZmluZWQgdGhpcyB3YXkgZm9yIG5vdzoKPgo+IHN0cnVjdCB0aW1l
c3BlYyB7Cj4gX19rZXJuZWxfdGltZV90IHR2X3NlYzsgLyogc2Vjb25kcyAqLwo+IGxvbmcgdHZf
bnNlYzsgLyogbmFub3NlY29uZHMgKi8KPiB9Owo+Cj4gI2lmIF9fQklUU19QRVJfTE9ORyA9PSA2
NAo+IC8qIHRoaXMgdHJpY2sgYWxsb3dzIHVzIHRvIG9wdGltaXplIG91dCB0aW1lc3BlYzY0X3Rv
X3RpbWVzcGVjICovCj4gIyBkZWZpbmUgdGltZXNwZWM2NCB0aW1lc3BlYwo+Cj4gI2Vsc2UKPgo+
IHN0cnVjdCB0aW1lc3BlYzY0IHsKPiB0aW1lNjRfdCB0dl9zZWM7IC8qIHNlY29uZHMgKi8KPiBs
b25nIHR2X25zZWM7IC8qIG5hbm9zZWNvbmRzICovCj4gfTsKPgo+ICNlbmRpZgo+Cj4gVGhpcyB3
aWxsIGFsbCBsZWFkIHRvIHR2X3NlYyBiZWluZyBsb25nIG9uIGEgNjQgYml0IGFyY2hpdGVjdHVy
ZSBhbmQKPiBsb25nIGxvbmcgb24gYSAzMiBiaXQgYXJjaGl0ZWN0dXJlLgo+IFNvIHRoZXJlIGlz
IG5vIHdheSBvZiBhdm9pZGluZyB0aGUgY2FzdCBmb3Igbm93Lgo+Cj4gV2UgcGxhbiB0byBnZXQg
cmlkIG9mIHRoaXMgdHJpY2sgYW5kIHRvIGhhdmUgYSBzaW5nbGUgZGVmaW5pdGlvbiBmb3IKPiB0
aW1lc3BlYzY0LiBCdXQsIHRoYXQgY2xlYW51cCBpcyBwbGFubmVkIGZvciBsYXRlciB3aGVuIHdl
IGNsZWFudXAgYWxsCj4gc3RydWN0IHRpbWVzcGVjIHVzZXMgaW50ZXJuYWxseS4KCkNhbiB3ZSBk
byBzb21ldGhpbmcgbGlrZToKCiNpZiBfX0JJVFNfUEVSX0xPTkcgPT0gNjQKIyBkZWZpbmUgVFZT
RUNfRk1UICIlbGQiCiNlbHNlCiMgZGVmaW5lIFRWU0VDX0ZNVCAiJWxsZCIKI2VuZGlmCgpzbyB3
ZSBjYW4gZG8gc3R1ZmYgbGlrZTogIHNwcmludGYoYnVmLCAic2Vjb25kczogIiBLVElNRV9GTVQs
IHRpbWUtPnR2X3NlYykKCj8gSXQgc2VlbXMgZWFzaWVyIHRvIGNsZWFuIHVwIHRoYW4gY2FzdHMu
CgotS2VlcwoKLS0gCktlZXMgQ29vawpQaXhlbCBTZWN1cml0eQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpZMjAzOCBtYWlsaW5nIGxpc3QKWTIwMzhAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby95
MjAzOAo=
