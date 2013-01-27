From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 panics on kernel 3.6.11 (balance_dirty_page_cluster,
 edward-1547)
Date: Mon, 28 Jan 2013 00:49:56 +0100
Message-ID: <5105BD24.1020009@gmail.com>
References: <5103A388.2080906@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020200070802060908040003"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type;
        bh=ftfuvoUADvzQIup5ST04fMqNHMZ/mEhHcXL15IGgwP4=;
        b=OJrnfIBqj3Y3403t1ueSYjSZnWXWLMp8SeXFXEvfXy8e0BJoaDcBvc4vAOZg7ukj4R
         DA226pt2vYuenN8aTVSK0rG236w4e7T36wwf3/P7mVNgdKaeZri7yKQYu3kno2zDQUo6
         pR++Y1CPoCDkJG7rTLjY7Ybc+jHDieJNXqZ59Hg6LK79Nl9EXeqLpCV6I75TKSbl6TEW
         mxtYfXrFX/QykQOrc/QfwL0ubqoWYvbC2apBm8F91/6fmTsfmvywFetT4oeLP9piYqRA
         HveXBALXhNwQ34EEiJDf8TnvEpvdfULj7bPbO6yhQSXdTd1mtSSFpZz5/oY6gHozSouV
         gIlQ==
In-Reply-To: <5103A388.2080906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------020200070802060908040003
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Gleb,

Thanks for the report!
Please, find the fixup in the attachment.

Edward.
P.S. Reiser4 debug mode results in dramatic performance drop
when tail packing / compression is on. Use it only when something
goes wrong...



On 01/26/2013 10:36 AM, Gleb Baryshev wrote:
> Hello,
>
> I get a kernel panic when I start Opera browser on Linux 3.6.11 patched
> with reiser4-for-3.6.4. The filesystem is ccreg and used for /.
>
> Here are a couple of screenshots attached with assertions and stack traces.
>
> Regards,
> Gleb
>


--------------020200070802060908040003
Content-Type: text/plain;
 name="reiser4-fix-balance_dirty-assert.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="reiser4-fix-balance_dirty-assert.patch"

U2lnbmVkLW9mZi1ieTogRWR3YXJkIFNoaXNoa2luIDxlZHdhcmQuc2hpc2hraW5AZ21haWwu
Y29tPgoKLS0tCiBmcy9yZWlzZXI0L3BsdWdpbi9maWxlL2NyeXB0Y29tcHJlc3MuYyB8ICAg
IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgotLS0gbGludXgtMy43LjEub3JpZy9mcy9yZWlzZXI0L3BsdWdpbi9maWxlL2NyeXB0
Y29tcHJlc3MuYworKysgbGludXgtMy43LjEvZnMvcmVpc2VyNC9wbHVnaW4vZmlsZS9jcnlw
dGNvbXByZXNzLmMKQEAgLTIwMjAsOCArMjAyMCw3IEBAIHN0YXRpYyBpbnQgYmFsYW5jZV9k
aXJ0eV9wYWdlX2NsdXN0ZXIoc3QKIAogCWFzc2VydCgiZWR3YXJkLTcyNCIsIGlub2RlICE9
IE5VTEwpOwogCWFzc2VydCgiZWR3YXJkLTcyNSIsIGNyeXB0Y29tcHJlc3NfaW5vZGVfb2so
aW5vZGUpKTsKLQlhc3NlcnQoImVkd2FyZC0xNTQ3IiwKLQkgICAgICAgbnJfZGlydGllZCAh
PSAwICYmIG5yX2RpcnRpZWQgPD0gY2x1c3Rlcl9ucnBhZ2VzKGlub2RlKSk7CisJYXNzZXJ0
KCJlZHdhcmQtMTU0NyIsIG5yX2RpcnRpZWQgPD0gY2x1c3Rlcl9ucnBhZ2VzKGlub2RlKSk7
CiAKIAkvKiBzZXQgbmV4dCB3aW5kb3cgcGFyYW1zICovCiAJbW92ZV91cGRhdGVfd2luZG93
KGlub2RlLCBjbHVzdCwgb2ZmLCB0b19maWxlKTsKQEAgLTIwMzIsNiArMjAzMSw4IEBAIHN0
YXRpYyBpbnQgYmFsYW5jZV9kaXJ0eV9wYWdlX2NsdXN0ZXIoc3QKIAlhc3NlcnQoImVkd2Fy
ZC03MjYiLCBjbHVzdC0+aGludC0+bGgub3duZXIgPT0gTlVMTCk7CiAJaW5mbyA9IGNyeXB0
Y29tcHJlc3NfaW5vZGVfZGF0YShpbm9kZSk7CiAKKwlpZiAobnJfZGlydGllZCA9PSAwKQor
CQlyZXR1cm4gMDsKIAltdXRleF91bmxvY2soJmluZm8tPmNoZWNraW5fbXV0ZXgpOwogCXJl
aXNlcjRfdGhyb3R0bGVfd3JpdGUoaW5vZGUsIG5yX2RpcnRpZWQpOwogCW11dGV4X2xvY2so
JmluZm8tPmNoZWNraW5fbXV0ZXgpOwo=
--------------020200070802060908040003--
