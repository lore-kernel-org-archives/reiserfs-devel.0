From: David Masover <ninja@slaphack.com>
Subject: Re: Problem with multiple mounts
Date: Wed, 08 Nov 2006 16:13:54 -0600
Message-ID: <455256A2.1020505@slaphack.com>
References: <45522E67.7050907@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1423806AbWKHWNq@vger.kernel.org>
In-Reply-To: <45522E67.7050907@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Suzuki <suzuki@linux.vnet.ibm.com>
Cc: reiserfs-list@namesys.com, lkml <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

Suzuki wrote:

> "I exported a disk partition using nbd protocol.

Why?

I don't mean it's completely absurd, I'd just like to know what the 
reason is for not using NFS. Perhaps you should look at DRBD?

What is the real goal here?
