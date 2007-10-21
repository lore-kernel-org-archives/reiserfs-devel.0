From: "Christopher Sawtell" <csawtell@gmail.com>
Subject: Re: reiser4 "file system could not be fixed "
Date: Mon, 22 Oct 2007 11:11:52 +1300
Message-ID: <b8d16a880710211511o29d19a11l9f240182a378da3a@mail.gmail.com>
References: <loom.20071020T131554-635@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=w3eNVMtJCUVFConHfq7YIRbJ1rs+clgVMd7May2hc7k=;
        b=RfIvs/+6QBrVILEcULY5s+srUtWV+dNbsJpnL0jSDCxJOh4r6qn7V/cA1J5xkwE1yQkQMxw+HS3PZ0K8Nag0XTkZmaeeL0sV+WJwNLHGcuh/G6/idaonCOdaPMmCfo1iB8G8lWDeTJuMfqQLp2hrZw7KR0dBMdbUBMmyE1xQobI=
In-Reply-To: <loom.20071020T131554-635@post.gmane.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bugi <mariusz.bugaj@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/21/07, bugi <mariusz.bugaj@gmail.com> wrote:
> Yo !!
> I have my gentoo on reiser4 partiotion with 2.6.22-r8 kernel and during
> booting  I get message 'file system could not be fixed " It helps remount partiotion
> to get to system .
> How to fix this error ??

Hopefully you can either boot your computer into single user mode or
from a rescue disc.

The best one, based on Gentoo, is the SystemRescueCD, because it has
the Reiser4 driver installed, as well as every conceivable tool which
one could possibly need to rescue a PC.

http://www.sysresccd.org/Main_Page
and for the download
http://sourceforge.net/project/showfiles.php?group_id=85811&package_id=88964
It's 155 meg. so depending on where about in the world you are, that's
achievable.

Boot your machine using it and run the fsck.reiser4 program on the
damaged file-system.
I have been running Reiser4 for about 3 years or so now, and have not
yet been disappointed by the fsck.reiser4 program. It's just amazing.

If you cannot get a SystemRescueCD yourself I'm sure a friend will help you.

-- 
Sincerely etc.
Christopher Sawtell
