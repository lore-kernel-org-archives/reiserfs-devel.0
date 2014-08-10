From: "Daniel Horne" <daniel.horne@gmail.com>
Subject: Re: Reiser4: discard support with delayed issuing of discard requests
Date: Sun, 10 Aug 2014 16:38:45 +0100
Message-ID: <3DCC0775ECF24DEFA5A598C0BACABA2E@DuSTmanPC>
References: <53E6A7F1.6030006@gmail.com> <20140810190210.033a96da@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:references:in-reply-to:subject:date:mime-version
         :content-type:content-transfer-encoding;
        bh=Tw+P4XH3ynhRTnjS9Rasdu51REaC2HZbzdmBWaPvDtQ=;
        b=GaZMU79Wg6JuqX2dTXulgTB5CfzvgnG/BbFToin83exRCT+lPRq++bdVJt9zb0uqIq
         lYOq6k1L/J6PQ5oF9h07dMbX9Hr/63gWMRoPlNLdjYZdiku6rgEPuto47An8VSvVi4TC
         opemzc14SX3EBhpiGl+QabAdilnaloDMtGqa6bhy8q0rFcuyQsiyj8O4YzCm9bQS94/0
         EUmJmG/r4F4Y9Qw9zUrgH6nhgQI72YdS7DeixKMB6nu4UJC8mM/tokOiReNYQXYCm3jo
         D5eYFB5K8ibs21icMQz39NoAMifg6mrY0BODvVNaq2mzAqol1H2quMBCHwsAvsPls3Pe
         GVHg==
In-Reply-To: <20140810190210.033a96da@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

If memory serves, VMware and virtualbox also use TRIM to help reclaim space 
on the virtual disk files.

--
DH


----- Original Message ----- 
From: "dimas" <dimas000@ya.ru>
To: "reiserfs-devel" <reiserfs-devel@vger.kernel.org>
Sent: Sunday, August 10, 2014 4:02 PM
Subject: Re: Reiser4: discard support with delayed issuing of discard 
requests


> thanks a lot for your explanations!
> does it all make any sense for non-ssd?
> will 3.16 contain this all-in-one, without extra patches to find somewhere 
> else?
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

