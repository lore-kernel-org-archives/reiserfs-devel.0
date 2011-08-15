From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Any progress in fixing "block_alloc.c:151"?
Date: Mon, 15 Aug 2011 18:39:53 +0400
Message-ID: <4E492FB9.3040501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=gRWFHHf3n+gkGvZadI/DmoGNUGErKq7+XGMoStcYicQ=;
        b=tOyTPnjTvtew+p1rPi2Wfxo92Z98UBU+d+PORxILlMhTUaK+7EhnM8lcp6lFITLoSE
         8Wp1dKzQmvNkK6VacvPGP7wYptoQhPeg0cgeOLSvD+mq1qJHeRgmkELFBxQunX8j7kf5
         xE4yNCxzm6v7sXk1crlr8AoeOO351wn/c4ZeU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello,

is there any progress in fixing "kernel BUG at 
fs/reiser4/block_alloc.c:151" problem?

I use reiser4 on my /home partition with cryptocompress regular file plugin.
As of kernel 2.6.38, the bug still happens in data-intensive 
applications (amarok, firefox, nepomuk, etc).
The 'estimate_dirty_cluster' patch didn't work for me, only delaying the 
appearance of problem.

I guess it's somehow related to frequent fsync() calls in databases used 
by these applications..

Thanks in advance,
Ivan Shapovalov.
