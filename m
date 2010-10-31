From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Sun, 31 Oct 2010 12:43:28 +0100
Message-ID: <201010311243.28448.volkerarmin@googlemail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <4CCD3B6E.5070500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=LOU5Rg0VQ8Bfhnevj+KDFtbvZYC57q7L3EEQnO+RBc0=;
        b=pXac7mk19nMc/l35Zo8TnIz6r5ZthbyxJIBZosImQkV9x0RTFanv4TVtc5EDIDhtl5
         cFa+equ8fFMEr01gh6z6AJGezTyVOwXw9yvAHZZ7DqsMGVMG1v1Clzux6F1km3O/Sceu
         hJLVjSA+THNcSbv4Od4vt3svCXchX1UmSELFU=
In-Reply-To: <4CCD3B6E.5070500@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Sunday 31 October 2010, Edward Shishkin wrote:
> Please,
> make sure you have the following patch applied:
> http://marc.info/?l=3Dreiserfs-devel&m=3D128652975309724&w=3D2

Thank you.
That patch fixes the kio_file bug (mpf... I am angry with me that I mis=
sed it)=20
but not the kio_thumbnail warning. I did an fsck.reiser4 --build-fs and=
 after=20
a reboot I still get:

[  155.712295] reiser4[kio_thumbnail(2567)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[  155.712296] WARNING: orphan unprepped cluster 0 (inode 11052573). Fs=
ck?

all over dmesg.

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
