From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiser3: data=journal causes panic in 2.6.29.4
Date: Sat, 20 Jun 2009 23:07:50 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.0906202254510.6439@bogon>
References: <19003.42003.291323.769232@fisica.ufpr.br>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19003.42003.291323.769232@fisica.ufpr.br>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos Carvalho <carlos@fisica.ufpr.br>
Cc: reiserfs-devel@vger.kernel.org

On Fri, 19 Jun 2009, Carlos Carvalho wrote:
> Putting data=journal in the options in fstab makes the kernel stop at
> boot complaining it couldn't get a lock.

AFAIK there is no data= mount option for reiserfs. Where did you see this 
documented?

> What's the status of data journaling in reiser3?

In which regard?

-- 
BOFH excuse #408:

Computers under water due to SYN flooding.
