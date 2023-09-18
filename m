From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Date: Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
Message-ID: <1673328726.54148.1695045508095.JavaMail.zimbra@nod.at>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca> <20230918132614.zmmuc72purc2psik@quack3>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lKO47h7s3eRy0kQTMzcTRkrKzLenqAGVHCW2wiwhoGE=; b=EE/lthTTjMN+PFrvDlP0pmGEnX
	HNbjlilvkKGQK0stF83gR2Pqc6QmhSk6jLGXigxMh6tUDIVOofbJPNjpV1rrjvEPIr0ZFXof2+T2j
	bw8bINCo/t9rLENO8GUokM0qK03Bkyd2nah5gLOYi0M6ROg5Wei2z1XoTR3IZ2cpkaPMTnHIWuaaE
	x50XA+a5auXaiHx/v8lg2e3NZvVYeAVLndtvjzZEde3N3fUnaJORTGI8rqDJI8qG9Bt2O7tjfocrV
	JV0hoevS0z0SJFqP3sMMctzL1i9g/qW7Qf7R8BiUlG93HJAwFJWgNg7XtFAlnF+ErOhcuXyxeLjR7
	DfuL/TqQ==;
In-Reply-To: <20230918132614.zmmuc72purc2psik@quack3>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Kara <jack@suse.cz>
Cc: Peter Lafreniere <peter@n8pjl.ca>, linux-um <linux-um@lists.infradead.org>, anton ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, reiserfs-devel@vger.kernel.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE9uIE1vbiAxOC0wOS0yMyAxMjo1ODoy
NiwgUGV0ZXIgTGFmcmVuaWVyZSB3cm90ZToKPj4gUmVpc2VyRlMgaGFzIGJlZW4gZGVwcmVjYXRl
ZCBmb3IgYSB5ZWFyIGFuZCBhIGhhbGYsIHlldCBpcyBzdGlsbCBidWlsdAo+PiBhcyBwYXJ0IG9m
IGEgZGVmY29uZmlnIFVNTCBrZXJuZWwuCj4+IAo+PiBBY2NvcmRpbmcgdG8gY29tbWl0IGViMTAz
YTUxNjQwZSAoInJlaXNlcmZzOiBEZXByZWNhdGUgcmVpc2VyZnMiKSwgdGhlCj4+IGZpbGVzeXN0
ZW0gaXMgc2xhdGVkIHRvIGJlIHJlbW92ZWQgaW4gMjAyNS4gUmVtb3ZlIGl0IGZyb20gdGhlIGRl
ZmNvbmZpZwo+PiBwcm9maWxlIG5vdywgYXMgcGFydCBvZiBpdHMgZGVwcmVjYXRpb24gcHJvY2Vz
cy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIExhZnJlbmllcmUgPHBldGVyQG44cGpsLmNh
Pgo+IAo+IE1ha2VzIHNlbnNlIGJ1dCBJJ3ZlIG5vdGljZWQgdGhlcmUgYXJlIG1hbnkgbW9yZSBh
cmNoaXRlY3R1cmVzIHRoYXQgZGVmaW5lCj4gQ09ORklHX1JFSVNFUkZTX0ZTIGluIHRoZWlyIGRl
ZmNvbmZpZyAoc2gsIHBvd2VycGMsIG1pcHMsIG02OGssIGlhNjQsIGFybSwKPiBhbHBoYSkuIFNv
IHBlcmhhcHMgd2Ugc2hvdWxkIGRvIHRoaXMgZm9yIGFsbCBvZiB0aGVtIHdoZW4gd2UgYXJlIGF0
IGl0PwoKWWVzLCBhIGNvbWJpbmVkIHBhdGNoIG1ha2VzIGluIHRoaXMgY2FzZSBtb3JlIHNlbnNl
LgoKPj4gCj4+ICBhcmNoL3VtL2NvbmZpZ3MvaTM4Nl9kZWZjb25maWcgICB8IDEgLQo+PiAgYXJj
aC91bS9jb25maWdzL3g4Nl82NF9kZWZjb25maWcgfCAxIC0KPj4gIDIgZmlsZXMgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKCkZvciBVTUw6CkFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXVtIG1haWxpbmcgbGlzdApsaW51eC11bUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtdW0K
