From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Data-Logging Progess?!  (was: Oops with in nfsd - 2.4.19-pre6)
Date: Thu, 28 Nov 2002 11:18:37 +0100
Message-ID: <20021128111837.20792d49.philippe.gramoulle@mmania.com>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny>
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
	<1037219001.21957.151.camel@tiny>
	<1037241197.288.206.camel@tiny>
	<3DE530F6.3010205@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DE530F6.3010205@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list@namesys.com, mason@suse.com


Hi Manuel,

We've been using the journal overflow patch sent by Chris since Nov 14th, on a busy
file server and up to this weekend it proved to solve our problems.

But this weekend we experienced 2 crashes on this server so there still might
be some problems to be fixed. I guess that this justifies the "experimental" status
of this patch.

In our case , we use :

a) NFS
b) quotas ( as soon as a patch will be ready for this kernel version )
c) data=journal

Thanks,

Philippe

On Wed, 27 Nov 2002 21:54:14 +0100
Manuel Krause <manuel.krause@mb.tu-ilmenau.de> wrote:

  |  Hi!
  |  
  |   Are there any news regarding the data-logging code? Issues that justify 
  |   the "experimental" status (e.g. root-fs mounting only with 
  |   rootflags=data=...) or are there new fixes?!
  |  
  |   Originally I wondered why the patch you, Chris, sent to the list isn't 
  |   on your ftp servers directory for kernel 2.4.20 until now.
  |  
  |   My late questions regarding this patch:
  |   Does this patch make sense for people _not_ using
  |   a) nfs
  |   b) quota
  |   c) data=journal
  |   at all ?!
  |  
  |   I applied this patch to 2.4.20-rc[1,3] since you posted it and it works 
  |   well for me. I only use the data=ordered mode and nothing of [a,b,c].
  |  
  |  
  |   Thanks,
  |  
  |   Manuel.
