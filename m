From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem mounting ReiserFS as root partition
Date: Mon, 16 Jun 2003 10:36:09 +0400
Message-ID: <20030616063609.GA12592@namesys.com>
References: <200306151508.57384.till@tantalo.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200306151508.57384.till@tantalo.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Till Gerken <till@tantalo.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Jun 15, 2003 at 03:08:39PM +0200, Till Gerken wrote:

> I am not able to mount my ReiserFS partition as root partition with any kernel 
> later than 2.4.20-pre11. When trying, I get
> read_super_block: can't find a reiserfs filesystem on (dev 03:00, block 64, 
> size 1024)

Are you sure you want to mount /dev/hda as opposed to some partition on /dev/hda?
Please check that you are mounting correct thing (root= option in lilo.conf for example).

Bye,
    Oleg
