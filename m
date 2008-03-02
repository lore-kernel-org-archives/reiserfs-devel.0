From: "Christopher Sawtell" <csawtell@gmail.com>
Subject: Re: No space left on rfs4
Date: Mon, 3 Mar 2008 11:39:36 +1300
Message-ID: <b8d16a880803021439m58cb9251uabe3b57c1c57f971@mail.gmail.com>
References: <47CA7EA8.8070802@gmail.com>
	 <cd2131fe2e8cdce7c68183211d98bc90@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=oV9DdAOEik01qCjowaDv8iP4hmQ9qoUlEcZfc18GNqg=;
        b=m0Bb7mef/4NhoEMkbKdbgbFd8jMorTTvZhGeeJ/Effng9uC9q7y0SlfGSTqviT0Nkd09pgI9POvgfrHtfYuQyxpL3nkPSez4S1OTfuJRisrqGh77tWMct3TQpjs4LlfolqBPvpl2lZCVQ8Cxs10/ZU7e7s2qtyIn/zDJoOTThJw=
In-Reply-To: <cd2131fe2e8cdce7c68183211d98bc90@free.fr>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: geearf@free.fr
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

My own experience with RR4 when the filesystem is full, is that it
works perfectly if only a very few files are being written to, as in
/var/tmp/ overflowing when it's being used to build a package in
Gentoo, but that if there are many files open, as in an rsync session,
or a single file being written to in many places, as in the bittorrent
situation, then major breakage occurs. Perhaps I should say occurred
because the overfill of the RR4 partition during a Gentoo package
build happened 3 days ago, whereas the others many months.



-- 
Sincerely etc.
Christopher Sawtell
