From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: RAM and Reiser4 trees
Date: Mon, 19 Jul 2004 22:17:09 +0400
Message-ID: <40FC1025.2030906@namesys.com>
References: <200407191257.33491.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407191257.33491.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

Hello

Marcel Hilzinger wrote:
> Is there also a (separate) dancing tree in memory? I ask this, because I'm not 
> sure, how squeezing and flushing is exactly done. 
> 
> If I understood it well, then not just the filesystem tree, but also memory is 
> dancing (when data is squeezed)?
> 

Yes, reiser4 reads filesystem blocks into memory, links them into tree, modifies them and squeezes neighboring modified nodes before flushing to disk.
It may also flush them to different location on disk if it finds that more optimal.

> Thanks,
> Marcel


