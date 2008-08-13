From: "Alli Quaknaa" <alquaknaa@gmail.com>
Subject: Re: [reiser4] Point
Date: Wed, 13 Aug 2008 17:59:30 +0200
Message-ID: <8c113a260808130859n1233ad6aj6e6ee1208b3b26ca@mail.gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>
	 <489B44FD.5000108@gmail.com> <489CB0F0.8020806@gmail.com>
	 <48f7fe350808090803g56ee1a88r18f408153b1702eb@mail.gmail.com>
	 <48A1DD60.7080906@gmail.com>
	 <e85b9d30808121305q7a3a8b08g80c26bc6b029ee56@mail.gmail.com>
	 <48A1F6CC.1080805@gmail.com>
	 <e85b9d30808130143h79cfa113if257e67e5386f324@mail.gmail.com>
	 <48A2AFF1.2000009@gmail.com>
	 <48f7fe350808130803p75fc5c13kfa40e313389f0e98@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Fh8X12VmUGtbE2KU3Sv3EZZeYbHwrsBuZ1J6E3233Cw=;
        b=QeNVfXf6TWKEzaaDspsAn0U2pWsBgh2gCsanuLareJnmDgd7qbCspZjTrEz/StvXIb
         rxdpIGk9Iqqh0J5A/w0ky4yik6wvfIkPo1IjjRrXWe344ukFS7ddzVyRHCdgRCFLzmnp
         H7+YNxkHJnfh/bDpyxRZY0uDgWqiTfgEAnDmU=
In-Reply-To: <48f7fe350808130803p75fc5c13kfa40e313389f0e98@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Hope <rmh3093@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Matthew <jackdachef@gmail.com>, reiserfs-devel@vger.kernel.org

Correct me if I'm wrong, but the "emerge glibc" and compiling kernel
are not actually happening on the reiser4 partition (if it is
/usr/portage only) and they IMHO actually lower the stress on the
reiser4 partition, because they consume CPU power that would be used
by emerge sync and bonnie (which do stress-test the reiser4
partition).

But maybe I'm wrong, or it was the point to get emerge sync & bonnie
working in an environment where they have to compete for CPU time with
other processes?

(Please bear with me, I'm not a developer and I'm newbie, but I use
Gentoo so the things above seemed weird to me).
al-Quaknaa
