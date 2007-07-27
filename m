From: Richard Purdie <rpurdie@openedhand.com>
Subject: Re: 2.6.23-rc1-mm1: reiser4 <-> lzo compile error
Date: Fri, 27 Jul 2007 16:11:28 +0100
Message-ID: <1185549088.6148.20.camel@localhost.localdomain>
References: <20070725040304.111550f4.akpm@linux-foundation.org>
	 <20070725182221.GG3572@stusta.de>  <46A9E691.5080308@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S937443AbXG0PL7@vger.kernel.org>
In-Reply-To: <46A9E691.5080308@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: Adrian Bunk <bunk@stusta.de>, Nitin Gupta <nitingupta910@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Fri, 2007-07-27 at 16:35 +0400, Edward Shishkin wrote:
> Sorry, guys, I am not happy with the modified LZO:
> the compressor tries to test bytes which are out of bounds.
> 
> The attached module testlzo.c causes an oops in the second pass:
> AFAIK, both, @m and @m_pos should be in [wrkmem, wrkmem + 64K);
> I have attached trace.txt with their actual values.
> 
> Not ready to migrate to this library.
> 
> Any ideas?

I can confirm its broken, it give an oops on ARM 2.6.23-rc1 too in the
first pass.

I guess the only real solution now is to compare the byte code from the
new and original and find out where this problem has crept in from and
check there are no others. I'll look into it but its going to take time.
There goes my weekend :-(

Richard
