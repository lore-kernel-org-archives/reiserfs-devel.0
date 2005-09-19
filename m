From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 13:18:58 +0400
Message-ID: <432E8282.6060905@namesys.com>
References: <432AFB44.9060707@namesys.com> <20050918110658.GA22744@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932398AbVISJTJ@vger.kernel.org>
In-Reply-To: <20050918110658.GA22744@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>, LKML <linux-kernel@vger.kernel.org>

Hello

Christoph Hellwig wrote:
> I threw in your new codedrop into a compilation and the byte-order
> mess is _still_ now sorted out.  

Did compiling notice this mess?
We used to compile with C=1. Should we compile somehow else before sending code out?

> Please kill the d* as struct type
> crap and just use __le types directly.
> 
ok

> Also lots of "memset with byte count of 0" warnings from sparse.
> 

Running make C=1 fs/reiser4/ with sparse from http://www.codemonkey.org.uk/projects/git-snapshots/sparse/sparse-2005-09-19.tar.gz
does not produce any warnings.
Would you please prompt how to make sparse to complain?
