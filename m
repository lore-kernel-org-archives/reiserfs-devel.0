From: Hgntkwis@vfemail.net
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Date: Wed, 5 Aug 2020 12:53:17 -0400
Message-ID: <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=tYTZlfDivesu
        wi6sEO939lAeryFUt15mP3CTKxRkvYg=; b=XjkRWk2CAyjuwIB2PasUeibrCqn0
        oZQGGZh2d1cOJFoXN9VtHHOsD44G2F5k+LIKoY84qeEpsKAaiXYb5IRzgwJcv8yE
        YBx9Ac9QFJELvZN9dapV+4Bz67Lyghsc8ov5yBMLeiu1i7GytxQk9P7/iChTf1Qd
        NCJOufApk/g1R5g=
In-Reply-To: <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

It's been over 1 week since I sent this into the reiserfs-devel mailing
list. I'm escalating this as the kernel docs recommend.
I'm still willing to help debug and test a fix for this problem.

"Given enough eyeballs, all bugs are shallow".
This bug is visible, could we please quash it?

Original message:
https://lkml.org/lkml/2020/7/28/1435
Filed bug:
https://bugzilla.kernel.org/show_bug.cgi?id=208719

Thanks,
David
