From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: reiserfs: circular locking dependency detected
Date: Wed, 30 Dec 2009 01:24:51 +0100
Message-ID: <20091230002449.GC5258@nowhere>
References: <alpine.DEB.2.01.0912240314350.3483@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=cfFwkypGwUUpwBFwA3BbhGrlPprubSW0MUCxug8U18g=;
        b=b6MCb8mq4yR5p0eWIhGr35Js8RtAyE0N9eZlg/ruNtFkSNfEvc1x4heMd6jxkIEo/O
         kmPWS1DzoIqQntNeC7RVHUiAiI2Pi8YN3jeKDFPQ8U22H7ByXPhTzo5V9uln/+JM49A/
         ffM+1LWGfyWz5h0bpbEg2hg+Pk7PQhewKWY74=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.01.0912240314350.3483@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <lists@nerdbynature.de>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, jeffm@suse.com

On Thu, Dec 24, 2009 at 03:26:07AM -0800, Christian Kujau wrote:
> 
> I've seen the lockdep warning reported in 
> http://lkml.org/lkml/2009/12/22/365, but this one is slightly different 
> and is not happening on mount but when dbench is run on a freshly created 
> filesystem. Below is the lockdep warning, I've put sysrq-D/W/P/T output on 
> 
> http://nerdbynature.de/bits/2.6.33-rc1/reiserfs/
> 
> - t2 is with lockdep enabled
> - proc-fs-reiserfs.log is me trying to cat /proc/fs/reiserfs every 
>   2 seconds while dbench is running
> 
> Thanks,
> Christian.



Thanks for your report. I have a pending fix, I'll post it soon.

