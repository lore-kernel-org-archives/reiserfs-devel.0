From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Mon, 28 Aug 2006 16:32:31 -0700
Message-ID: <44F37D0F.90706@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com>	 <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964893AbWH1Xcf@vger.kernel.org>
In-Reply-To: <1156801705.2969.6.camel@nigel.suspend2.net>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nigel Cunningham <ncunningham@linuxmail.org>
Cc: Edward Shishkin <edward@namesys.com>, Stefan Traby <stefan@hello-penguin.com>, Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>

Nigel Cunningham wrote:
> For Suspend2, we ended up converting the LZF support to a cryptoapi
> plugin. Is there any chance that you could use cryptoapi modules? We
> could then have a hope of sharing the support
It is in principle a good idea, and I hope we will be able to say yes. 
However, I have to see the numbers, as we are more performance sensitive
than you folks probably are, and every 10% is a big deal for us.
