From: Oleg Drokin <green@namesys.com>
Subject: Re: Bug in reiserfsck 3.6.1-pre1
Date: Mon, 16 Sep 2002 12:05:31 +0400
Message-ID: <20020916120531.C10884@namesys.com>
References: <20020916025655.E22362@noris.de> <20020916091943.A5459@namesys.com> <20020916093520.C10175@noris.de> <20020916114310.A10826@namesys.com> <20020916095858.E10175@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020916095858.E10175@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Urlichs <smurf@noris.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 16, 2002 at 09:59:00AM +0200, Matthias Urlichs wrote:
> > > Warning: that'll be 100+ MBytes. Compressed. (The original RAID's almost
> > > half a terabyte.)
> > I don't understand where's this number from.
> Don't ask me:
> # ls -l /var/tmp/metadata_md0.gz 
> -rw-r--r--    1 root     root     100532224 Sep 16 08:41 /var/loctmp/metadata_md0.gz

Oh.

> > Metadata size exceeds 40 Megabytes pretty rarely.
> I have approx. a million files on that filesystem. Guess why I am using
> reiserfs in the first place?  ;-)

;)

> Note that this file system has severely corrupted bitmaps (not to say
> everything else -- I basically had to restore every third 4-kByte block
> from a month-old copy. :-/ ).

If you took the snapshot after failed reiserfsck --rebuild-tree, that should
be enough for us to reproduce, so please make metadata available for download
please. 

Thank you.

Bye,
    Oleg
