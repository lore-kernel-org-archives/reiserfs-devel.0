From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Reiser4 und LZO compression
Date: Thu, 31 Aug 2006 17:14:32 +0200
Message-ID: <194f62550608310814j9d9fb4fy78df91554b5365ae@mail.gmail.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>
	 <44F4979E.9020101@namesys.com> <44F49D7F.3010403@slaphack.com>
	 <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca>
	 <44F4C2C9.3070101@slaphack.com> <op.te3aq1uwcigqcu@apollo13>
	 <44F5C1D7.5060904@namesys.com> <44F5C313.40905@namesys.com>
	 <194f62550608310232h3425638dx9876abb7f0f88422@mail.gmail.com>
	 <44F6CF6F.5010605@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F6CF6F.5010605@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi Edward,

Thanks a lot for answering.

> Compression is going in flush time and there can be more then
> one flush thread that processes the same transaction atom.
> Decompression is going in the context of readpage/readpages.
> So if you mean per file, then yes for compression and no for
> decompression.
So the parallelism is not really explicit, more or less a bit accidental.
Are threads in the kernel possible - and if yes how large is the
typical workload of stuff which can be decompressed? I guess for
several hundered kb using more than one thread could speed things up
quite a bit?

lg Clemens
