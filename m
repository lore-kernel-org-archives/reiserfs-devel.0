From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] updated reiser4 - reduced cpu usage for writes by writing
 more than 4k at a time (has implications for generic write code and eventually
 for the IO layer)
Date: Wed, 24 May 2006 10:59:53 -0700
Message-ID: <44749F19.1020705@namesys.com>
References: <44736D3E.8090808@namesys.com> <20060524175312.GA3579@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751043AbWEXR7x@vger.kernel.org>
In-Reply-To: <20060524175312.GA3579@zero>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: Linux-Kernel@Vger.Kernel.ORG, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Nate Diller <ndiller@namesys.com>

I should add, you execute a lot more than 4k worth of instructions for
each of these 4k writes, thus performance is non-optimal.  This is why
bios exist in the kernel, because the io layer has a similar problem
when you send it only 4k at a time (of executing a lot more than 4k of
instructions per io submission).The way the io layer handles bios is not
as clean as it could be though, Nate can say more on that.
