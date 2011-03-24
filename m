From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: search_one_bitmap_forward oops
Date: Thu, 24 Mar 2011 22:42:19 +0100
Message-ID: <4D8BBABB.3060409@gmail.com>
References: <4BFFA494.4060509@gmail.com> <4C7BD349.5070005@tls-tautenburg.de> <4C7BD64B.9070005@gmail.com> <4C7BF309.8070906@tls-tautenburg.de> <4C7C04FB.9070901@gmail.com> <4D7CAE07.2090907@tls-tautenburg.de> <4D7FECB3.4090804@gmail.com> <4D8A771B.7080903@tls-tautenburg.de> <4D8A7E79.90407@gmail.com> <4D8A838C.5040702@tls-tautenburg.de> <4D8A85D5.2010201@gmail.com> <4D8A8893.9000802@tls-tautenburg.de> <4D8A8C6D.7070906@gmail.com> <4D8B5646.8020609@tls-tautenburg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010007060707040307090706"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D8B5646.8020609@tls-tautenburg.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Bringfried Stecklum <stecklum@tls-tautenburg.de>, Serkan Kaba <serkan@gentoo.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010007060707040307090706
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2011 03:33 PM, Bringfried Stecklum wrote:
> Edward Shishkin wrote:
>> On 03/24/2011 12:56 AM, Bringfried Stecklum wrote:
>>> Edward Shishkin wrote:
>>>> On 03/24/2011 12:34 AM, Bringfried Stecklum wrote:
>>>>> Edward Shishkin wrote:
>>>>>> On 03/23/2011 11:41 PM, Bringfried Stecklum wrote:
>>>>>>> Dear Edward,
>>>>>>>
>>>>>>> thanks for the reply. Since I contacted you again concerning this
>>>>>>> bug,
>>>>>>> my system is going mad because of it. I didn't change anything
>>>>>>> concerning the kernel but even just after login and idling, the bug
>>>>>>> happens. I'd like to stay with Reiser4. But right now it is getting
>>>>>>> really difficult.
>>>>>>
>>>>>> Do you use the mount option "dont_load_bitmap"?
>>>>>
>>>>> Yes, I used it so far for faster booting but switched it off now.
>>>>
>>>>
>>>> Please, don't use this mount option for now: it doesn't
>>>> work properly. I'll try to reproduce and fix it at leisure.
>>>
>>> Looks like, up'n running now for half an hour. Normally, I prefer to
>>> hibernate between sessions and thus boot rarely, the longer boot time is
>>> no obstacle. Good luck with fixing the issue.
>>
>>
>> It looks like missing bitmap is not uploaded somewhere..
>
> But it used to work quite some time...

It seems I have found the bug.

The problem arises when we get to the /* race: ...*/ point (see
the attached patch). This is not an error path, nevertheless we
release all bitmaps and set zeroes to bnode fields. Welcome to
the Oops...

Everyone, who experienced problems with on-demand bitmap loading
in reiser4 (the mount option "dont_load_bitmap"), please, try the 
attached patch.

Thanks,
Edward.

--------------010007060707040307090706
Content-Type: text/plain;
 name="reiser4-fix-on-demand-bitmap-load.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="reiser4-fix-on-demand-bitmap-load.patch"

