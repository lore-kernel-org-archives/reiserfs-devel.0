From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Tue, 2 Nov 2010 19:15:42 +0100
Message-ID: <201011021915.43139.volkerarmin@googlemail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <201010311502.34199.volkerarmin@googlemail.com> <4CCFE344.5050706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=FpEeYkhFdpLWfxVajwaT7HjTSxEg68lFhwqwGs8iNk0=;
        b=DD/QjFPrpM0tGyjyyEJrDxY/Nrss6RNakLJN7eqOjIc93oZFkUn/LH/37p6GG0vpOy
         +5Wzh7vQO/qA2Rw9oDyZZPAjGx90z5lWYev1QCr8zORrwCaEmkiqezY14TQ7sIXmj2ij
         Uew06aAi5KE4UCQEMTAShuTEqgI52s+1VnSOw=
In-Reply-To: <4CCFE344.5050706@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi,

On Tuesday 02 November 2010, Edward Shishkin wrote:
> find -inum 11052573

I moved all the pictures in home in their directory and one of the erro=
rs -=20
11052576 - is gone

11052573 exists and when kde tries to generate the thumbnails, dmesg is=
 again=20
flooded. When I try to cat the file, I get an i/o error and dmesg is fl=
ooded even=20
more.
About the fsck: when I do not pipe the output into stout.log, I can see=
 the=20
spinner/progress bar moving and the procent going up, so fsck is doing=20
something. It just does not fix the problem. Is there some option to ma=
ke fsck=20
show what it is doing?

smartctl doesn't show any defective blocks.

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
