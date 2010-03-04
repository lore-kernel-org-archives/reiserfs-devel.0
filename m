From: Bret Towe <magnade@gmail.com>
Subject: Re: reiserfs issue with 2.6.32.8
Date: Thu, 4 Mar 2010 14:53:24 -0800
Message-ID: <dda83e781003041453q365896c1y3d12f3b49f3387b7@mail.gmail.com>
References: <dda83e781002141023t2abe95b8w83f59d6f411f68a2@mail.gmail.com>
	 <alpine.DEB.2.01.1002142229470.28195@bogon.housecafe.de>
	 <dda83e781002232131i53b59c8eu7192257fc4e4f3e0@mail.gmail.com>
	 <alpine.DEB.2.01.1002232249440.28195@bogon.housecafe.de>
	 <dda83e781003031900x3ca243d9kba1df3a8b0e04105@mail.gmail.com>
	 <alpine.DEB.2.01.1003041335540.3144@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=nlVThWW1a+nPbMqtpSoRkryi59alIH0aSCImE70xWlg=;
        b=Oe2A7JHUs3JERosA3NRzqbL8zZev+ADdsiogyDimEWrmNCMHnRMwnyUjED0BYZZm5z
         dg0LM3x5BoIbbvXmtKUA0vXW3RvAQYnktcpXWG7y5/cSu5rtwNW4aap0bYpDhj5ZnDV2
         2tZcren7CHwPrUIMKUlgIgHbB/PLks5FwKzWg=
In-Reply-To: <alpine.DEB.2.01.1003041335540.3144@bogon.housecafe.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <lists@nerdbynature.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, rjw@sisk.pl

On Thu, Mar 4, 2010 at 1:37 PM, Christian Kujau <lists@nerdbynature.de> wrote:
> On Wed, 3 Mar 2010 at 19:00, Bret Towe wrote:
>> well the hardware update ended up changing more than I thought it would
>> now on 32bit from 64bit so config is completely new also for the kernel
>> end result tho is I'm on a 2.6.33 kernel and no issues
>
> If there are still no issues after some time, maybe we can then close the
> bugzilla ticket?
>
> http://bugzilla.kernel.org/show_bug.cgi?id=15309

how long would you consider 'some time'?