SW5kZXg6IGxpbnV4LTIuNi4zOC9mcy9yZWlzZXI0L3BsdWdpbi9zcGFjZS9iaXRtYXAuYwo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Ci0tLSBsaW51eC0yLjYuMzgub3JpZy9mcy9yZWlzZXI0L3BsdWdpbi9z
cGFjZS9iaXRtYXAuYworKysgbGludXgtMi42LjM4L2ZzL3JlaXNlcjQvcGx1Z2luL3NwYWNl
L2JpdG1hcC5jCkBAIC04MzAsNDUgKzgzMCw0MyBAQCBzdGF0aWMgaW50IGxvYWRfYW5kX2xv
Y2tfYm5vZGUoc3RydWN0IGJpCiAJfQogCiAJcmV0ID0gcHJlcGFyZV9ibm9kZShibm9kZSwg
JmNqbm9kZSwgJndqbm9kZSk7Ci0JaWYgKHJldCA9PSAwKSB7Ci0JCW11dGV4X2xvY2soJmJu
b2RlLT5tdXRleCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAotCQlpZiAoIWF0b21p
Y19yZWFkKCZibm9kZS0+bG9hZGVkKSkgewotCQkJYXNzZXJ0KCJuaWtpdGEtMjgyMiIsIGNq
bm9kZSAhPSBOVUxMKTsKLQkJCWFzc2VydCgibmlraXRhLTI4MjMiLCB3am5vZGUgIT0gTlVM
TCk7Ci0JCQlhc3NlcnQoIm5pa2l0YS0yODI0Iiwgam5vZGVfaXNfbG9hZGVkKGNqbm9kZSkp
OwotCQkJYXNzZXJ0KCJuaWtpdGEtMjgyNSIsIGpub2RlX2lzX2xvYWRlZCh3am5vZGUpKTsK
LQotCQkJYm5vZGUtPndqbm9kZSA9IHdqbm9kZTsKLQkJCWJub2RlLT5jam5vZGUgPSBjam5v
ZGU7Ci0KLQkJCXJldCA9IGNoZWNrX3N0cnVjdF9ibm9kZShibm9kZSwgY3VycmVudF9ibG9j
a3NpemUpOwotCQkJaWYgKCFyZXQpIHsKLQkJCQljam5vZGUgPSB3am5vZGUgPSBOVUxMOwot
CQkJCWF0b21pY19zZXQoJmJub2RlLT5sb2FkZWQsIDEpOwotCQkJCS8qIHdvcmtpbmcgYml0
bWFwIGlzIGluaXRpYWxpemVkIGJ5IG9uLWRpc2sKLQkJCQkgKiBjb21taXQgYml0bWFwLiBU
aGlzIHNob3VsZCBiZSBwZXJmb3JtZWQKLQkJCQkgKiB1bmRlciBtdXRleC4gKi8KLQkJCQlt
ZW1jcHkoYm5vZGVfd29ya2luZ19kYXRhKGJub2RlKSwKLQkJCQkgICAgICAgYm5vZGVfY29t
bWl0X2RhdGEoYm5vZGUpLAotCQkJCSAgICAgICBibWFwX3NpemUoY3VycmVudF9ibG9ja3Np
emUpKTsKLQkJCX0gZWxzZQotCQkJCW11dGV4X3VubG9jaygmYm5vZGUtPm11dGV4KTsKLQkJ
fSBlbHNlCi0JCQkvKiByYWNlOiBzb21lb25lIGFscmVhZHkgbG9hZGVkIGJpdG1hcCB3aGls
ZSB3ZSB3ZXJlCi0JCQkgKiBidXN5IGluaXRpYWxpemluZyBkYXRhLiAqLwotCQkJY2hlY2tf
Ym5vZGVfbG9hZGVkKGJub2RlKTsKLQl9Ci0KLQlpZiAod2pub2RlICE9IE5VTEwpIHsKLQkJ
cmVsZWFzZSh3am5vZGUpOwotCQlibm9kZS0+d2pub2RlID0gTlVMTDsKLQl9Ci0JaWYgKGNq
bm9kZSAhPSBOVUxMKSB7Ci0JCXJlbGVhc2UoY2pub2RlKTsKLQkJYm5vZGUtPmNqbm9kZSA9
IE5VTEw7Ci0JfQorCW11dGV4X2xvY2soJmJub2RlLT5tdXRleCk7CiAKKwlpZiAoIWF0b21p
Y19yZWFkKCZibm9kZS0+bG9hZGVkKSkgeworCQlhc3NlcnQoIm5pa2l0YS0yODIyIiwgY2pu
b2RlICE9IE5VTEwpOworCQlhc3NlcnQoIm5pa2l0YS0yODIzIiwgd2pub2RlICE9IE5VTEwp
OworCQlhc3NlcnQoIm5pa2l0YS0yODI0Iiwgam5vZGVfaXNfbG9hZGVkKGNqbm9kZSkpOwor
CQlhc3NlcnQoIm5pa2l0YS0yODI1Iiwgam5vZGVfaXNfbG9hZGVkKHdqbm9kZSkpOworCisJ
CWJub2RlLT53am5vZGUgPSB3am5vZGU7CisJCWJub2RlLT5jam5vZGUgPSBjam5vZGU7CisK
KwkJcmV0ID0gY2hlY2tfc3RydWN0X2Jub2RlKGJub2RlLCBjdXJyZW50X2Jsb2Nrc2l6ZSk7
CisJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCisJCQlnb3RvIGVycm9yOworCisJCWF0b21p
Y19zZXQoJmJub2RlLT5sb2FkZWQsIDEpOworCQkvKiB3b3JraW5nIGJpdG1hcCBpcyBpbml0
aWFsaXplZCBieSBvbi1kaXNrCisJCSAqIGNvbW1pdCBiaXRtYXAuIFRoaXMgc2hvdWxkIGJl
IHBlcmZvcm1lZAorCQkgKiB1bmRlciBtdXRleC4gKi8KKwkJbWVtY3B5KGJub2RlX3dvcmtp
bmdfZGF0YShibm9kZSksCisJCSAgICAgICBibm9kZV9jb21taXRfZGF0YShibm9kZSksCisJ
CSAgICAgICBibWFwX3NpemUoY3VycmVudF9ibG9ja3NpemUpKTsKKwl9IGVsc2UKKwkJLyog
cmFjZTogc29tZW9uZSBhbHJlYWR5IGxvYWRlZCBiaXRtYXAKKwkJICogd2hpbGUgd2Ugd2Vy
ZSBidXN5IGluaXRpYWxpemluZyBkYXRhLiAqLworCQljaGVja19ibm9kZV9sb2FkZWQoYm5v
ZGUpOworCXJldHVybiAwOworCisgZXJyb3I6CisJcmVsZWFzZSh3am5vZGUpOworCXJlbGVh
c2UoY2pub2RlKTsKKwlibm9kZS0+d2pub2RlID0gTlVMTDsKKwlibm9kZS0+Y2pub2RlID0g
TlVMTDsKKwltdXRleF91bmxvY2soJmJub2RlLT5tdXRleCk7CiAJcmV0dXJuIHJldDsKIH0K
IAo=
--------------010007060707040307090706--
