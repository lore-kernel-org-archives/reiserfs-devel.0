From: Oleg Drokin <green@namesys.com>
Subject: Re: Re: Strange Syslog messages - this is NOT an isolated case!
Date: Mon, 30 Sep 2002 15:09:40 +0400
Message-ID: <20020930150940.A26589@namesys.com>
References: <20020930125753.5d05d7ea.fionn@unix-ag.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020930125753.5d05d7ea.fionn@unix-ag.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fionn Behrens <fionn@unix-ag.org>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 30, 2002 at 12:57:53PM +0200, Fionn Behrens wrote:

> * reiserfsck --fix-fixable claims there are NO errors.
> * I have 2.4.19, too
> * I am using reiserfsprogs 3.6.3 from the Debian
>   reiserfsprogs 3.6.3-1 package.

Hm. Can you try reiserfsprogs 3.6.4-pre2 from our ftp server please?
( ftp://ftp.namesys.com/pub/reiserfsprogs/pre )

> P.P.S: As a side note: Is there _any_ way to convert old 3.5/rupasov volumes
>        to newer formats without copying half a terabyte over and over again?

There is no way to change hash, you can convert v3.5 fs to v3.6 one
by using -o conv swith to the mount command (only once).
Note that while FS will become v3.6 one and all new files will be created
in new format, all the old files will remain in old format until you remove and
recreate them.
And of course there is always a way to have whatever feature/tool you need
for reiserfs:
http://namesys.com/support.html

Bye,
    Oleg
