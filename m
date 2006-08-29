From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 16:38:14 +0200
Message-ID: <20060829143814.GA21868@hello-penguin.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <op.te1sixuycigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: PFC <lists@peufeu.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

On Tue, Aug 29, 2006 at 03:45:59PM +0200, PFC wrote:
> 	Anyone has a bench for lzf ?

It's easy, try something like:

wget http://www.goof.com/pcg/marc/data/liblzf-1.6.tar.gz
tar zxvpf liblzf-1.6.tar.gz
cd liblzf-1.6
configure && make

Now you have a small lzf binary that you can use for testing:
cat bigfile|./lzf > bigfile.lzf

use "./lzf -d" for decompression tests

-- 

  ciao - 
    Stefan
