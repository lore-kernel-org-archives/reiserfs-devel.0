From: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Subject: Solaris ZFS on Linux [Was: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 15:18:52 -0400
Message-ID: <200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
References: <reiser4@blinkenlights.ch>
Return-path: <reiserfs-list-return-29316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Adrian Ulrich <reiser4@blinkenlights.ch> 
   of "Mon, 31 Jul 2006 17:59:58 +0200." <20060731175958.1626513b.reiser4@blinkenlights.ch> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: Matthias Andree <matthias.andree@gmx.de>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Adrian Ulrich <reiser4@blinkenlights.ch> wrote:

[...]

> ZFS uses 'dnodes'. The dnodes are allocated on demand from your
> available space so running out of [di]nodes is impossible.
> 
> Great to see that Sun ships a state-of-the-art Filesystem with
> Solaris... I think linux should do the same...

This would be worthwhile, if only to be able to futz around in Solaris-made
filesystems.

Are you volunteering? You'd probably need a friend in Solaris-land who
passes you information on how things are done, and copies of filessytems to
take apart, and so on. 

First question is if there are any restrictions (patent or otherwise) on
doing this, just copying is out of the question due to (unfortunate)
licence on Sun's part.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
