From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"
 expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 23:54:57 +0200
Message-ID: <44CE7C31.5090402@gmx.de>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>	<200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl> <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751366AbWGaVzE@vger.kernel.org>
In-Reply-To: <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Adrian Ulrich wrote:

> See also: http://spam.workaround.ch/dull/postmark.txt
> 
> A quick'n'dirty ZFS-vs-UFS-vs-Reiser3-vs-Reiser4-vs-Ext3 'benchmark'

Whatever Postmark does, this looks pretty besides the point.

Are these actual transactions with the "D"urability guarantee?
3000/s doesn't look too much like you're doing synchronous I/O (else
figures around 70/s perhaps 100/s would be more adequate), and cache
exercise is rather irrelevant for databases that manage real (=valuable)
data...

-- 
Matthias Andree
