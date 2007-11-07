From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: 4 GB filesize limit?
Date: Wed, 7 Nov 2007 22:01:55 +0100 (CET)
Message-ID: <alpine.DEB.0.9999.0711072159470.8211@sheep.housecafe.de>
References: <alpine.DEB.0.9999.0711072123540.8211@sheep.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.0.9999.0711072123540.8211@sheep.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Wed, 7 Nov 2007, Christian Kujau wrote:
> # dd if=/dev/zero of=file.img bs=1M count=6144
> File size limit exceeded (core dumped)

...and minutes after sending out my st00pid mail, I came to my senses: 
"ulimit -f" was set :-\

Sorry for the noise,
Christian.
-- 
BOFH excuse #329:

Server depressed, needs Prozac
