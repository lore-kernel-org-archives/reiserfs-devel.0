From: Roland =?iso-8859-1?q?H=E4der?= <webmaster@autoinstaller.de>
Subject: Re: Fwd: Bad root block 0
Date: Mon, 8 Sep 2003 17:15:01 +0200
Message-ID: <200309081715.01529.webmaster@autoinstaller.de>
References: <200309071446.32049.webmaster@autoinstaller.de> <20030908095142.GB18422@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030908095142.GB18422@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 08 September 2003 11:51 am, Oleg Drokin wrote:
> Hello!
Hello,
>
> Hm. Can you tell us what kernel version you were using at the time of
> writing your files to encrypted device?
Opps: Vanilla 2.4.21 with cryptoloop (not patched, it's compiled alone 
and installed into /lib/modules/2.4.21/xxxxx)

> What do you mean by extracting "missing metadata"?
debugreiserfs can extract the metadata of a rfs-partition. With 
"missing" I mean that reiserfschk tells me that there's no metadata 
available. So here's a strange thing: debugreiserfs found it, but 
reiserfschk not...

> "unlimited cash"? Wow!
Nope, not *really* unlimited cash... :)

Bye,
  Roland

