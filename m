From: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 18:08:02 -0400
Message-ID: <200607312208.k6VM82P5012867@laptop13.inf.utfsm.cl>
References: <reiser4@blinkenlights.ch>
Return-path: <reiserfs-list-return-29343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Adrian Ulrich <reiser4@blinkenlights.ch> 
   of "Mon, 31 Jul 2006 22:57:34 +0200." <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, matthias.andree@gmx.de, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
> > > Great to see that Sun ships a state-of-the-art Filesystem with
> > > Solaris... I think linux should do the same...
> > 
> > This would be worthwhile, if only to be able to futz around in Solaris-made
> > filesystems.

> s/I think linux should do the same/I think linux should include Reiser4/
>  ;-)

So ZFS isn't "state-of-the-art"?

[...]

> But i'd rather like to see a Linux version of WAFL :-)

WAFL is for high-turnover filesystems on RAID-5 (and assumes flash memory
staging areas). Not your run-of-the-mill desktop...

> ZFS didn't really impress me: 
> The Volume-Manager is nice but the Filesystem.. well: It beats UFS
> .. sometimes ;-)

OK, ext3 + LVM it is then.

> See also: http://spam.workaround.ch/dull/postmark.txt

Interesting.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
