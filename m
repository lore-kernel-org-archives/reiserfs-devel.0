From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] data logging patches available for 2.4.21-preX
Date: Tue, 28 Jan 2003 09:56:45 +0300
Message-ID: <20030128095645.A32331@namesys.com>
References: <200301271914.26312.Dieter.Nuetzel@hamburg.de> <1043692402.15680.58.camel@tiny.suse.com> <200301271949.57132.Dieter.Nuetzel@hamburg.de> <3E3599A4.9080700@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E3599A4.9080700@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Jan 27, 2003 at 09:42:12PM +0100, Manuel Krause wrote:

> BTW, does the on-disk FS structure matter with this comparison? (FS 

It should. Data layout determines how often (and how far) you do your seeks.

> content created with data=journal/ordered <-> tested with 
> data=journal/ordered) -- Or did this only have importance when Oleg 
> introduced the new block allocator?

Old allocator had different behaviour than new one. (in default config),
also they have different tail policies.

Bye,
    Oleg
