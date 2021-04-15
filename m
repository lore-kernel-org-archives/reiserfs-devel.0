From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: RE: [PATCH 1/5] xattr: Complete constify ->name member of "struct
 xattr"
Date: Thu, 15 Apr 2021 12:25:49 +0000
Message-ID: <eedc6f82d59b4084b529788efd43e10b@huawei.com>
References: <20210415100435.18619-1-roberto.sassu@huawei.com>
 <20210415100435.18619-2-roberto.sassu@huawei.com>
 <164b0933-0917-457e-4dad-245ea13cbe52@i-love.sakura.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <164b0933-0917-457e-4dad-245ea13cbe52@i-love.sakura.ne.jp>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Jeff Mahoney <jeffm@suse.com>
Cc: "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "selinux@vger.kernel.org" <selinux@vger.kernel.org>, "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "zohar@linux.ibm.com" <zohar@linux.ibm.com>, "jmorris@namei.org" <jmorris@namei.org>, "paul@paul-moore.com" <paul@paul-moore.com>, "casey@schaufler-ca.com" <casey@schaufler-ca.com>

PiBGcm9tOiBUZXRzdW8gSGFuZGEgW21haWx0bzpwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJh
Lm5lLmpwXQ0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTUsIDIwMjEgMToyMCBQTQ0KPiBPbiAy
MDIxLzA0LzE1IDE5OjA0LCBSb2JlcnRvIFNhc3N1IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggY29t
cGxldGVzIGNvbW1pdCA5NTQ4OTA2YjJiYjcgKCd4YXR0cjogQ29uc3RpZnkgLT5uYW1lDQo+IG1l
bWJlciBvZg0KPiA+ICJzdHJ1Y3QgeGF0dHIiJykuIEl0IGZpeGVzIHRoZSBkb2N1bWVudGF0aW9u
IG9mIHRoZSBpbm9kZV9pbml0X3NlY3VyaXR5DQo+ID4gaG9vaywgYnkgcmVtb3ZpbmcgdGhlIHhh
dHRyIG5hbWUgZnJvbSB0aGUgb2JqZWN0cyB0aGF0IGFyZSBleHBlY3RlZCB0bw0KPiBiZQ0KPiA+
IGFsbG9jYXRlZCBieSBMU01zIChvbmx5IHRoZSB2YWx1ZSBpcyBhbGxvY2F0ZWQpLiBBbHNvLCBp
dCByZW1vdmVzIHRoZQ0KPiA+IGtmcmVlKCkgb2YgbmFtZSBhbmQgc2V0dGluZyBpdCB0byBOVUxM
IGluIHRoZSByZWlzZXJmcyBjb2RlLg0KPiANCj4gR29vZCBjYXRjaCwgYnV0IHdlbGwsIGdyZXAg
ZG9lcyBub3QgZmluZCBhbnkgcmVpc2VyZnNfc2VjdXJpdHlfZnJlZSgpIGNhbGxlcnMuDQo+IElz
IHJlaXNlcmZzX3NlY3VyaXR5X2ZyZWUoKSBhIGRlYWQgY29kZT8NCg0KVWhtLCBJIGFsc28gZG9u
J3Qgc2VlIGl0Lg0KDQpUaGFua3MNCg0KUm9iZXJ0bw0KDQpIVUFXRUkgVEVDSE5PTE9HSUVTIER1
ZXNzZWxkb3JmIEdtYkgsIEhSQiA1NjA2Mw0KTWFuYWdpbmcgRGlyZWN0b3I6IExpIFBlbmcsIExp
IEppYW4sIFNoaSBZYW5saQ0K
