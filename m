From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:58:18 +0100
Message-ID: <20040826165818.GN5733@mail.shareable.org>
References: <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1939276887.20040826114028@tnonline.net> <20040826024956.08b66b46.akpm@osdl.org> <839984491.20040826122025@tnonline.net> <20040826032457.21377e94.akpm@osdl.org> <742303812.20040826125114@tnonline.net> <20040826035500.00b5df56.akpm@osdl.org> <412E0AC9.2020203@andrew.cmu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <412E0AC9.2020203@andrew.cmu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bruce <bruce@andrew.cmu.edu>
Cc: Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

James Bruce wrote:
> moving 1MB of attributes/streams just to change a 20 character
> author attribute seems a bit silly.

That's what we do now.  Try editing an MP3's id tags.

> If it should be in userspace, we could take the OS-X approach of using 
> directories for everything, and the "data" that would be in a hybrid 
> directory-file is a specially named file under that directory.  Programs 
> for instance are actually directories, with the elf file underneath it.  
> When you click on the "directory-program" in the gui it runs the 
> associated elf file rather than opening the directory.  I think that 
> approach is promising, but so few unix programs have any indirection for 
> file access it'd be hell to teach them all how it works.

The interfaces we've been talking about are very close to that.  The
indirection is automatic: instead of a document (or program) looking
like a directory, it'll look like a file, and reading (or executing)
the file will do the indirection, with kernel control (and so
consistency and performance) via an appropriate flat<->structured
relation helper.

-- Jamie
