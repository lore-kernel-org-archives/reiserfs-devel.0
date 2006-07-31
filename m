From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 22:32:09 +0200
Message-ID: <20060731223209.173908cf.reiser4@blinkenlights.ch>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>
	<20060731165406.GA8526@merlin.emma.line.org>
	<20060731195621.367ed702.reiser4@blinkenlights.ch>
	<20060731200718.GA13257@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030199AbWGaUcM@vger.kernel.org>
In-Reply-To: <20060731200718.GA13257@merlin.emma.line.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: matthias.andree@gmx.de, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


> All the more important to think about FS requirements *before*
> newfs-ing if a quick "one day for rsync/star/dump+restore" isn't
> available. If you're hitting, for instance, the hash collision problem
> in reiser3, you're as dead as with a FS without inodes.

Quoting myself:
>> Let's face it: Shit happens and nobody is perfect. A filesystem should
>> be flexible (modern..) and support Admin/User-needs.

Of COURSE you should think BEFORE creating the filesystem.
But if you somehow failed to do it 'the right thing' your filesystem
shouldn't let you down.
