From: Alistair McDonald <alistair@inrevo.com>
Subject: Re: core dump on reiserfsck --rebuildtree
Date: Thu, 25 Sep 2003 07:22:07 +0100
Message-ID: <200309250722.07744.alistair@inrevo.com>
References: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org> <200309232310.37438.alistair@inrevo.com> <200309241421.04813.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309241421.04813.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>, ookhoi@humilis.net

On Wednesday 24 September 2003 00:04 am, Ookhoi wrote:
>
> FWIW, I'm very happy with two 200GB maxtor disks.
>

I've bought a single 250GB drive for now. I'll get the deskstar 
repaired/replaced and sell the pair on e-bay, then buy another maxtor when I 
need the space. I've decided to ditch lvm, I can live without dynamically 
growing partitions and I'd rather know what is where on a disk, especially 
when I have to recover like this

> I have no experience with lvm, but do have with bad disks. You'll want
> to use dd_rescue instead of dd:
> http://www.garloff.de/kurt/linux/ddrescue
>

Cheers, it's been emerged and is ready to use. Thanks for your input. 


On Wednesday 24 September 2003 11:21 am, Vitaly wrote:
>
> you can use dd with conv=sync,noerror. But dd_rescue seems to me better
> regarding to read errors handling. After that you will need to run
>     reiserfsck --check
> and follow its instructions.

Thanks for all your help, Vitaly.

Alistair
-- 
Alistair McDonald     InRevo Ltd
Tel: 07017 467 386    http://www.inrevo.com
