From: Oleg Drokin <green@namesys.com>
Subject: Re: knfsd/samba performance with reisefs and 1Gbit network.
Date: Tue, 9 Apr 2002 10:07:45 +0400
Message-ID: <20020409100745.A6631@namesys.com>
References: <OF3FB2BD32.CE13A9A8-ONC1256B95.00658DB4@ev-i.at>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF3FB2BD32.CE13A9A8-ONC1256B95.00658DB4@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolfgang.glas@ev-i.at
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Hello!

On Mon, Apr 08, 2002 at 08:43:09PM +0200, wolfgang.glas@ev-i.at wrote:

> good news (?): The network stalls occur also with ext3 using this 
> kernel....

I won't say this is a good news. It just means something is broken at your side.

> Weird thing, isn't it ?

Sure. Especially since I cannot reproduce any stalls and get pretty close to
consuming 100% of 100Mbps bandwith on our eepro100 cards.

Bye,
    Oleg
