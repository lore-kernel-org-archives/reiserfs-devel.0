From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: No space left on rfs4
Date: Sat, 8 Mar 2008 22:24:48 +0300
Message-ID: <5c7c368b0803081124i2b6af7a1sfb576429afb58ec4@mail.gmail.com>
References: <47CA7EA8.8070802@gmail.com>
	 <cd2131fe2e8cdce7c68183211d98bc90@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_55256_19205945.1205004288926"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:references;
        bh=FRQHJs4cSNdHRqBasEZDTvUB4vUUsZJOjp4iZMjNDi0=;
        b=N1MLBlvPd592iGIHlj9Soswyx4X4JKG4h0/ngNq5iDKzuB72c4bAuUY1NUM7rtqMe0wnPUqbDGZsPgSS3eLItiqXSWvEeVVbwHlMqMgIBqMywjmbQbrh33fVon/kWzlkOFwNwEJRQExGdwIxJCYYGLzdyfXYnZgoDe38DPDN9os=
In-Reply-To: <cd2131fe2e8cdce7c68183211d98bc90@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

------=_Part_55256_19205945.1205004288926
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 3/3/08, John <geearf@free.fr> wrote:
>
>
>  On Sun, 02 Mar 2008 13:17:12 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>  > Hello.
>  >
>  > Yeah, indeed, I have reproduced it for reg40 (default plugin):
>  > tar process is in permanent "+D" state. After reboot all files
>  > were successfully deleted, although there is some leak of free
>  > disk space there.
>  >
>  > Ok, I'll take a look at this more carefully (I guess -ENOSPC
>  > error is handled incorrectly somewhere).
>  >
>  > If you have a problems with deleting files on reg40 partition,
>  > then please pack your metadata by
>  > debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>  > and let me download the file meta.gz
>
> My FS is currently no full and with no bug, so I hope these are the metadata you wanted.
>  If not I'll fill it again and send it to you again
>
>  http://www.megaupload.com/?d=XVITV1CU
>

Eventually I have not downloaded this:
It said "No free slots available for your country" ;)

Well, don't bother with this for a while:
I have caught a mutex leak in cryptcompress plugin,
(fixup is attached) this explains undeletable files in ccreg40.

I'll try fo fix unix-file plugin a bit later.

Thanks,
Edward.

>  (sorry I cannot send a file that big by e-mail)
>
> >
>  > I don' t see such problems with ccreg40 (compression plugin).
>  > Please, let me know, if something goes wrong here..
>
> I just tried and had the same issue with a ccreg40 partition.
>  I could not remove all the files, and when I tried it just froze my shell.
>  After killing my shell I was able to reboot but not to umount the partition.
>  This is the debugfs output:
>
>  http://www.megaupload.com/?d=CBEGIFDL
>
>
>  I also wanted to join an fsck output but I don't know how to do that.
>  Basically the results were in checking the semantic tree
>  FSCK: obj40_repair.c 223: obj40_stat_unix_check: Node (XYZ), item (a), [fgfdgf:fgfdggdf:fhgfhgf] (stat40): wrong bytes (ABCDE), fixed to (EFC).
>
>  (obviously this is some sort of templated message, they were all like that...)
>
>
>  Thank you,
>
>
>  John
>
>

------=_Part_55256_19205945.1205004288926
Content-Type: text/x-patch; name=reiser4-handle-enospc-fixup.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fdkkeldv
Content-Disposition: attachment; filename=reiser4-handle-enospc-fixup.patch

LS0tCiBsaW51eC0yLjYuMjMtbW0xL2ZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvY3J5cHRjb21wcmVz
cy5jIHwgICAgNyArKysrLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCi0tLSBsaW51eC0yLjYuMjMtbW0xL2ZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUv
Y3J5cHRjb21wcmVzcy5jLm9yaWcKKysrIGxpbnV4LTIuNi4yMy1tbTEvZnMvcmVpc2VyNC9wbHVn
aW4vZmlsZS9jcnlwdGNvbXByZXNzLmMKQEAgLTI3MjEsNyArMjcyMSw4IEBACiAJCWlmIChyZXN1
bHQpCiAJCQlnb3RvIG91dDsKIAkJaWYgKGNvbnQtPnN0YXRlID09IFBTQ0hFRF9BU1NJR05FRF9O
RVcpCi0JCQlnb3RvIG91dF9ub19yZWxlYXNlOworCQkJLyogZG9uZV9saCB3YXMgY2FsbGVkIGlu
IHdyaXRlX3BzY2hlZHVsZV9ob29rICovCisJCQlnb3RvIG91dF9ub19sb25ndGVybV9sb2NrOwog
CiAJCXJlc3VsdCA9IHByZXBhcmVfbG9naWNhbF9jbHVzdGVyKGlub2RlLCBwb3MsIGNvdW50LCAm
Y2x1c3QsCiAJCQkJCQkgTENfQVBQT1YpOwpAQCAtMjc5Myw5ICsyNzk0LDkgQEAKIAl9IHdoaWxl
IChjb3VudCk7CiAgb3V0OgogCWRvbmVfbGgoJmhpbnQtPmxoKTsKLQltdXRleF91bmxvY2soJmlu
Zm8tPmNoZWNraW5fbXV0ZXgpOwogCXNhdmVfZmlsZV9oaW50KGZpbGUsIGhpbnQpOwotIG91dF9u
b19yZWxlYXNlOgorIG91dF9ub19sb25ndGVybV9sb2NrOgorCW11dGV4X3VubG9jaygmaW5mby0+
Y2hlY2tpbl9tdXRleCk7CiAJa2ZyZWUoaGludCk7CiAJcHV0X2NsdXN0ZXJfaGFuZGxlKCZjbHVz
dCk7CiAJYXNzZXJ0KCJlZHdhcmQtMTk1IiwK
------=_Part_55256_19205945.1205004288926--
