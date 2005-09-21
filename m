From: Andrew Morton <akpm@osdl.org>
Subject: Re: latest patches degrade reiser4 performance substantially
Date: Wed, 21 Sep 2005 11:52:56 -0700
Message-ID: <20050921115256.6a11ab8d.akpm@osdl.org>
References: <4331A9BD.5030006@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750835AbVIUSxi@vger.kernel.org>
In-Reply-To: <4331A9BD.5030006@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
>
> At the this time we have no idea which patch is responsible, probably in
> a day or two we'll have a patch to fix it.
> 

OK.  I assume this performance change is demonstrable in just
2.6.14-rc2+reiser4?  Beware that there are other changes in the -mm lineup
which might cause regressions.  Notably

	mm-try-to-allocate-higher-order-pages-in-rmqueue_bulk.patch

and

	per-task-predictive-write-throttling-1.patch
	per-task-predictive-write-throttling-1-tweaks.patch
