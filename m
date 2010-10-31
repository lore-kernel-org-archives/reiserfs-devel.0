From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Sun, 31 Oct 2010 13:03:40 +0100
Message-ID: <4CCD5B1C.8070900@gmail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <4CCD3B6E.5070500@gmail.com> <201010311243.28448.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=lYXeYa5iIkMA33FQMk/C8UblEINxQxes0kUMnkaO+DE=;
        b=Jvyfb7bv0wRiY2J3f9jNQWBvIK+zU4QJLFeolE3ZYyBr/0Jv8by3Yp8+puCQo2/q3E
         1/i0Vacd5Vq3Znz3Rxa8uJ1kMqKrM4r315jKqvIHAzpunfrGE06E5FeOtUK7mNguVkLO
         nBzuVNYP7KqzvXbFDrE1usQ7XN5mjY+2+mZv8=
In-Reply-To: <201010311243.28448.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:
> On Sunday 31 October 2010, Edward Shishkin wrote:
>  =20
>> Please,
>> make sure you have the following patch applied:
>> http://marc.info/?l=3Dreiserfs-devel&m=3D128652975309724&w=3D2
>>    =20
>
> Thank you.
> That patch fixes the kio_file bug (mpf... I am angry with me that I m=
issed it)=20
> but not the kio_thumbnail warning. I did an fsck.reiser4 --build-fs a=
nd after=20
> a reboot I still get:
>  =20

could you provide fsck output?

> [  155.712295] reiser4[kio_thumbnail(2567)]: do_readpage_ctail=20
> (fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
> [  155.712296] WARNING: orphan unprepped cluster 0 (inode 11052573). =
=46sck?
>
> all over dmesg.
>
> Gl=FCck Auf,
> Volker
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
