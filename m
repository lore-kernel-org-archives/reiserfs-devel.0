From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Date: Mon, 18 Sep 2023 16:58:05 +0200
Message-ID: <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca>
 <20230918132614.zmmuc72purc2psik@quack3>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oalVF5rskk13LsxYZPaMVXMiqE1K1wBZW+BOx0KtAdI=; b=HQmnpd5r1ePAJG
	xTSflgd67v+Ju5vOA7vIiaf10p7sif0D4xmY7dmqNvS0O23eYnHMYrGptDjCSnNhI0Whg8kSqHY7I
	8QnI18N3hck6Fb23vrlRA3RhWaGosUnn4EJO1AaPV+6yFzHUH1W3DZzQhTcVShE89n8Tv3mewFhg4
	ykPnahcD7Sl3guX7koBfA4EElDDgM4T9HEi6IVwwVXJxw/jfiph7SHr8AjLxcG7vwBo8THTm8wP9I
	6IWEbwhPIF/q5aonCbnD3/sqNbhbHmKB/XFGGnAJnOQmNWrLsHJxo5OpWDf4f950jfPvTiItE2chD
	aNee7dlYTx4HZtLXD5rA==;
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
Content-Type: text/plain; charset="windows-1252"
To: Jan Kara <jack@suse.cz>
Cc: Peter Lafreniere <peter@n8pjl.ca>, linux-um@lists.infradead.org, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org

SGkgSmFuLAoKT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMzoyNuKAr1BNIEphbiBLYXJhIDxqYWNr
QHN1c2UuY3o+IHdyb3RlOgo+IE9uIE1vbiAxOC0wOS0yMyAxMjo1ODoyNiwgUGV0ZXIgTGFmcmVu
aWVyZSB3cm90ZToKPiA+IFJlaXNlckZTIGhhcyBiZWVuIGRlcHJlY2F0ZWQgZm9yIGEgeWVhciBh
bmQgYSBoYWxmLCB5ZXQgaXMgc3RpbGwgYnVpbHQKPiA+IGFzIHBhcnQgb2YgYSBkZWZjb25maWcg
VU1MIGtlcm5lbC4KPiA+Cj4gPiBBY2NvcmRpbmcgdG8gY29tbWl0IGViMTAzYTUxNjQwZSAoInJl
aXNlcmZzOiBEZXByZWNhdGUgcmVpc2VyZnMiKSwgdGhlCj4gPiBmaWxlc3lzdGVtIGlzIHNsYXRl
ZCB0byBiZSByZW1vdmVkIGluIDIwMjUuIFJlbW92ZSBpdCBmcm9tIHRoZSBkZWZjb25maWcKPiA+
IHByb2ZpbGUgbm93LCBhcyBwYXJ0IG9mIGl0cyBkZXByZWNhdGlvbiBwcm9jZXNzLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIExhZnJlbmllcmUgPHBldGVyQG44cGpsLmNhPgo+Cj4gTWFr
ZXMgc2Vuc2UgYnV0IEkndmUgbm90aWNlZCB0aGVyZSBhcmUgbWFueSBtb3JlIGFyY2hpdGVjdHVy
ZXMgdGhhdCBkZWZpbmUKPiBDT05GSUdfUkVJU0VSRlNfRlMgaW4gdGhlaXIgZGVmY29uZmlnIChz
aCwgcG93ZXJwYywgbWlwcywgbTY4aywgaWE2NCwgYXJtLAo+IGFscGhhKS4gU28gcGVyaGFwcyB3
ZSBzaG91bGQgZG8gdGhpcyBmb3IgYWxsIG9mIHRoZW0gd2hlbiB3ZSBhcmUgYXQgaXQ/CgpUaGUg
cG9saWN5IGZvciB0aGUgbTY4ayBkZWZjb25maWdzIGlzIHRvIGVuYWJsZSBhbGwgYXZhaWxhYmxl
IGV4b3RpYwpmaWxlIHN5c3RlbXMgYXMgbW9kdWxlcywgc28gc3VwcG9ydCBmb3IgdGhlbSBpcyBh
dmFpbGFibGUgd2hlbiBuZWVkZWQuCgpQbGVhc2UgbGV0IG1lIGtub3cgd2h5IHRoaXMgc2hvdWxk
IGJlIGNoYW5nZWQsIGFzIGxvbmcgYXMgUmVpc2VyRlMgaXMKc3RpbGwgYXZhaWxhYmxlIGluIHRo
ZSB1cHN0cmVhbSBrZXJuZWwuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXVtIG1haWxpbmcgbGlzdApsaW51eC11bUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
dW0K
