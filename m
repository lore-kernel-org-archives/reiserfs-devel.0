From: "Doug Wicks" <doug@ccbill.com>
Subject: FW: Bitmap alignment issues....
Date: Wed, 9 Feb 2005 11:41:12 -0700
Message-ID: <889A47B16278164FB657E0FFB1CAB8C75ED299@hq-exchange.ccbill-hq.local>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C50ED6.EE325C84"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------_=_NextPart_001_01C50ED6.EE325C84
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

How can I be taken off of this list?

doug@cavecreek.com
doug@ccbill.com


Thank you

=20
Douglas Wicks, Ph.D.
CCBill, Cavecreek Director of Sales
888-906-0666  x154 office
480-449-8811 direct line
icq # 68622974
www.ccbill.com   www.cavecreek.com   www.drmnetworks.com=20
=20

-----Original Message-----
From: Alex Zarochentsev [mailto:zam@namesys.com]=20
Sent: Wednesday, February 09, 2005 11:19 AM
To: Tom Evans
Cc: reiserfs-list@namesys.com
Subject: Re: Bitmap alignment issues....

hello,

On Wed, Feb 09, 2005 at 12:59:17PM -0500, Tom Evans wrote:
>=20
> Hi All -
>=20
> I am new to the list - I have been using Reiser4 on Linux/Alpha
> for several months now and like very much what it offers.
>=20
> (I use a -mm kernel from kernel.org with a Debian distro)
>=20
> Recently I became aware or a large number or alignment fixups
> occurring in the kernel, specifically in the reiser4 code.
>=20
> (My machine(s) would occasionally slow to a crawl when doing
>  intense disk i/o - I thought it was because I had recently
>  started using IDE drives in my systems (the IDE controllers
>  on these boards are notoriously slow) ).
>=20
> I determined that 50k+ alignment faults were happening
> per second - I traced the majority down to these 3 functions:
>=20
> 1) reiser4_find_next_set_bit  (in fs/reiser4/plugins/space/bitmap.c)
> 2) find_next_zero_bit (in asm/bitops.h)
> 3) replace_extent (in fs/reiser4/plugins/item/extent.c)
>=20
> The first 2 accounted for ~4million faults during boot - essentially,
> the base address of the bit array is not aligned properly
> for ulong accesses on Alpha (which are 64bit).
>=20
> I worked around this by using "get_unaligned()" for the array
> accesses in #1 and implemented a version of "find_next_zero_bit"
> local to reiser4 that handles unaligned base addresses (no need
> for all other users of the function to suffer the same performance
hit).
>=20
> Those 2 changes brought the number of alignment fixups to 0 on a boot
-=20
> the #3 issue accounts for a very small number of fixups - I have not
> yet found the exact location.
>=20
> While these changes eliminated the faults, they are not optimal,
> get_unaligned() adds many cycles over a standard load.
>=20
> I wanted to see if anyone here was already familiar with this issue
and
> what the process would be for getting it addressed.

it is known. ca you try the attached patch?

>=20
> Thanks for your patience!
>=20
> ...tom
>=20

--=20
Alex.

------_=_NextPart_001_01C50ED6.EE325C84
Content-Type: text/plain;
	name="bitmap-word-align-2.diff"
Content-Transfer-Encoding: base64
Content-Description: bitmap-word-align-2.diff
Content-Disposition: attachment;
	filename="bitmap-word-align-2.diff"

