From: Oleg Drokin <green@namesys.com>
Subject: Re: Fwd: Bad root block 0
Date: Mon, 8 Sep 2003 19:34:27 +0400
Message-ID: <20030908153427.GA28885@namesys.com>
References: <200309071446.32049.webmaster@autoinstaller.de> <20030908095142.GB18422@namesys.com> <200309081715.01529.webmaster@autoinstaller.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200309081715.01529.webmaster@autoinstaller.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland H?der <webmaster@autoinstaller.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 08, 2003 at 05:15:01PM +0200, Roland H?der wrote:

> > Hm. Can you tell us what kernel version you were using at the time of
> > writing your files to encrypted device?
> Opps: Vanilla 2.4.21 with cryptoloop (not patched, it's compiled alone 
> and installed into /lib/modules/2.4.21/xxxxx)

Ah, ok.

> > What do you mean by extracting "missing metadata"?
> debugreiserfs can extract the metadata of a rfs-partition. With 
> "missing" I mean that reiserfschk tells me that there's no metadata 
> available. So here's a strange thing: debugreiserfs found it, but 
> reiserfschk not...

What debugfs command found the metadata? Was it just plain "debugreiserfs -p"?
How much leaves/internal nodes were found?

> > "unlimited cash"? Wow!
> Nope, not *really* unlimited cash... :)

Ah, sigh.
I thought Bill Gates started to use linux + reiserfs, but no...

Bye,
    Oleg
