From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: Minor but irritating Reiser4 problem
Date: Fri, 20 Jun 2008 08:19:28 +0200
Message-ID: <200806200819.28476.volker.armin.hemmann@tu-clausthal.de>
References: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us> <485AD5FA.7090809@gmail.com> <000001c8d29b$2dfdc9f0$89f95dd0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000001c8d29b$2dfdc9f0$89f95dd0$@net>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Friday 20 June 2008, Steven Noonan wrote:
> I've been using Reiser4 on a 2.6.25 kernel and I've noticed that file sizes
> and disk space usage are incorrectly reported (impossibly large). The
> problem -seemed- to be temporarily resolved by running fsck.reiser4 on the
> filesystem or after switching to 2.6.26-rc5-mm3 (not sure which), and fsck
> reported lots of these:
>
> FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item (21),
> [2a:c66170725f646264:10332] (stat40): wrong bytes (65536), Fixed to
> (10181).
>
> In every case, it says "wrong bytes (65536)" and corrects the number. Any
> idea which "bytes" it's referring to? It seems too small to be a file size
> (since 16-bit file size descriptors would be ridiculously small). I would
> expect -at least- a 64-bit number to represent a file size.
>
> I'd try debugging it myself, but I'm afraid of touching (and unfamiliar
> with) Reiser4's internals.
>
> - Steven

you are using compression, right?