PT09PT0gcGx1Z2luL3NwYWNlL2JpdG1hcC5jIDEuMTg2IHZzIGVkaXRlZCA9PT09PQ0KLS0tIDEu
MTg2L3BsdWdpbi9zcGFjZS9iaXRtYXAuYwlXZWQgSmFuIDE5IDE4OjUyOjUyIDIwMDUNCisrKyBl
ZGl0ZWQvcGx1Z2luL3NwYWNlL2JpdG1hcC5jCVN1biBGZWIgIDYgMTk6MjM6MDEgMjAwNQ0KQEAg
LTU0LDEzICs1NCwxNSBAQA0KIA0KICNkZWZpbmUgQ0hFQ0tTVU1fU0laRSAgICA0DQogDQorI2Rl
ZmluZSBCWVRFU19QRVJfTE9ORyAgIChzaXplb2YobG9uZykpDQorDQogI2lmIEJJVFNfUEVSX0xP
TkcgPT0gNjQNCiAjICBkZWZpbmUgTE9OR19JTlRfU0hJRlQgKDYpDQogI2Vsc2UNCiAjICBkZWZp
bmUgTE9OR19JTlRfU0hJRlQgKDUpDQogI2VuZGlmDQogDQotI2RlZmluZSBMT05HX0lOVF9NQVNL
IChCSVRTX1BFUl9MT05HIC0gMSkNCisjZGVmaW5lIExPTkdfSU5UX01BU0sgKEJJVFNfUEVSX0xP
TkcgLSAxVUwpDQogDQogdHlwZWRlZiB1bnNpZ25lZCBsb25nIHVsb25nX3Q7DQogDQpAQCAtMTc5
LDE3ICsxODEsNDYgQEANCiANCiAjaW5jbHVkZSA8YXNtL2JpdG9wcy5oPg0KIA0KKyNpZiBCSVRT
X1BFUl9MT05HID09IDY0DQorDQorI2RlZmluZSBPRkYoYWRkcikgICgoKHVsb25nX3QpKGFkZHIp
ICYgKEJZVEVTX1BFUl9MT05HIC0gMSkpIDw8IDMpDQorI2RlZmluZSBCQVNFKGFkZHIpICgodWxv
bmdfdCopICgodWxvbmdfdCkoYWRkcikgJiB+KEJZVEVTX1BFUl9MT05HIC0gMSkpKQ0KKw0KK3N0
YXRpYyBpbmxpbmUgdm9pZCByZWlzZXI0X3NldF9iaXQoaW50IG5yLCB2b2lkICogYWRkcikNCit7
DQorCWV4dDJfc2V0X2JpdChuciArIE9GRihhZGRyKSwgQkFTRShhZGRyKSk7DQorfQ0KKw0KK3N0
YXRpYyBpbmxpbmUgdm9pZCByZWlzZXI0X2NsZWFyX2JpdChpbnQgbnIsIHZvaWQgKiBhZGRyKQ0K
K3sNCisJZXh0Ml9jbGVhcl9iaXQobnIgKyBPRkYoYWRkciksIEJBU0UoYWRkcikpOw0KK30NCisN
CitzdGF0aWMgaW5saW5lIGludCByZWlzZXI0X3Rlc3RfYml0KGludCBuciwgdm9pZCAqIGFkZHIp
DQorew0KKwlyZXR1cm4gZXh0Ml90ZXN0X2JpdChuciArIE9GRihhZGRyKSwgQkFTRShhZGRyKSk7
DQorfQ0KK3N0YXRpYyBpbmxpbmUgaW50IHJlaXNlcjRfZmluZF9uZXh0X3plcm9fYml0KHZvaWQg
KiBhZGRyLCBpbnQgbWF4b2Zmc2V0LCBpbnQgb2Zmc2V0KSANCit7DQorCWludCBvZmYgPSBPRkYo
YWRkcik7DQorDQorCXJldHVybiBleHQyX2ZpbmRfbmV4dF96ZXJvX2JpdChCQVNFKGFkZHIpLCBt
YXhvZmZzZXQgKyBvZmYsIG9mZnNldCArIG9mZikgLSBvZmY7DQorfQ0KKw0KKyNlbHNlDQorDQog
I2RlZmluZSByZWlzZXI0X3NldF9iaXQobnIsIGFkZHIpICAgIGV4dDJfc2V0X2JpdChuciwgYWRk
cikNCiAjZGVmaW5lIHJlaXNlcjRfY2xlYXJfYml0KG5yLCBhZGRyKSAgZXh0Ml9jbGVhcl9iaXQo
bnIsIGFkZHIpDQogI2RlZmluZSByZWlzZXI0X3Rlc3RfYml0KG5yLCBhZGRyKSAgZXh0Ml90ZXN0
X2JpdChuciwgYWRkcikNCiANCiAjZGVmaW5lIHJlaXNlcjRfZmluZF9uZXh0X3plcm9fYml0KGFk
ZHIsIG1heG9mZnNldCwgb2Zmc2V0KSBcDQogZXh0Ml9maW5kX25leHRfemVyb19iaXQoYWRkciwg
bWF4b2Zmc2V0LCBvZmZzZXQpDQorI2VuZGlmDQogDQogLyogU2VhcmNoIGZvciBhIHNldCBiaXQg
aW4gdGhlIGJpdCBhcnJheSBbQHN0YXJ0X29mZnNldCwgQG1heF9vZmZzZXRbLCBvZmZzZXRzDQog
ICogYXJlIGNvdW50ZWQgZnJvbSBAYWRkciwgcmV0dXJuIHRoZSBvZmZzZXQgb2YgdGhlIGZpcnN0
IGJpdCBpZiBpdCBpcyBmb3VuZCwNCiAgKiBAbWF4b2Zmc2V0IG90aGVyd2lzZS4gKi8NCi1zdGF0
aWMgYm1hcF9vZmZfdCByZWlzZXI0X2ZpbmRfbmV4dF9zZXRfYml0KA0KK3N0YXRpYyBibWFwX29m
Zl90IF9fcmVpc2VyNF9maW5kX25leHRfc2V0X2JpdCgNCiAJdm9pZCAqYWRkciwgYm1hcF9vZmZf
dCBtYXhfb2Zmc2V0LCBibWFwX29mZl90IHN0YXJ0X29mZnNldCkNCiB7DQogCXVsb25nX3QgKmJh
c2UgPSBhZGRyOw0KQEAgLTIyNSw2ICsyNTYsMjEgQEANCiANCiAJcmV0dXJuIG1heF9vZmZzZXQ7
DQogfQ0KKw0KKyNpZiBCSVRTX1BFUl9MT05HID09IDY0IA0KKw0KK3N0YXRpYyBibWFwX29mZl90
IHJlaXNlcjRfZmluZF9uZXh0X3NldF9iaXQoDQorCXZvaWQgKmFkZHIsIGJtYXBfb2ZmX3QgbWF4
X29mZnNldCwgYm1hcF9vZmZfdCBzdGFydF9vZmZzZXQpDQorew0KKwlibWFwX29mZl90IG9mZiA9
IE9GRihhZGRyKTsNCisNCisJcmV0dXJuIF9fcmVpc2VyNF9maW5kX25leHRfc2V0X2JpdChCQVNF
KGFkZHIpLCBtYXhfb2Zmc2V0ICsgb2ZmLCBzdGFydF9vZmZzZXQgKyBvZmYpIC0gb2ZmOw0KK30N
CisNCisjZWxzZQ0KKyNkZWZpbmUgcmVpc2VyNF9maW5kX25leHRfc2V0X2JpdChhZGRyLCBtYXhf
b2Zmc2V0LCBzdGFydF9vZmZzZXQpIFwNCisgIF9fcmVpc2VyNF9maW5kX25leHRfc2V0X2JpdChh
ZGRyLCBtYXhfb2Zmc2V0LCBzdGFydF9vZmZzZXQpIA0KKyNlbmRpZg0KIA0KIC8qIHNlYXJjaCBm
b3IgdGhlIGZpcnN0IHNldCBiaXQgaW4gc2luZ2xlIHdvcmQuICovDQogc3RhdGljIGludCBmaW5k
X2xhc3Rfc2V0X2JpdF9pbl93b3JkICh1bG9uZ190IHdvcmQsIGludCBzdGFydF9iaXQpDQo=

------_=_NextPart_001_01C50ED6.EE325C84--
